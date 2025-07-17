import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/core/helpers/custom_show_bottom_sheet.dart';
import 'package:habit_tracker/core/widgets/habit_card.dart';
import 'package:habit_tracker/features/habit/presentation/controller/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/habit_details.dart';


class HabitListView extends StatefulWidget {
  final DateTime? selectedDate;
  const HabitListView({super.key, this.selectedDate});

  @override
  State<HabitListView> createState() => _HabitListViewState();
}

class _HabitListViewState extends State<HabitListView> {
  bool _isDeleteMode = false;
  final Set<String> _selectedHabitIds = {};

  String _getTodayNormalizedDate() {
    return DateTime.now().toNormalizedDateString();
  }

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
              Navigator.of(ctx).pop(); // Dismiss confirmation dialog
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HabitBloc, HabitState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $message')));
          },
          loaded: (habits) {
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
          initial: () => SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Start tracking your habits!',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          loading: () => const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          ),
          loaded: (allHabits) {
            // --- Filtering Logic for selectedDate ---
            final selectedDate = widget.selectedDate ?? DateTime.now(); // Default to today if null
            final selectedDateNormalized = selectedDate.toNormalizedDateString();

            final filteredHabits = allHabits.where((habit) {
              switch (habit.recurrenceType) {
                case RecurrenceType.daily:
                  return true; // Daily habits apply to any date
                case RecurrenceType.weekly:
                  // Check if the habit's specified days of week include the selected date's weekday
                  // DateTime.weekday returns 1 for Monday, 7 for Sunday.
                  return habit.daysOfWeek?.contains(selectedDate.weekday) ?? false;
                case RecurrenceType.everyXDays:
                  // Calculate if the selected date falls on an "every X days" interval
                  if (habit.everyXDays == null || habit.everyXDays! <= 0) {
                    return false; // Invalid configuration
                  }
                  final creationDatePure = DateTime(habit.createdAt.year, habit.createdAt.month, habit.createdAt.day);
                  final selectedDatePure = DateTime(selectedDate.year, selectedDate.month, selectedDate.day);

                  final difference = selectedDatePure.difference(creationDatePure).inDays;
                  if (difference < 0) return false; // Date is before habit creation

                  return difference % habit.everyXDays! == 0;
              }
            }).toList();
            // --- End Filtering Logic ---

            if (filteredHabits.isEmpty) {
              return SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    'No habits for ${selectedDate.toNormalizedDateString()}.',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              );
            }
            // --- Start of SliverToBoxAdapter Wrapping ---
            return SliverToBoxAdapter(
              child: Column(
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
                              backgroundColor: Theme.of(context).colorScheme.error,
                              foregroundColor: Theme.of(context).colorScheme.onError,
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
                  // The ListView.builder now has shrinkWrap and NeverScrollableScrollPhysics
                  ListView.builder(
                    shrinkWrap: true, // Crucial: Makes ListView take only needed space
                    physics: const NeverScrollableScrollPhysics(), // Crucial: Prevents ListView from scrolling independently
                    itemCount: filteredHabits.length,
                    itemBuilder: (context, index) {
                      final habit = filteredHabits[index]; // Use the filtered list
                      final isCompletedForSelectedDate = habit.completionDates.contains(selectedDateNormalized);
                      final isSelected = _selectedHabitIds.contains(habit.id);

                      return HabitCard(
                        habit: habit,
                        isCompletedToday: isCompletedForSelectedDate, // Pass completion status for selected date
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
                                // Important: Dispatch complete/uncomplete for the *selected date*
                                context.read<HabitBloc>().add(
                                  HabitEvent.completeHabit(
                                    habit.id,
                                    selectedDate,
                                  ),
                                );
                              },
                      );
                    },
                  ),
                ],
              ),
            );
          },
          habitLoaded: (_) => const SliverToBoxAdapter(child: SizedBox.shrink()),
          error: (msg) => SliverToBoxAdapter(child: Center(child: Text('Error: $msg'))),
          statsLoaded: (_) => const SliverToBoxAdapter(child: SizedBox.shrink()),
        );
      },
    );
  }
}

