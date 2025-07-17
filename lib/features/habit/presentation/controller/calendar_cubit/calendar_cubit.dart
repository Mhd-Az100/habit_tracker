
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:injectable/injectable.dart';

part 'calendar_state.dart';
part 'calendar_state.freezed.dart';

@injectable
class CalendarCubit extends Cubit<CalendarState> {
  CalendarCubit() : super(CalendarState());

}