import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/domain/usecases/add_habit_use_case.dart';
import 'package:habit_tracker/features/habit/domain/usecases/complete_habit_use_case.dart';
import 'package:habit_tracker/features/habit/domain/usecases/delete_habit_use_case.dart';
import 'package:habit_tracker/features/habit/domain/usecases/get_all_habits_use_case.dart';
import 'package:habit_tracker/features/habit/domain/usecases/get_habit_by_id_use_case.dart';
import 'package:habit_tracker/features/habit/domain/usecases/update_habit_use_case.dart';
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

  HabitBloc({
    required this.getAllHabits,
    required this.addHabit,
    required this.updateHabit,
    required this.deleteHabit,
    required this.getHabitById,
    required this.completeHabit,
  }) : super(const HabitState.initial()) {
    on<_LoadHabits>((event, emit) async {
      emit(const HabitState.loading());
      final habits = await getAllHabits();
      emit(HabitState.loaded(habits));
    });

    on<_AddHabit>((event, emit) async {
      await addHabit(event.habit);
      final habits = await getAllHabits();
      emit(HabitState.loaded(habits));
    });

    on<_UpdateHabit>((event, emit) async {
      await updateHabit(event.habit);
      final habits = await getAllHabits();
      emit(HabitState.loaded(habits));
    });

    on<_DeleteHabit>((event, emit) async {
      await deleteHabit(event.id);
      final habits = await getAllHabits();
      emit(HabitState.loaded(habits));
    });

    on<_GetHabitById>((event, emit) async {
      emit(const HabitState.loading());
      final habit = await getHabitById(event.id);
      if (habit != null) {
        emit(HabitState.habitLoaded(habit));
      } else {
        emit(const HabitState.error("Habit not found"));
      }
    });

    on<_CompleteHabit>((event, emit) async {
      await completeHabit(event.habitId, event.date);
      final habits = await getAllHabits();
      emit(HabitState.loaded(habits));
    });
  }
}
