import 'package:habit_tracker/core/dependency_injection/injection.dart';
import 'package:habit_tracker/features/habit/data/datasources/habit_local_datasource.dart';
import 'package:habit_tracker/features/habit/data/models/habit_completion_model.dart';
import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class HabitLocalDataSourceImpl implements HabitLocalDataSource {
  // Box to store HabitModel data
  final Box<HabitModel> _habitBox;

  // Box to store HabitCompletionModel data
  final Box<HabitCompletionModel> _completionBox;

  // Constructor
  HabitLocalDataSourceImpl(this._habitBox, this._completionBox);

  // Get all habits from storage
  @override
  Future<List<HabitModel>> getAll() async => _habitBox.values.toList();

  // Save habit to storage
  @override
  Future<void> save(HabitModel habit) async =>
      await _habitBox.put(habit.id, habit);

  // Update habit in storage
  @override
  Future<void> update(HabitModel habit) async =>
      await _habitBox.put(habit.id, habit);

  // Delete habit from storage
  @override
  Future<void> delete(String id) async => await _habitBox.delete(id);

  // Get habit by id from storage
  @override
  Future<HabitModel?> getById(String id) async => _habitBox.get(id);

  // Mark habit as completed in storage
  @override
  Future<void> completeHabit(String habitId, DateTime date) async {
    final uuid = getIt<Uuid>();

    final completion = HabitCompletionModel(
      id: uuid.v4(),
      habitId: habitId,
      date: date,
      isCompleted: true,
    );

    await _completionBox.put(completion.id, completion);
  }

  // Get all completions for habit from storage
  @override
  Future<List<HabitCompletionModel>> getCompletionsForHabit(
    String habitId,
  ) async {
    return _completionBox.values.where((c) => c.habitId == habitId).toList();
  }
}

