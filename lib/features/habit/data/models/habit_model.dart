import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:hive/hive.dart';

part 'habit_model.freezed.dart';
part 'habit_model.g.dart';

@freezed
@HiveType(typeId: 2)
class HabitModel with _$HabitModel {
  const factory HabitModel({
    @HiveField(0) required String id,
    @HiveField(1) required String name,
    @HiveField(2) String? description,
    @HiveField(3) required RecurrenceType recurrenceType,
    // recurrenceValue will store different types of data based on recurrenceType
    // For 'weekly': List<DayOfWeek> (e.g., [DayOfWeek.monday, DayOfWeek.wednesday])
    // For 'everyXDays': int (e.g., 3 for every 3 days)
    // For 'daily': This field might not be used or could be null
    @HiveField(4) dynamic recurrenceValue,
    @HiveField(5) required DateTime createdAt,
    @HiveField(6) required DateTime completedDate,
  }) = _Habit;

  factory HabitModel.fromJson(Map<String, dynamic> json) => _$HabitModelFromJson(json);
}

