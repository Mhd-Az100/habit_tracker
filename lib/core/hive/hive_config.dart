import 'package:habit_tracker/core/enums/day_of_week.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/features/habit/data/models/habit_completion_model.dart';
import 'package:habit_tracker/features/habit/data/models/habit_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';


class HiveConfig {
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);

    _registerAdapters();
  }

  static void _registerAdapters() {
    if (!Hive.isAdapterRegistered(HabitModelAdapter().typeId)) {
      Hive.registerAdapter(HabitModelAdapter());
    }
    if (!Hive.isAdapterRegistered(HabitCompletionModelAdapter().typeId)) {
      Hive.registerAdapter(HabitCompletionModelAdapter());
    }
    if (!Hive.isAdapterRegistered(RecurrenceTypeAdapter().typeId)) {
      Hive.registerAdapter(RecurrenceTypeAdapter());
    }
    if (!Hive.isAdapterRegistered(DayOfWeekAdapter().typeId)) {
      Hive.registerAdapter(DayOfWeekAdapter());
    }
  }
}
