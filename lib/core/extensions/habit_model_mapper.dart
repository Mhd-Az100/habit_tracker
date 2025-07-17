import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';

extension HabitModelMapper on HabitModel {
  HabitEntity toEntity() {
    return HabitEntity(
      id: id,
      name: name,
      description: description,
      createdAt: createdAt,
      recurrenceType: recurrenceType,
      daysOfWeek: daysOfWeek,
      everyXDays: everyXDays,
      completionDates: completionDates,
    );
  }
}

