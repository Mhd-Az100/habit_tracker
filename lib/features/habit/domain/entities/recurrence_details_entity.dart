
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/core/enums/day_of_week.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';

part 'recurrence_details_entity.freezed.dart';

@freezed
class RecurrenceDetailsEntity with _$RecurrenceDetailsEntity {
  const RecurrenceDetailsEntity._(); // Private constructor

  const factory RecurrenceDetailsEntity.daily() = _RecurrenceDetailsDaily;

  const factory RecurrenceDetailsEntity.weekly({
    required List<DayOfWeek> days,
  }) = _RecurrenceDetailsWeekly;

  const factory RecurrenceDetailsEntity.everyXDays({
    required int daysInterval,
  }) = _RecurrenceDetailsEveryXDays;

  RecurrenceType get type {
    return when(
      daily: () => RecurrenceType.daily,
      weekly: (_) => RecurrenceType.weekly,
      everyXDays: (_) => RecurrenceType.everyXDays,
    );
  }
}
