import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CompleteHabitUseCase {
  final HabitRepository _repository;

  CompleteHabitUseCase(this._repository);

  Future<void> call(String habitId, DateTime date) async {
    final completions = await _repository.getCompletionsForHabit(habitId);

    final alreadyCompleted = completions.any((c) =>
      isSameDay(c.date, date),
    );

    if (!alreadyCompleted) {
      await _repository.completeHabit(habitId, date);
    }
  }

  bool isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}
