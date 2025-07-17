import 'package:habit_tracker/features/habit/data/datasources/habit_local_datasource.dart';
import 'package:habit_tracker/features/habit/data/models/habit_completion_model.dart';
import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class HabitLocalDataSourceImpl implements HabitLocalDataSource {
  final Box<HabitModel> _habitBox;
  final Box<HabitCompletionModel> _completionBox;

  HabitLocalDataSourceImpl(this._habitBox, this._completionBox);

  @override
  Future<List<HabitModel>> getAll() async => _habitBox.values.toList();

  @override
  Future<void> save(HabitModel habit) async =>
      await _habitBox.put(habit.id, habit);

  @override
  Future<void> update(HabitModel habit) async =>
      await _habitBox.put(habit.id, habit);

  @override
  Future<void> delete(String id) async => await _habitBox.delete(id);

  @override
  Future<HabitModel?> getById(String id) async => _habitBox.get(id);

  @override
  Future<void> completeHabit(String habitId, DateTime date) async {
    final uuid = const Uuid();

    final completion = HabitCompletionModel(
      id: uuid.v4(),
      habitId: habitId,
      date: date,
      isCompleted: true,
    );

    await _completionBox.put(completion.id, completion);
  }

  @override
  Future<List<HabitCompletionModel>> getCompletionsForHabit(
    String habitId,
  ) async {
    return _completionBox.values.where((c) => c.habitId == habitId).toList();
  }
}
