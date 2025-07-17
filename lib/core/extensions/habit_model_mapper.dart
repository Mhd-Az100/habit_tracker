import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';

extension HabitModelMapper on HabitModel {
  HabitEntity toEntity() {
    return HabitEntity(
      id: id,
      name: name,
      description: description,
      createdAt: createdAt,
      // Correctly map recurrence properties to the RecurrenceDetailsEntity
      recurrenceType: recurrenceType, // Direct map to the entity's type
      daysOfWeek: daysOfWeek, // Direct map
      everyXDays: everyXDays, // Direct map
      completionDates: completionDates, // Correctly map the list of completion dates
    );
  }
}
