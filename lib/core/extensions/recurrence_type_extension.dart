import 'package:habit_tracker/core/enums/recurrence_type.dart';

extension RecurrenceTypeExtension on RecurrenceType {
  String translate() {
    switch (this) {
      case RecurrenceType.daily:
        return 'Daily';
      case RecurrenceType.weekly:
        return 'Weekly';
      case RecurrenceType.everyXDays:
        return 'Custom';
    }
  }
}