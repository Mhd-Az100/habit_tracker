import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CompleteHabitUseCase {
  final HabitRepository _repository;

  CompleteHabitUseCase(this._repository);

  Future<void> call(String habitId, DateTime date) async {
    final habit = await _repository.getHabitById(habitId);

    if (habit == null) {
      throw Exception('Habit not found');
    }

    final normalizedDate = date.toNormalizedDateString();

    final updatedCompletionDates = List<String>.from(habit.completionDates);

    if (updatedCompletionDates.contains(normalizedDate)) {
      updatedCompletionDates.remove(normalizedDate); // Mark as uncompleted
    } else {
      updatedCompletionDates.add(normalizedDate); // Mark as completed
    }

    final updatedHabit = habit.copyWith(
      completionDates: updatedCompletionDates,
    );

    await _repository.updateHabit(updatedHabit);
  }
}

