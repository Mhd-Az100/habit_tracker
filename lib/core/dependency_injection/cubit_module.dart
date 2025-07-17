
import 'package:habit_tracker/core/theme/theme_cubit.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CubitModule {
  @lazySingleton
  ThemeCubit themeCubit(Box settingsBox) => ThemeCubit(settingsBox);
}