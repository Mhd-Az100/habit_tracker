import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/helpers/custom_show_bottom_sheet.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/controller/datepicker_cubit/datepicker_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/add_habit_sheet.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/custom_date_picker.dart';
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
            flexibleSpace: FlexibleSpaceBar(background: CustomDatePicker()),
            pinned: true,
            floating: true,
          ),
          BlocBuilder<DatePickerCubit, DatePickerState>(
            builder: (context, state) {
              return HabitListView(selectedDate: state.selectedDate);
            },
          ),
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
