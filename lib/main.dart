import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/dependency_injection/injection.dart';
import 'package:habit_tracker/core/helpers/app_bloc_observer.dart';
import 'package:habit_tracker/core/hive/hive_config.dart';
import 'package:habit_tracker/core/theme/theme.dart';
import 'package:habit_tracker/core/theme/theme_cubit.dart';
import 'package:habit_tracker/core/theme/util.dart';
import 'package:habit_tracker/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.init();
  await configureDependencies();  
  final themeCubit = getIt<ThemeCubit>();
  Bloc.observer = AppBlocObserver();
  
  runApp(BlocProvider.value(
      value: themeCubit,
      child: MainApp(),
    ),
);
}



class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final baseTextTheme = createTextTheme(
      context,
      bodyFontFamily: "Lato",
      displayFontFamily: "Lato",
    );
    final appTheme = MaterialTheme(baseTextTheme);

    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {

        final ThemeData currentThemeData = themeMode == ThemeMode.dark ? appTheme.dark() : appTheme.light();

        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeMode,
          theme: currentThemeData,
          home: HomeScaffold(),
        );
      }
    );
  }
}
