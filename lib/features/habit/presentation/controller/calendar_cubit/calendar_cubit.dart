import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/core/enums/day_completion_status.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/utils/habits_utils.dart';
import 'package:injectable/injectable.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_cubit.freezed.dart';
part 'calendar_state.dart';

@injectable
class CalendarCubit extends Cubit<CalendarState> {
  final HabitBloc _habitBloc;

  CalendarCubit({required HabitBloc habitBloc})
      : _habitBloc = habitBloc,
        super(CalendarState.initial()) {
    _init();
  }

  void _init() {
    final now = DateTime.now().toNormalizedDateTime();
    emit(state.copyWith(selectedDay: now, focusedDay: now));
    _habitBloc.state.whenOrNull(
      initial: () => _habitBloc.add(const HabitEvent.loadHabits()),
      loaded: (allHabits, _, __) => updateCalendarStatuses(allHabits),
    );
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(state.selectedDay, selectedDay)) {
      final normalizedSelectedDay = selectedDay.toNormalizedDateTime();
      final normalizedFocusedDay = focusedDay.toNormalizedDateTime();
      emit(state.copyWith(
        selectedDay: normalizedSelectedDay,
        focusedDay: normalizedFocusedDay,
      ));
    }
  }

  void onPageChanged(DateTime focusedDay) {
    if (!isSameDay(state.focusedDay, focusedDay)) {
      final normalizedFocusedDay = focusedDay.toNormalizedDateTime();
      emit(state.copyWith(focusedDay: normalizedFocusedDay));
      // _updateCalendarStatuses(
      //   _habitBloc.state.whenOrNull(loaded: (all, _, __) => all) ?? [],
      // );
    }
  }

  void updateCalendarStatuses(List<HabitEntity> allHabits) {
    final Map<DateTime, DayCompletionStatus> newDayStatuses = {};
    // Calculate range for the calendar grid, typically current month + surrounding weeks
    final firstDayOfMonth = DateTime(
      state.focusedDay.year,
      state.focusedDay.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      state.focusedDay.year,
      state.focusedDay.month + 1,
      0,
    );

    final startRange = firstDayOfMonth.subtract(const Duration(days: 1)); // 2 weeks before
    final endRange = lastDayOfMonth.add(const Duration(days: 1)); // 2 weeks after

    for (var d = startRange; d.isBefore(endRange); d = d.add(const Duration(days: 1))) {
      newDayStatuses[d.toNormalizedDateTime()] =
          HabitsUtils.getOverallDayStatus(d, allHabits);
    }

    emit(state.copyWith(dayStatuses: newDayStatuses, errorMessage: null));
  }

}

