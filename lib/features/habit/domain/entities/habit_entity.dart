import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/features/habit/domain/entities/recurrence_details_entity.dart';

part 'habit_entity.freezed.dart';

@freezed
class HabitEntity with _$HabitEntity {
  const factory HabitEntity({
    required String id,
    required String name,
    String? description,
    required RecurrenceDetailsEntity recurrenceDetails,
    required DateTime createdAt, 
    required DateTime completedDate,
  }) = _HabitEntity;
}

