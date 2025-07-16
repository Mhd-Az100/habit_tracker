import 'package:habit_tracker/features/habit/data/datasources/habit_local_datasource.dart';
import 'package:habit_tracker/features/habit/data/datasources/habit_local_datasource_impl.dart';
import 'package:habit_tracker/features/habit/data/models/habit_completion_model.dart';
import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DataSourceModule {
  @lazySingleton
  HabitLocalDataSource habitLocalDataSource(Box<HabitModel> box, Box<HabitCompletionModel> completionBox) =>
      HabitLocalDataSourceImpl(box, completionBox);
}