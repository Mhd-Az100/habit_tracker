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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return FullPageBottomSheet(
      title: 'Habit Details',
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainer,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: colorScheme.primary,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.track_changes,
                              color: colorScheme.onPrimary,
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              habit.name,
                              style: theme.textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (habit.description?.isNotEmpty ?? false) ...[
                        const SizedBox(height: 12),
                        Text(
                          habit.description!,
                          style: theme.textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurface.withValues(alpha: 0.8),
                            height: 1.4,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Column(
                  children: [
                    _buildInfo(
                      context,
                      icon: _getRecurrenceIcon(habit.recurrenceType),
                      title: 'Recurrence',
                      value: _formatRecurrence(
                        habit.recurrenceType,
                        habit.daysOfWeek,
                        habit.everyXDays,
                      ),
                      color: colorScheme.secondary,
                    ),
                    const SizedBox(height: 24),
                    _buildInfo(
                      context,
                      icon: Icons.schedule,
                      title: 'Created',
                      value: habit.createdAt.toNormalizedDateString(),
                      subtitle:
                          'at ${habit.createdAt.toNormalizedTimeString()}',
                      color: colorScheme.tertiary,
                    ),
                  ],
                ),

                const SizedBox(height: 32),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {
                    _confirmDelete(context, habit);
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: colorScheme.error, width: 1),
                    foregroundColor: colorScheme.error,
                  ),
                  icon: const Icon(Icons.delete_outline, size: 20),
                  label: Text('Delete Habit'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton.icon(
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
                  style: FilledButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                  icon: const Icon(Icons.edit, size: 20),
                  label: Text('Edit Habit'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String value,
    String? subtitle,
    required Color color,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Icon(icon, color: color, size: 16),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: colorScheme.onSurface,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.6),
            ),
          ),
        ],
      ],
    );
  }

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
          return dayNames;
        }
        return 'Weekly (no days selected)';
      case RecurrenceType.everyXDays:
        return 'Every $everyXDays day(s)';
    }
  }

  IconData _getRecurrenceIcon(RecurrenceType type) {
    switch (type) {
      case RecurrenceType.daily:
        return Icons.today;
      case RecurrenceType.weekly:
        return Icons.calendar_view_week;
      case RecurrenceType.everyXDays:
        return Icons.repeat;
    }
  }

  void _confirmDelete(BuildContext context, HabitEntity habit) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: colorScheme.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                Icons.warning_amber_rounded,
                color: colorScheme.error,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
            const Text('Delete Habit'),
          ],
        ),
        content: RichText(
          text: TextSpan(
            style: theme.textTheme.bodyMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.8),
            ),
            children: [
              const TextSpan(text: 'Are you sure you want to delete '),
              TextSpan(
                text: '"${habit.name}"',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const TextSpan(text: '? This action cannot be undone.'),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            style: TextButton.styleFrom(
              foregroundColor: colorScheme.onSurface.withValues(alpha: 0.7),
            ),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
              context.read<HabitBloc>().add(HabitEvent.deleteHabit(habit.id));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.error,
              foregroundColor: colorScheme.onError,
            ),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
