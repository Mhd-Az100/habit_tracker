import 'package:habit_tracker/features/habit/domain/entities/habit_completion_entity.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';

abstract class HabitRepository {
  Future<List<HabitEntity>> getAllHabits();
  Future<void> completeHabit(String habitId, DateTime date);
  Future<void> addHabit(HabitEntity habit);
  Future<void> updateHabit(HabitEntity habit);
  Future<void> deleteHabit(String id);
  Future<HabitEntity?> getHabitById(String id);
  Future<List<HabitCompletionEntity>> getCompletionsForHabit(String habitId);

}
