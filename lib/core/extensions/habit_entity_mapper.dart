import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';


extension HabitEntityMapper on HabitEntity {
  HabitModel toModel() {
    return HabitModel(
      id: id,
      name: name,
      description: description,
      recurrenceType: recurrenceType, // Direct map
      // Map based on recurrenceType
      daysOfWeek: recurrenceType == RecurrenceType.weekly ? daysOfWeek : null,
      everyXDays: recurrenceType == RecurrenceType.everyXDays ? everyXDays : null,
      createdAt: createdAt,
      completionDates: completionDates, // Direct map, now a List<String>
    );
  }
}
