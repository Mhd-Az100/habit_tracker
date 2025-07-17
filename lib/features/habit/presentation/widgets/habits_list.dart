import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/core/helpers/show_bottom_sheet.dart';
import 'package:habit_tracker/core/widgets/habit_card.dart';
import 'package:habit_tracker/features/habit/presentation/controller/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habit_details.dart';

class HabitListView extends StatefulWidget {
  const HabitListView({super.key});

  @override
  State<HabitListView> createState() => _HabitListViewState();
}

class _HabitListViewState extends State<HabitListView> {
  bool _isDeleteMode = false;
  final Set<String> _selectedHabitIds = {};

  void _toggleDeleteMode(String habitId) {
    setState(() {
      _isDeleteMode = !_isDeleteMode;
      if (_isDeleteMode) {
        _selectedHabitIds.add(habitId);
      } else {
        _selectedHabitIds.clear();
      }
    });
  }

  void _toggleHabitSelection(String habitId) {
    setState(() {
      if (_selectedHabitIds.contains(habitId)) {
        _selectedHabitIds.remove(habitId);
      } else {
        _selectedHabitIds.add(habitId);
      }
      if (_selectedHabitIds.isEmpty) {
        _isDeleteMode = false;
      }
    });
  }

  void _confirmAndDeleteSelected() {
    if (_selectedHabitIds.isEmpty) return;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Habits'),
        content: Text(
          'Are you sure you want to delete ${_selectedHabitIds.length} habit(s)?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              for (final id in _selectedHabitIds) {
                context.read<HabitBloc>().add(HabitEvent.deleteHabit(id));
              }
              Navigator.of(ctx).pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HabitBloc, HabitState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Error: $message')));
          },
          loaded: (habits) {
            log("habits List : $habits");
            final currentHabitIds = habits.map((h) => h.id).toSet();
            _selectedHabitIds.retainWhere((id) => currentHabitIds.contains(id));
            if (_selectedHabitIds.isEmpty) {
              setState(() {
                _isDeleteMode = false;
              });
            }
          },
        );
      },
      builder: (context, state) {
        return state.when(
          initial: () => Center(
            child: Text(
              'Start tracking your habits!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (habits) {
            if (habits.isEmpty) {
              return Center(
                child: Text(
                  'No habits added yet.',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            }
            return Column(
              children: [
                if (_isDeleteMode)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('(${_selectedHabitIds.length}) selected'),
                        ElevatedButton.icon(
                          onPressed: _confirmAndDeleteSelected,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete Selected'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.error,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onError,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            setState(() {
                              _isDeleteMode = false;
                              _selectedHabitIds.clear();
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: habits.length,
                    itemBuilder: (context, index) {
                      final habit = habits[index];
                      final isCompletedToday = habit.completionDates.contains(
                        DateTime.now().toNormalizedDateString(),
                      );
                      final isSelected = _selectedHabitIds.contains(habit.id);

                      return HabitCard(
                        habit: habit,
                        isCompletedToday: isCompletedToday,
                        isSelectedForDeletion: _isDeleteMode && isSelected,
                        onTap: _isDeleteMode
                            ? () => _toggleHabitSelection(habit.id)
                            : () {
                                customShowBottomSheet(
                                  context,
                                  BlocProvider.value(
                                    value: context.read<HabitBloc>(),
                                    child: HabitDetailSheet(habit: habit),
                                  ),
                                );
                              },
                        onLongPress: () => _toggleDeleteMode(habit.id),
                        onCheckboxChanged: _isDeleteMode
                            ? null
                            : (value) {
                                context.read<HabitBloc>().add(
                                  HabitEvent.completeHabit(
                                    habit.id,
                                    DateTime.now(),
                                  ),
                                );
                              },
                      );
                    },
                  ),
                ),
              ],
            );
          },
          habitLoaded: (_) => const SizedBox.shrink(),
          error: (msg) => Center(child: Text('Error: $msg')),
          statsLoaded: (_) => const SizedBox.shrink(),
        );
      },
    );
  }
}
