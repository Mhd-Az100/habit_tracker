
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'datepicker_cubit.freezed.dart';
part 'datepicker_state.dart';                                                                                                      

@injectable
class DatePickerCubit extends Cubit<DatePickerState> {
  DatePickerCubit() : super(DatePickerState.initial());

  void selectDate(DateTime selectedDate) {
    emit(state.copyWith(selectedDate: selectedDate));
  }

}