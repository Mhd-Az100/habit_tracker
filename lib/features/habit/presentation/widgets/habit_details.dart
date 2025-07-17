import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/enums/day_of_week.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/core/extensions/date_time_extension.dart';
import 'package:habit_tracker/core/extensions/string_extension.dart';
import 'package:habit_tracker/core/helpers/custom_show_bottom_sheet.dart';
import 'package:habit_tracker/core/widgets/full_page_bottom_sheet.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/add_habit_sheet.dart';

class HabitDetailSheet extends StatelessWidget {
  final HabitEntity habit;

  const HabitDetailSheet({super.key, required this.habit});

  String _formatRecurrence(
    RecurrenceType type,
    List<int>? daysOfWeek,
    int? everyXDays,
  ) {
    switch (type) {
      case RecurrenceType.daily:
        return 'Daily';
      case RecurrenceType.weekly:
        if (daysOfWeek != null && daysOfWeek.isNotEmpty) {
          final dayNames = daysOfWeek
              .map((dayInt) {
                return DayOfWeek.values[dayInt].name.capitalize();
              })
              .join(', ');
          return 'Weekly: $dayNames';
        }
        return 'Weekly (no days selected)';
      case RecurrenceType.everyXDays:
        return 'Every $everyXDays day(s)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FullPageBottomSheet(
      title: 'Habit Details',
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(habit.name, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            if (habit.description != null && habit.description!.isNotEmpty)
              Text(
                habit.description!,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            const SizedBox(height: 16),
            Text('Recurrence:', style: Theme.of(context).textTheme.titleMedium),
            Text(
              _formatRecurrence(
                habit.recurrenceType,
                habit.daysOfWeek,
                habit.everyXDays,
              ),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text('Created On:', style: Theme.of(context).textTheme.titleMedium),
            Text(
             '${habit.createdAt.toNormalizedDateString()} at ${habit.createdAt.toNormalizedTimeString()}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                      customShowBottomSheet(
                        context,
                        BlocProvider.value(
                          value: context.read<HabitBloc>(),
                          child: AddHabitSheet(habitToEdit: habit),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      _confirmDelete(context, habit);
                    },
                    icon: const Icon(Icons.delete),
                    label: const Text('Delete'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.error,
                      foregroundColor: Theme.of(context).colorScheme.onError,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _confirmDelete(BuildContext context, HabitEntity habit) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Confirm Deletion'),
        content: Text('Are you sure you want to delete "${habit.name}"?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop(); 
              Navigator.of(context).pop(); 
              context.read<HabitBloc>().add(HabitEvent.deleteHabit(habit.id));
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
}
