import 'package:habit_tracker/features/habit/data/models/habit_completion_model.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_completion_entity.dart';


extension HabitCompletionEntityMapper on HabitCompletionEntity {
  HabitCompletionModel toModel() {
    return HabitCompletionModel(
      id: id,
      habitId: habitId,
      date: date,
      isCompleted: isCompleted,
    );
  }
}
