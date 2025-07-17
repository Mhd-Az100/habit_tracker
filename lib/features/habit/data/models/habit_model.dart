import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:hive/hive.dart';

part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@freezed
@HiveType(typeId: 2) // Ensure this ID is unique across all your HiveTypes
class HabitModel with _$HabitModel {
  const factory HabitModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) String? description,
    @HiveField(3) required RecurrenceType recurrenceType,
    // Using separate fields for clarity and type safety
    @HiveField(4) List<int>? daysOfWeek, // For weekly recurrence (e.g., [1, 3, 5] for Mon, Wed, Fri)
    @HiveField(5) int? everyXDays,    // For "every X days" recurrence (e.g., 3)
    @HiveField(6) required DateTime createdAt,
    // Crucially, this tracks multiple completion dates
    @HiveField(7) @Default([]) List<String> completionDates, // List of 'YYYY-MM-DD' strings
  }) = _HabitModel; // Renamed to _HabitModel for consistency

  factory HabitModel.fromJson(Map<String, dynamic> json) => _$HabitModelFromJson(json);
}