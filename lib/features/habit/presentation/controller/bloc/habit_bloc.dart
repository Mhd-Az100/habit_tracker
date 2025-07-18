import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/domain/usecases/add_habit_usecase.dart';
import 'package:habit_tracker/features/habit/domain/usecases/complete_habit_usecase.dart';
import 'package:habit_tracker/features/habit/domain/usecases/delete_habit_usecase.dart';
import 'package:habit_tracker/features/habit/domain/usecases/get_all_habits_usecase.dart';
import 'package:habit_tracker/features/habit/domain/usecases/get_habit_by_id_usecase.dart';
import 'package:habit_tracker/features/habit/domain/usecases/get_habit_stats_usecase.dart';
import 'package:habit_tracker/features/habit/domain/usecases/update_habit_usecase.dart';
import 'package:habit_tracker/features/habit/presentation/utils/habits_utils.dart';
import 'package:injectable/injectable.dart';

part 'habit_bloc.freezed.dart';
part 'habit_event.dart';
part 'habit_state.dart';

@Injectable()
class HabitBloc extends Bloc<HabitEvent, HabitState> {
  final GetAllHabitsUseCase getAllHabits;
  final AddHabitUseCase addHabit;
  final UpdateHabitUseCase updateHabit;
  final DeleteHabitUseCase deleteHabit;
  final GetHabitByIdUseCase getHabitById;
  final CompleteHabitUseCase completeHabit;
  final GetHabitStatsUseCase getHabitStats;

  HabitBloc({
    required this.getAllHabits,
    required this.addHabit,
    required this.updateHabit,
    required this.deleteHabit,
    required this.getHabitById,
    required this.completeHabit,
    required this.getHabitStats,
  }) : super(const HabitState.initial()) {
    on<_LoadHabits>((event, emit) async {
      emit(HabitState.loading());
      final allHabits = await getAllHabits();
      _emitLoadedStateWithFilteredHabits(
        emit,
        allHabits,
        _getCurrentSelectedDate(),
      );
    });

    on<_AddHabit>((event, emit) async {
      await addHabit(event.habit);
      final allHabits = await getAllHabits();
      _emitLoadedStateWithFilteredHabits(
        emit,
        allHabits,
        _getCurrentSelectedDate(),
      );
    });

    on<_UpdateHabit>((event, emit) async {
      await updateHabit(event.habit);
      final allHabits = await getAllHabits();
      _emitLoadedStateWithFilteredHabits(
        emit,
        allHabits,
        _getCurrentSelectedDate(),
      );
    });

    on<_DeleteHabit>((event, emit) async {
      await deleteHabit(event.id);
      final allHabits = await getAllHabits();
      _emitLoadedStateWithFilteredHabits(
        emit,
        allHabits,
        _getCurrentSelectedDate(),
      );
    });

    on<_GetHabitById>((event, emit) async {
      emit(HabitState.loading());
      final habit = await getHabitById(event.id);
      if (habit != null) {
      } else {
        emit(HabitState.error("Habit not found"));
      }
    });

    on<_CompleteHabit>((event, emit) async {
      await completeHabit(event.habitId, event.date);
      final allHabits = await getAllHabits();
      _emitLoadedStateWithFilteredHabits(
        emit,
        allHabits,
        _getCurrentSelectedDate(),
      );
    });

    on<_FilterHabitsByDate>((event, emit) {
      final currentAllHabits =
          state.whenOrNull(loaded: (all, _, __) => all) ?? [];
      _emitLoadedStateWithFilteredHabits(emit, currentAllHabits, event.date);
    });
  }

  // --- Private Helper to Filter Habits ---
  List<HabitEntity> _filterHabitsByDate(
    List<HabitEntity> allHabits,
    DateTime date,
  ) {
    return allHabits.where((habit) => HabitsUtils.isHabitDueOnDay(habit, date)).toList();
  }


  // --- Helper to get the current selected date from state or default to today ---
  DateTime _getCurrentSelectedDate() {
    return state.when(
      initial: () => DateTime.now().toNormalizedDateTime(),
      loading: () => DateTime.now().toNormalizedDateTime(),
      loaded: (_, __, selectedDate) => selectedDate,
      error: (_) => DateTime.now().toNormalizedDateTime(), 
    );
  }

  // --- Helper to emit a consistent loaded state with filtered habits ---
  void _emitLoadedStateWithFilteredHabits(
    Emitter<HabitState> emit,
    List<HabitEntity> allHabits,
    DateTime selectedDate,
  ) {
    final habitsOfDay = _filterHabitsByDate(allHabits, selectedDate);
    emit(
      HabitState.loaded(
        allHabits: allHabits,
        habitsOfDay: habitsOfDay,
        selectedDate: selectedDate,
      ),
    );
  }
}


