import 'package:hive/hive.dart';

part 'day_of_week.g.dart'; 

@HiveType(typeId: 1, adapterName: 'DayOfWeekAdapter')
enum DayOfWeek {
  @HiveField(0)
  sunday,
  @HiveField(1)
  monday,
  @HiveField(2)
  tuesday,
  @HiveField(3)
  wednesday,
  @HiveField(4)
  thursday,
  @HiveField(5)
  friday,
  @HiveField(6)
  saturday,
}