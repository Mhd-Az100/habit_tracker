import 'package:habit_tracker/features/habit/data/models/habit_completion_model.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_completion_entity.dart';


extension HabitCompletionModelMapper on HabitCompletionModel {
  HabitCompletionEntity toEntity() {
    return HabitCompletionEntity(
      id: id,
      habitId: habitId,
      date: date,
      isCompleted: isCompleted,
    );
  }
}
