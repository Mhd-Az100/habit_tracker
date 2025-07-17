import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';


class ThemeCubit extends Cubit<ThemeMode> {
  final Box settingsBox;

  ThemeCubit(this.settingsBox) : super(_loadTheme(settingsBox));

  static ThemeMode _loadTheme(Box box) {
    final stored = box.get('themeMode', defaultValue: 'light');
    return stored == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }

  void toggleTheme() {
    final newTheme = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(newTheme);
    settingsBox.put('themeMode', newTheme == ThemeMode.dark ? 'dark' : 'light');
  }
}