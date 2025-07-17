import 'package:habit_tracker/features/habit/data/models/habit_completion_model.dart';
import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class HiveModule {
  @preResolve
  @singleton
  Future<Box<HabitModel>> get habitBox async =>
      await Hive.openBox<HabitModel>('habitsBox');

  @preResolve
  @singleton
  Future<Box<HabitCompletionModel>> get habitCompletionBox async =>
      await Hive.openBox<HabitCompletionModel>('habitCompletionBox');

  @preResolve
  @singleton
  Future<Box> get themeBox async => await Hive.openBox('theme');
}
