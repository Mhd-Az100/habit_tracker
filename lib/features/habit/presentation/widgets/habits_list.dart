import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/core/helpers/custom_show_bottom_sheet.dart';
import 'package:habit_tracker/core/widgets/habit_card.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/controller/delete_cubit/delete_habit_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/delete_mode_widget.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habit_details.dart';

class HabitListView extends StatelessWidget {
  final DateTime? selectedDate;

  const HabitListView({super.key, this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final normalizedDate = (selectedDate ?? DateTime.now())
        .toNormalizedDateString();

    return BlocConsumer<HabitBloc, HabitState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: $message')));
          },
          loaded: (habits) {
            final habitIds = habits.map((h) => h.id).toSet();
            final deleteCubit = context.read<HabitDeleteCubit>();
            final current = List<String>.from(deleteCubit.state.selectedIds);
            current.removeWhere((id) => !habitIds.contains(id));
            if (current.isEmpty) deleteCubit.exitDeleteMode();
          },
        );
      },

      builder: (context, state) {
        return state.when(
          initial: () => const SliverToBoxAdapter(
            child: Center(child: Text("Start tracking your habits!")),
          ),
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (msg) =>
              SliverToBoxAdapter(child: Center(child: Text("Error: $msg"))),
          statsLoaded: (_) =>
              const SliverToBoxAdapter(child: SizedBox.shrink()),
          habitLoaded: (_) =>
              const SliverToBoxAdapter(child: SizedBox.shrink()),
          //
          loaded: (allHabits) {
            final selected = selectedDate ?? DateTime.now();
            final filteredHabits = allHabits.where((habit) {
              switch (habit.recurrenceType) {
                case RecurrenceType.daily:
                  return true;
                case RecurrenceType.weekly:
                  return habit.daysOfWeek?.contains(selected.weekday) ?? false;
                case RecurrenceType.everyXDays:
                  if (habit.everyXDays == null || habit.everyXDays! <= 0)
                    return false;
                  final creation = DateTime(
                    habit.createdAt.year,
                    habit.createdAt.month,
                    habit.createdAt.day,
                  );
                  final selectedPure = DateTime(
                    selected.year,
                    selected.month,
                    selected.day,
                  );
                  final diff = selectedPure.difference(creation).inDays;
                  return diff >= 0 && diff % habit.everyXDays! == 0;
              }
            }).toList();

            if (filteredHabits.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(child: Text("No habits for $normalizedDate.")),
              );
            }

            return BlocBuilder<HabitDeleteCubit, HabitDeleteState>(
              builder: (context, deleteState) {
                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      if (deleteState.isDeleteMode)
                        DeleteModeHeader(
                          onCancel: () =>
                              context.read<HabitDeleteCubit>().exitDeleteMode(),
                          onDelete: () {
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text('Delete Habits'),
                                content: Text(
                                  'Are you sure you want to delete ${deleteState.selectedIds.length} habit(s)?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(ctx).pop(),
                                    child: const Text('Cancel'),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      for (final id
                                          in deleteState.selectedIds) {
                                        context.read<HabitBloc>().add(
                                          HabitEvent.deleteHabit(id),
                                        );
                                      }
                                      context
                                          .read<HabitDeleteCubit>()
                                          .exitDeleteMode();
                                      Navigator.of(ctx).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Theme.of(
                                        context,
                                      ).colorScheme.error,
                                      foregroundColor: Theme.of(
                                        context,
                                      ).colorScheme.onError,
                                    ),
                                    child: const Text('Delete'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: filteredHabits.length,
                        itemBuilder: (context, index) {
                          final habit = filteredHabits[index];
                          final isCompleted = habit.completionDates.contains(
                            normalizedDate,
                          );
                          final isSelected = deleteState.selectedIds.contains(
                            habit.id,
                          );

                          return HabitCard(
                            habit: habit,
                            isCompletedToday: isCompleted,
                            isSelectedForDeletion:
                                deleteState.isDeleteMode && isSelected,
                            onTap: deleteState.isDeleteMode
                                ? () => context
                                      .read<HabitDeleteCubit>()
                                      .toggleSelection(habit.id)
                                : () {
                                    customShowBottomSheet(
                                      context,
                                      BlocProvider.value(
                                        value: context.read<HabitBloc>(),
                                        child: HabitDetailSheet(habit: habit),
                                      ),
                                    );
                                  },
                            onLongPress: () {
                              context
                                  .read<HabitDeleteCubit>()
                                  .enterDeleteMode();
                              context.read<HabitDeleteCubit>().toggleSelection(
                                habit.id,
                              );
                            },
                            onCheckboxChanged: deleteState.isDeleteMode
                                ? null
                                : (_) => context.read<HabitBloc>().add(
                                    HabitEvent.completeHabit(
                                      habit.id,
                                      selected,
                                    ),
                                  ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
