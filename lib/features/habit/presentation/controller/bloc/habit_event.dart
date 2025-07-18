part of 'habit_bloc.dart';

@freezed
class HabitEvent with _$HabitEvent {
  const factory HabitEvent.loadHabits() = _LoadHabits;
  const factory HabitEvent.filterHabitsByDate(DateTime date) = _FilterHabitsByDate;
  const factory HabitEvent.addHabit(HabitEntity habit) = _AddHabit;
  const factory HabitEvent.updateHabit(HabitEntity habit) = _UpdateHabit;
  const factory HabitEvent.deleteHabit(String id) = _DeleteHabit;
  const factory HabitEvent.getHabitById(String id) = _GetHabitById;
  const factory HabitEvent.completeHabit(String habitId, DateTime date) = _CompleteHabit;
  const factory HabitEvent.getHabitState(String habitId) = _GetHabitState;

}