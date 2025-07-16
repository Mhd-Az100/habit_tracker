import 'package:freezed_annotation/freezed_annotation.dart';
part 'habit_completion_entity.freezed.dart';

@freezed
class HabitCompletionEntity with _$HabitCompletionEntity {
  const factory HabitCompletionEntity({
    required String id, // Unique ID for the completion record
    required String habitId, // Link to the HabitEntity
    required DateTime date,
    required bool isCompleted,
  }) = _HabitCompletionEntity;
}