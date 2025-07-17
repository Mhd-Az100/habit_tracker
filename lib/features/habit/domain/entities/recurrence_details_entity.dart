
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/core/enums/day_of_week.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';

part 'recurrence_details_entity.freezed.dart';


@freezed
class RecurrenceDetails with _$RecurrenceDetails {
  const RecurrenceDetails._(); // Private constructor

  // Daily recurrence has no specific value
  const factory RecurrenceDetails.daily() = _RecurrenceDetailsDaily;

  // Weekly recurrence needs a list of days
  const factory RecurrenceDetails.weekly({
    required List<DayOfWeek> days,
  }) = _RecurrenceDetailsWeekly;

  // Every X days recurrence needs an integer
  const factory RecurrenceDetails.everyXDays({
    required int daysInterval,
  }) = _RecurrenceDetailsEveryXDays;

  // Helper getter to easily access the RecurrenceType enum value
  RecurrenceType get type {
    return when(
      daily: () => RecurrenceType.daily,
      weekly: (_) => RecurrenceType.weekly,
      everyXDays: (_) => RecurrenceType.everyXDays,
    );
  }
}