import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';


extension HabitEntityMapper on HabitEntity {
  HabitModel toModel() {
    return HabitModel(
      id: id,
      name: name,
      description: description,
      recurrenceType: recurrenceDetails.type,
      recurrenceValue: recurrenceDetails.map(
        daily: (_) => null,
        weekly: (val) => val.days,
        everyXDays: (val) => val.daysInterval,
      ),
      createdAt: createdAt, 
      completedDate: completedDate,
    );
  }
}
