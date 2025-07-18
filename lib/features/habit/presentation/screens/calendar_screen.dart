import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/enums/day_completion_status.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
// import 'package:date_picker_plus/date_picker_plus.dart';
// import 'package:habit_tracker/core/extensions/date_time_extension.dart';
// import 'package:habit_tracker/features/habit/presentation/widgets/habits_list.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habits_list.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
  }

  bool _isHabitDueOnDay(HabitEntity habit, DateTime day) {
    final normalizedDay = day.toNormalizedDateTime();
    final normalizedCreatedAt = habit.createdAt.toNormalizedDateTime();

    // Rule 1: A habit cannot be due before its creation date.
    if (normalizedDay.isBefore(normalizedCreatedAt)) {
      return false;
    }

    // Rule 2: Apply the recurrence logic for dates on or after createdAt.
    switch (habit.recurrenceType) {
      case RecurrenceType.daily:
        return true; // It's daily, and we've already checked it's after creation date.
      case RecurrenceType.weekly:
        // Check if the day's weekday matches one of the habit's specified days.
        return habit.daysOfWeek != null &&
            habit.daysOfWeek!.contains(day.weekday);
      case RecurrenceType.everyXDays:
        if (habit.everyXDays == null || habit.everyXDays! <= 0) return false;
        // Calculate the difference in days from the creation date to the target day.
        // If this difference is a multiple of everyXDays, it's due.
        final diffDays = normalizedDay.difference(normalizedCreatedAt).inDays;
        return (diffDays % habit.everyXDays!) == 0;
    }
  }

  DayCompletionStatus _getOverallDayStatus(
    DateTime day,
    List<HabitEntity> allHabits,
  ) {
    final normalizedToday = DateTime.now()
        .toNormalizedDateTime(); // Get today without time
    final normalizedDay = day
        .toNormalizedDateTime(); // Get the day without time

    // 1. Handle Future Dates: If the day is in the future, return futureDate status.
    if (normalizedDay.isAfter(normalizedToday)) {
      return DayCompletionStatus.futureDate;
    }

    // 2. Proceed with due/completed logic only for past or current dates
    int habitsDue = 0;
    int habitsCompleted = 0;

    for (var habit in allHabits) {
      if (_isHabitDueOnDay(habit, day)) {
        habitsDue++;
        if (habit.completionDates.contains(day.toNormalizedDateString())) {
          habitsCompleted++;
        }
      }
    }

    if (habitsDue == 0) {
      return DayCompletionStatus.noHabitsDue;
    } else if (habitsCompleted == habitsDue) {
      return DayCompletionStatus.allCompleted;
    } else if (habitsCompleted > 0 && habitsCompleted < habitsDue) {
      return DayCompletionStatus.partiallyCompleted;
    } else {
      // habitsCompleted == 0 and habitsDue > 0
      return DayCompletionStatus.noneCompleted;
    }
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HabitBloc, HabitState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(child: Text('Loading habits...')),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (allHabits) {
              return CustomScrollView(
                // --- KEY CHANGE: Use CustomScrollView ---
                slivers: [
                  // --- Calendar as SliverToBoxAdapter ---
                  SliverToBoxAdapter(
                    child: TableCalendar(
                      availableGestures: AvailableGestures.horizontalSwipe,
                      firstDay: DateTime.utc(2020, 1, 1),
                      lastDay: DateTime.utc(2030, 12, 31),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),
                      onDaySelected: _onDaySelected,
                      calendarFormat: CalendarFormat.month,
                      headerStyle: const HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                      ),
                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },
                      calendarBuilders: CalendarBuilders(
                        defaultBuilder: (context, day, focusedDay) {
                          final status = _getOverallDayStatus(day, allHabits);
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
                              ); // Contrast for orange
                              break;
                            case DayCompletionStatus.noneCompleted:
                              markerColor = Colors.red;
                              dayTextStyle = const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              );
                              break;
                            case DayCompletionStatus.noHabitsDue:
                              markerColor =
                                  null; // No background fill for days with no due habits
                              dayTextStyle = Theme.of(
                                context,
                              ).textTheme.bodyMedium; // Default text color
                              break;
                            case DayCompletionStatus
                                .futureDate: // NEW: Styling for future dates
                              markerColor = Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest
                                  .withValues(alpha: 0.3); // Subtle background
                              dayTextStyle = TextStyle(
                                color: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.color,
                              ); // Dim text
                              break;
                          }

                          // Determine background color for the day cell
                          Color? cellBackgroundColor = markerColor;
                          if (status == DayCompletionStatus.noHabitsDue) {
                            cellBackgroundColor = null; // No background color
                          } else if (status == DayCompletionStatus.futureDate) {
                            cellBackgroundColor = Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest
                                .withValues(alpha: 0.3);
                          }

                          return Container(
                            margin: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              // Highlight selected day on top of other styling
                              color: isSameDay(day, _selectedDay)
                                  ? Theme.of(
                                      context,
                                    ).colorScheme.primary.withOpacity(0.2)
                                  : cellBackgroundColor, // Use determined background color
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              children: [
                                Center(
                                  child: Text(
                                    '${day.day}',
                                    style: dayTextStyle?.copyWith(
                                      // Apply the determined text style
                                      fontWeight: isSameDay(day, _selectedDay)
                                          ? FontWeight.bold
                                          : dayTextStyle.fontWeight,
                                      // Ensure text color contrasts with selected highlight if needed
                                      color:
                                          isSameDay(day, _selectedDay) &&
                                              status !=
                                                  DayCompletionStatus.futureDate
                                          ? Theme.of(context)
                                                .colorScheme
                                                .onPrimary // Example: white text on selected primary
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
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 16),
                  ), // Spacer for the CustomScrollView
                  // --- Display Habits for the Selected Day (now a SliverList) ---
                  // It's important that HabitListView itself now returns a SliverList.
                  HabitListView(selectedDate: _selectedDay),
                ],
              );
            },
            habitLoaded: (_) =>
                const SliverFillRemaining(child: SizedBox.shrink()),
            error: (msg) =>
                SliverFillRemaining(child: Center(child: Text('Error: $msg'))),
            statsLoaded: (_) =>
                const SliverFillRemaining(child: SizedBox.shrink()),
          );
        },
      ),
    );
  }
}
