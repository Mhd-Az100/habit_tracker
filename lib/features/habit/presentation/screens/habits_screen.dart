import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/helpers/custom_show_bottom_sheet.dart';
import 'package:habit_tracker/features/habit/presentation/controller/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/add_habit_sheet.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habits_list.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: const [HabitListView()]),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
            customShowBottomSheet(context, BlocProvider.value(
              value: context.read<HabitBloc>(),
              child: AddHabitSheet()));
            },
          );
        }
      ),
    );
  }
}


