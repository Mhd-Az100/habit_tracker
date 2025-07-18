import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:injectable/injectable.dart';

part 'datepicker_cubit.freezed.dart';
part 'datepicker_state.dart';

@injectable
class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit()
    : super(
        DatePickerState(selectedDate: DateTime.now().toNormalizedDateTime()),
      );

  void selectDate(DateTime newDate) {
    final normalizedDate = newDate.toNormalizedDateTime();
    if (state.selectedDate != normalizedDate) {
      emit(DatePickerState(selectedDate: normalizedDate));
    }
  }
}
