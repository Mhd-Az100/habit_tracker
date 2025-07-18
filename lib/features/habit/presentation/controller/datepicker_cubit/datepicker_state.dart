part of 'datepicker_cubit.dart';

@freezed
class DatePickerState with _$DatePickerState {
  const factory DatePickerState({
    required DateTime selectedDate,
  }) = _DatePickerState;

  factory DatePickerState.initial() => DatePickerState(
        selectedDate: DateTime.now(),
      );
}