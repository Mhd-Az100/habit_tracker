import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/enums/day_completion_status.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/controller/calendar_cubit/calendar_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habits_list.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HabitBloc, HabitState>(
        listener: (context, habitState) {
          habitState.whenOrNull(
            loaded: (allHabits, _, __) {
              context.read<CalendarCubit>().updateCalendarStatuses(allHabits);
            },
          );
        },
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            if (state.errorMessage != null) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: TableCalendar(
                    availableGestures: AvailableGestures.horizontalSwipe,
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: state.focusedDay,
                    selectedDayPredicate: (day) =>
                        isSameDay(state.selectedDay, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      context.read<CalendarCubit>().onDaySelected(
                        selectedDay,
                        focusedDay,
                      );
                    },
                    calendarFormat: CalendarFormat.month,
                    headerStyle: const HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                    ),
                    onPageChanged: (focusedDay) {
                      context.read<CalendarCubit>().onPageChanged(focusedDay);
                    },
                    calendarBuilders: CalendarBuilders(
                      defaultBuilder: (context, day, focusedDay) {
                        final status =
                            state.dayStatuses[day.toNormalizedDateTime()] ??
                            DayCompletionStatus.noHabitsDue;
                        Color? markerColor;
                        TextStyle? dayTextStyle;

                        switch (status) {
                          case DayCompletionStatus.allCompleted:
                            markerColor = Colors.green;
                            dayTextStyle = const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            );
                            break;
                          case DayCompletionStatus.partiallyCompleted:
                            markerColor = Colors.orange;
                            dayTextStyle = const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            );
                            break;
                          case DayCompletionStatus.noneCompleted:
                            markerColor = Colors.redAccent;
                            dayTextStyle = const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            );
                            break;
                          case DayCompletionStatus.noHabitsDue:
                            markerColor = null;
                            dayTextStyle = Theme.of(
                              context,
                            ).textTheme.bodyMedium;
                            break;
                          case DayCompletionStatus.futureDate:
                            markerColor = Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest
                                .withValues(alpha: 0.3);
                            dayTextStyle = TextStyle(
                              color: Theme.of(
                                context,
                              ).textTheme.bodySmall?.color,
                            );
                            break;
                        }

                        Color? cellBackgroundColor = markerColor;

                        return Container(
                          margin: const EdgeInsets.all(4.0),
                          decoration: BoxDecoration(
                            color: isSameDay(day, state.selectedDay)
                                ? Theme.of(
                                    context,
                                  ).colorScheme.primary.withValues(alpha: 0.2)
                                : cellBackgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Text(
                                  '${day.day}',
                                  style: dayTextStyle?.copyWith(
                                    fontWeight:
                                        isSameDay(day, state.selectedDay)
                                        ? FontWeight.bold
                                        : dayTextStyle.fontWeight,
                                    color:
                                        isSameDay(day, state.selectedDay) &&
                                            status !=
                                                DayCompletionStatus.futureDate
                                        ? Theme.of(
                                            context,
                                          ).colorScheme.onPrimary
                                        : dayTextStyle.color,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                //
                HabitListView(selectedDate: state.selectedDay),
              ],
            );
          },
        ),
      ),
    );
  }
}
