// Function to check if a habit is due on a specific day
import 'package:habit_tracker/core/enums/day_completion_status.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';

class HabitsUtils {
  static bool isHabitDueOnDay(HabitEntity habit, DateTime day) {
    final normalizedDay = day.toNormalizedDateTime();
    final normalizedCreatedAt = habit.createdAt.toNormalizedDateTime();

    if (normalizedDay.isBefore(normalizedCreatedAt)) {
      return false;
    }

    switch (habit.recurrenceType) {
      case RecurrenceType.daily:
        return true;
      case RecurrenceType.weekly:
        return habit.daysOfWeek?.contains(day.weekday) ?? false;
      case RecurrenceType.everyXDays:
        if (habit.everyXDays == null || habit.everyXDays! <= 0) {
          return false;
        }
        final diffDays = normalizedDay.difference(normalizedCreatedAt).inDays;
        return (diffDays % habit.everyXDays!) == 0;
    }
  }

  // Function to get overall day status for calendar markers
  static DayCompletionStatus getOverallDayStatus(
      DateTime day, List<HabitEntity> allHabits) {
    final normalizedToday = DateTime.now().toNormalizedDateTime();
    final normalizedDay = day.toNormalizedDateTime();

    if (normalizedDay.isAfter(normalizedToday)) {
      return DayCompletionStatus.futureDate;
    }

    int habitsDue = 0;
    int habitsCompleted = 0;

    for (var habit in allHabits) {
      if (isHabitDueOnDay(habit, day)) {
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
}

