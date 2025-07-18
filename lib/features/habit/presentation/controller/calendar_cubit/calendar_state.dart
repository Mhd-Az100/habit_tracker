part of 'calendar_cubit.dart';

@freezed
class CalendarState with _$CalendarState {
  const factory CalendarState({
    required DateTime focusedDay,
    required DateTime selectedDay,
    required Map<DateTime, DayCompletionStatus> dayStatuses,
    String? errorMessage,
  }) = _CalendarState;

  factory CalendarState.initial() => CalendarState(
    focusedDay: DateTime.now(),
    selectedDay: DateTime.now(),
    dayStatuses: {},
  );
}
