import 'package:habit_tracker/core/enums/day_of_week.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/domain/entities/recurrence_details_entity.dart';

extension HabitModelMapper on HabitModel {
  HabitEntity toEntity() {
    return HabitEntity(
      id: id,
      name: name,
      description: description,
      createdAt: createdAt,
      recurrenceDetails: _mapRecurrence(), completedDate: completedDate,
    );
  }

  RecurrenceDetails _mapRecurrence() {
    switch (recurrenceType) {
      case RecurrenceType.daily:
        return const RecurrenceDetails.daily();
      case RecurrenceType.weekly:
        return RecurrenceDetails.weekly(
          days: List<DayOfWeek>.from(recurrenceValue as List),
        );
      case RecurrenceType.everyXDays:
        return RecurrenceDetails.everyXDays(
          daysInterval: recurrenceValue as int,
        );
    }
  }
}

