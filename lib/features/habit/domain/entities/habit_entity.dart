import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';

part 'habit_entity.freezed.dart';

@freezed
class HabitEntity with _$HabitEntity {
  const factory HabitEntity({
    required String id,
    required String name,
    String? description,
    required DateTime createdAt,
    required RecurrenceType recurrenceType, // Enum for Daily, Weekly, Every X Days 
    @Default([]) List<String> completionDates, // Stores YYYY-MM-DD strings for completed days
    List<int>? daysOfWeek, // weekly recurrence: 1=Monday, 7=Sunday 
    int? everyXDays, // For "every X days" recurrence 
  }) = _HabitEntity;
}