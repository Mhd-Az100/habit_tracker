import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/dependency_injection/injection.dart';
import 'package:habit_tracker/core/theme/theme_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/controller/calendar_cubit/calendar_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/controller/datepicker_cubit/datepicker_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/controller/delete_cubit/delete_habit_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/controller/statistics_cubit/statistics_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/screens/calendar_screen.dart';
import 'package:habit_tracker/features/habit/presentation/screens/habits_screen.dart';
import 'package:habit_tracker/features/habit/presentation/screens/statistics_screen.dart';

class HomeScaffold extends StatefulWidget {
  const HomeScaffold({super.key});

  @override
  State<HomeScaffold> createState() => _HomeScaffoldState();
}

class _HomeScaffoldState extends State<HomeScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HabitsScreen(),
    CalendarScreen(),
    StatisticsScreen(),
  ];

  final List<String> _pageTitles = const ['Habits', 'Calendar', 'Statistics'];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HabitBloc>(
          create: (_) => getIt<HabitBloc>()..add(const HabitEvent.loadHabits()),
        ),
        BlocProvider<HabitDeleteCubit>(
          create: (_) => getIt<HabitDeleteCubit>(),
        ),
        BlocProvider<DatePickerCubit>(
          create: (_) => getIt<DatePickerCubit>(),
        ),
        BlocProvider<CalendarCubit>(
          create: (_) => getIt<CalendarCubit>(),
        ),
        BlocProvider<StatisticsCubit>(
          create: (_) => getIt<StatisticsCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(_pageTitles[_currentIndex]),
          actions: [
            IconButton(
              icon: AnimatedSwitcher(
                duration: Durations.long1,
                transitionBuilder: (child, animation) {
                  return ScaleTransition(scale: animation, child: child);
                },
                child: context.watch<ThemeCubit>().state == ThemeMode.dark
                    ? const Icon(
                        Icons.light_mode,
                        key: ValueKey('light_mode_icon'),
                      )
                    : const Icon(
                        Icons.dark_mode,
                        key: ValueKey('dark_mode_icon'),
                      ),
              ),
              onPressed: () => context.read<ThemeCubit>().toggleTheme(),
            ),
          ],
        ),
        body: IndexedStack(index: _currentIndex, children: _pages),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.checklist_rtl_rounded),
              label: 'Habits',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today),
              label: 'Calendar',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Statistics',
            ),
          ],
        ),
      ),
    );
  }
}
