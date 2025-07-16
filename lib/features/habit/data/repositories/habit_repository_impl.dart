import 'package:habit_tracker/core/extensions/habit_completion_model_mapper.dart';
import 'package:habit_tracker/core/extensions/habit_entity_mapper.dart';
import 'package:habit_tracker/core/extensions/habit_model_mapper.dart';
import 'package:habit_tracker/features/habit/data/datasources/habit_local_datasource.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_completion_entity.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HabitRepository)
class HabitRepositoryImpl implements HabitRepository {
  final HabitLocalDataSource local;

  HabitRepositoryImpl(this.local);

  @override
  Future<void> addHabit(HabitEntity habit) async {
    final model = habit.toModel();
    await local.save(model);
  }

  @override
  Future<void> deleteHabit(String id) async {
    await local.delete(id);
  }

  @override
  Future<List<HabitEntity>> getAllHabits() async {
    final models = await local.getAll();
    return models.map((e) => e.toEntity()).toList();
  }

  @override
  Future<void> updateHabit(HabitEntity habit) async {
    final model = habit.toModel();
    await local.update(model);
  }

  @override
  Future<HabitEntity?> getHabitById(String id) async {
    final model = await local.getById(id);
    return model?.toEntity();
  }

  @override
  Future<void> completeHabit(String habitId, DateTime date) async {
    await local.completeHabit(habitId, date);
  }

  @override
Future<List<HabitCompletionEntity>> getCompletionsForHabit(String habitId) async {
  final completions = await local.getCompletionsForHabit(habitId);
   return completions.map((c) => c.toEntity()).toList();
}
}