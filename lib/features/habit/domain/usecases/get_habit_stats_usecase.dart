import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/features/habit/data/models/overall_habit_statistics.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/presentation/utils/habits_utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetHabitStatsUseCase {
  @factoryMethod
  OverallHabitStatisticsModel call(List<HabitEntity> allHabits) {
    final now = DateTime.now().toNormalizedDateTime();
    // Calculate start of the last 7 days (including today)
    final sevenDaysAgo = now.subtract(const Duration(days: 6));
    // Calculate start of the last 30 days (including today)
    final thirtyDaysAgo = now.subtract(const Duration(days: 29));

    int totalHabitsDueOverall = 0;
    int totalHabitsCompletedOverall = 0;
    final Set<DateTime> distinctCompletedDaysLast7 = {};
    final Set<DateTime> distinctCompletedDaysLast30 = {};

    for (var habit in allHabits) {
      // Calculate overall completion for each habit from its creation date to today
      DateTime currentDay = habit.createdAt.toNormalizedDateTime();
      while (!currentDay.isAfter(now)) {
        if (HabitsUtils.isHabitDueOnDay(habit, currentDay)) {
          totalHabitsDueOverall++;
          if (habit.completionDates.contains(currentDay.toNormalizedDateString())) {
            totalHabitsCompletedOverall++;
          }
        }
        currentDay = currentDay.add(const Duration(days: 1));
      }

      // Populate distinct completed days for last 7/30
      for (var completionDateString in habit.completionDates) {
        final completedDay = DateTime.parse(completionDateString).toNormalizedDateTime();

        // Check if the completed day is within the last 7 days range (inclusive)
        if ((completedDay.isAfter(sevenDaysAgo) || completedDay.isAtSameMomentAs(sevenDaysAgo)) &&
            (completedDay.isBefore(now) || completedDay.isAtSameMomentAs(now))) {
          distinctCompletedDaysLast7.add(completedDay);
        }

        // Check if the completed day is within the last 30 days range (inclusive)
        if ((completedDay.isAfter(thirtyDaysAgo) || completedDay.isAtSameMomentAs(thirtyDaysAgo)) &&
            (completedDay.isBefore(now) || completedDay.isAtSameMomentAs(now))) {
          distinctCompletedDaysLast30.add(completedDay);
        }
      }
    }

    // Calculate completion rate
    final double completionRate = totalHabitsDueOverall > 0
        ? (totalHabitsCompletedOverall / totalHabitsDueOverall) * 100
        : 0.0;

    return OverallHabitStatisticsModel(
      completionRate: double.parse(completionRate.toStringAsFixed(2)),
      daysCompletedLast7Days: distinctCompletedDaysLast7.length,
      daysCompletedLast30Days: distinctCompletedDaysLast30.length,
    );
  }
}