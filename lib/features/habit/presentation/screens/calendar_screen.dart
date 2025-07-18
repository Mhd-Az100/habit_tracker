import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/controller/calendar_cubit/calendar_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/calendar_widget.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habits_list.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<HabitBloc, HabitState>(
        listener: (context, habitState) {
          habitState.whenOrNull(
            loaded: (allHabits, _, __) {
              context.read<CalendarCubit>().updateCalendarStatuses(allHabits);
            },
          );
        },
        child: BlocBuilder<CalendarCubit, CalendarState>(
          builder: (context, state) {
            if (state.errorMessage != null) {
              return Center(child: Text('Error: ${state.errorMessage}'));
            }

            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: CalendarWidget( 
                    focusedDay: state.focusedDay,
                    selectedDay: state.selectedDay,
                    dayStatuses: state.dayStatuses,
                    onDaySelected: (selectedDay, focusedDay) {
                      context.read<CalendarCubit>().onDaySelected(
                            selectedDay,
                            focusedDay,
                          );
                    },
                    onPageChanged: (focusedDay) {
                      context.read<CalendarCubit>().onPageChanged(focusedDay);
                    },
                  ),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: 16)),
                //
                HabitListView(selectedDate: state.selectedDay),
              ],
            );
          },
        ),
      ),
    );
  }
}
