part of 'add_habit_cubit.dart';

@freezed
class AddHabitFormState with _$AddHabitFormState {
  const factory AddHabitFormState({
   @Default('') String name,
   @Default('') String description,
   @Default(RecurrenceType.daily) RecurrenceType recurrenceType,
   @Default([]) List<int> daysOfWeek,
   @Default('') String everyXDays,
   @Default(false) bool isValid,
   @Default(false) bool isEdit,

  }) = _AddHabitFormState;
}