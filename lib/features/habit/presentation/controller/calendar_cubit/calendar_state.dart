part of 'calendar_cubit.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    @Default([]) List<HabitEntity> habitsOfDay,
    DateTime? selectedDate,
  }) = _CalendarState;
}
