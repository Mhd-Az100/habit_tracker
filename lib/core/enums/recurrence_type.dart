import 'package:hive/hive.dart';
part 'recurrence_type.g.dart'; 

@HiveType(typeId: 0, adapterName: 'RecurrenceTypeAdapter')
enum RecurrenceType {
  @HiveField(0)
  daily,
  @HiveField(1)
  weekly,
  @HiveField(2)
  everyXDays,
}   