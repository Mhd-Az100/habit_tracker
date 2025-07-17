import 'package:habit_tracker/features/habit/domain/entities/habit_stats_entity.dart';
import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHabitStatsUseCase {
  final HabitRepository _repository;

  GetHabitStatsUseCase(this._repository);

  Future<HabitStatsEntity> call(String habitId) async {
    final completions = await _repository.getCompletionsForHabit(habitId);

    if (completions.isEmpty) {
      return HabitStatsEntity(
        totalCompletions: 0,
        currentStreak: 0,
        longestStreak: 0,
      );
    }

    final sorted = completions.map((e) => e.date).toList()..sort();

    int total = sorted.length;
    int currentStreak = 1;
    int longestStreak = 1;

    for (int i = sorted.length - 2; i >= 0; i--) {
      final current = sorted[i];
      final next = sorted[i + 1];

      if (next.difference(current).inDays == 1) {
        currentStreak++;
      } else {
        break;
      }
    }

    int streak = 1;
    for (int i = 1; i < sorted.length; i++) {
      if (sorted[i].difference(sorted[i - 1]).inDays == 1) {
        streak++;
        if (streak > longestStreak) longestStreak = streak;
      } else {
        streak = 1;
      }
    }

    return HabitStatsEntity(
      totalCompletions: total,
      currentStreak: currentStreak,
      longestStreak: longestStreak,
    );
  }
}
