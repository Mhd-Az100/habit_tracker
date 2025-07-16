import 'package:habit_tracker/features/habit/data/models/habit_completion_model.dart';
import 'package:habit_tracker/features/habit/data/models/habit_model.dart';

abstract class HabitLocalDataSource {
  Future<List<HabitModel>> getAll();
  Future<void> save(HabitModel habit);
  Future<void> update(HabitModel habit);
  Future<void> delete(String id);
  Future<HabitModel?> getById(String id);
  Future<void> completeHabit(String habitId, DateTime date);
  Future<List<HabitCompletionModel>> getCompletionsForHabit(String habitId);

}

