import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/helpers/custom_show_bottom_sheet.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/add_habit_sheet.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habits_list.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 140.0,
            flexibleSpace: FlexibleSpaceBar(
              background: CustomDatePicker(),
            ),
            pinned: true,
            floating: true,
          ),
          const HabitListView(),
        ],
      ),
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              customShowBottomSheet(
                context,
                BlocProvider.value(
                  value: context.read<HabitBloc>(),
                  child: const AddHabitSheet(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomDatePicker extends StatelessWidget {
  const CustomDatePicker({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: EasyDateTimeLine(
          initialDate: DateTime.now(),
          onDateChange: (selectedDate) {},
          headerProps: const EasyHeaderProps(
            showHeader: false,
          ),
          dayProps: EasyDayProps(
            activeDayStyle: DayStyle(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
    );
  }
}

