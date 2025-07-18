import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/core/helpers/custom_show_bottom_sheet.dart';
import 'package:habit_tracker/core/widgets/habit_card.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/controller/delete_cubit/delete_habit_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/delete_mode_widget.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habit_details.dart';


class HabitListView extends StatefulWidget { 
  final DateTime? selectedDate;

  const HabitListView({super.key, this.selectedDate});

  @override
  State<HabitListView> createState() => _HabitListViewState();
}

class _HabitListViewState extends State<HabitListView> {
  @override
  void didUpdateWidget(covariant HabitListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedDate != oldWidget.selectedDate) {
      context.read<HabitBloc>().add(
        HabitEvent.filterHabitsByDate(widget.selectedDate ?? DateTime.now()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final normalizedDate = (widget.selectedDate ?? DateTime.now()).toNormalizedDateString();

    return BlocConsumer<HabitBloc, HabitState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $message')));
          },
          loaded: (allHabits, habitsOfDay, selectedDate) { 
            final habitIds = allHabits.map((h) => h.id).toSet(); 
            final deleteCubit = context.read<HabitDeleteCubit>();
            final current = List<String>.from(deleteCubit.state.selectedIds);
            current.removeWhere((id) => !habitIds.contains(id));
            if (current.isEmpty) deleteCubit.exitDeleteMode();
          },
        );
      },
      builder: (context, state) {
        return state.map(
          initial: (_) => const SliverToBoxAdapter(
            child: Center(child: Text("Start tracking your habits!")),
          ),
          loading: (loadingState) => SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          error: (errorState) => SliverToBoxAdapter(
            child: Center(child: Text("Error: ${errorState.message}")),
          ),
          loaded: (loadedState) {
            final filteredHabits = loadedState.habitsOfDay; 

            if (filteredHabits.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(child: Text("No habits for $normalizedDate.")),
              );
            }

            return _buildHabitList(context, filteredHabits, loadedState.selectedDate, normalizedDate);
          },
        );
      },
    );
  }

  Widget _buildHabitList(BuildContext context, List<HabitEntity> habits, DateTime selectedDate, String normalizedDate) {
    return BlocBuilder<HabitDeleteCubit, HabitDeleteState>(
      builder: (context, deleteState) {
        return SliverToBoxAdapter( 
          child: Column(
            children: [
              if (deleteState.isDeleteMode)
                DeleteModeHeader(
                  onCancel: () => context.read<HabitDeleteCubit>().exitDeleteMode(),
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
                              for (final id in deleteState.selectedIds) {
                                context.read<HabitBloc>().add(HabitEvent.deleteHabit(id));
                              }
                              context.read<HabitDeleteCubit>().exitDeleteMode();
                              Navigator.of(ctx).pop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).colorScheme.error,
                              foregroundColor: Theme.of(context).colorScheme.onError,
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
                itemCount: habits.length,
                itemBuilder: (context, index) {
                  final habit = habits[index];
                  final isCompleted = habit.completionDates.contains(normalizedDate);
                  final isSelected = deleteState.selectedIds.contains(habit.id);

                  final bool isFutureDate = selectedDate.toNormalizedDateTime().isAfter(DateTime.now().toNormalizedDateTime());

                  return HabitCard(
                    hideCheckbox: deleteState.isDeleteMode || isFutureDate,
                    habit: habit,
                    isCompletedToday: isCompleted,
                    isSelectedForDeletion: deleteState.isDeleteMode && isSelected,
                    onTap: deleteState.isDeleteMode
                        ? () => context.read<HabitDeleteCubit>().toggleSelection(habit.id)
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
                      context.read<HabitDeleteCubit>().enterDeleteMode();
                      context.read<HabitDeleteCubit>().toggleSelection(habit.id);
                    },
                    onCheckboxChanged: (_) => context.read<HabitBloc>().add(
                              HabitEvent.completeHabit(habit.id, selectedDate),
                            ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

