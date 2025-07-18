import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/domain/usecases/get_habit_stats_usecase.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:injectable/injectable.dart';

part 'statistics_cubit.freezed.dart';
part 'statistics_state.dart';

@injectable
class StatisticsCubit extends Cubit<StatisticsState> {
 final HabitBloc _habitBloc;
  final GetHabitStatsUseCase _getHabitStatsUseCase;

  StatisticsCubit({
    required HabitBloc habitBloc,
    required GetHabitStatsUseCase getHabitStatsUseCase,
  }) : _habitBloc = habitBloc,
       _getHabitStatsUseCase = getHabitStatsUseCase,
       super(StatisticsState()) {
    _init();
  }

  void _init() {

    // Immediately calculate statistics based on current HabitBloc state
    _habitBloc.state.whenOrNull(
      loaded: (allHabits, _, __) {
        calculateStatistics(allHabits);
      },
      initial: () {
        // If HabitBloc is still in initial, trigger it to load habits
        _habitBloc.add(const HabitEvent.loadHabits());
      },
      error: (message) {
        emit(state.copyWith(errorMessage:'Failed to load initial habit data for statistics: $message'));
      }
    );
  }

  void calculateStatistics(List<HabitEntity> allHabits) {
    try {
      final stats = _getHabitStatsUseCase(allHabits);
      emit(state.copyWith(
        completionRate: stats.completionRate,
        daysCompletedLast7Days: stats.daysCompletedLast7Days,
        daysCompletedLast30Days: stats.daysCompletedLast30Days,
        isLoading: false,
        errorMessage: null,
      ));
    } catch (e) {
      emit(state.copyWith(errorMessage:'Error calculating statistics: ${e.toString()}'));
    }
  }
}