import 'package:flutter/material.dart';
import 'package:habit_tracker/core/enums/day_completion_status.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  final DateTime focusedDay;
  final DateTime selectedDay;
  final Map<DateTime, DayCompletionStatus> dayStatuses;
  final void Function(DateTime selectedDay, DateTime focusedDay) onDaySelected;
  final void Function(DateTime focusedDay) onPageChanged;

  const CalendarWidget({
    super.key,
    required this.focusedDay,
    required this.selectedDay,
    required this.dayStatuses,
    required this.onDaySelected,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TableCalendar(
        availableGestures: AvailableGestures.horizontalSwipe,
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: focusedDay,
        selectedDayPredicate: (day) => isSameDay(selectedDay, day),
        onDaySelected: onDaySelected,
        calendarFormat: CalendarFormat.month,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleCentered: true,
        ),
        onPageChanged: onPageChanged,
        
        calendarBuilders: CalendarBuilders(
          defaultBuilder: (context, day, focusedDay) {
            final status =
                dayStatuses[day.toNormalizedDateTime()] ??
                DayCompletionStatus.noHabitsDue;
            Color? markerColor;
            TextStyle? dayTextStyle;
      
            switch (status) {
              case DayCompletionStatus.allCompleted:
                markerColor = Colors.green.shade100;
                dayTextStyle = const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                );
                break;
              case DayCompletionStatus.partiallyCompleted:
                markerColor = Colors.orange.shade100;
                dayTextStyle = const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                );
                break;
              case DayCompletionStatus.noneCompleted:
                markerColor = Colors.redAccent.shade100;
                dayTextStyle = const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                );
                break;
              case DayCompletionStatus.noHabitsDue:
                markerColor = null;
                dayTextStyle = Theme.of(context).textTheme.bodyMedium;
                break;
              case DayCompletionStatus.futureDate:
                markerColor = Theme.of(
                  context,
                ).colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);
                break;
            }
      
            Color? cellBackgroundColor = markerColor;
      
            return Container(
              margin: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: isSameDay(day, selectedDay)
                    ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.2)
                    : cellBackgroundColor,
                shape: BoxShape.circle,
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      '${day.day}',
                      style: dayTextStyle?.copyWith(
                        fontWeight: isSameDay(day, selectedDay)
                            ? FontWeight.bold
                            : dayTextStyle.fontWeight,
                        color:
                            isSameDay(day, selectedDay) &&
                                status != DayCompletionStatus.futureDate
                            ? Theme.of(context).colorScheme.onPrimary
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
    );
  }
}
