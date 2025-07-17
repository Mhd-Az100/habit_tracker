import 'package:flutter/material.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';

class HabitCard extends StatelessWidget {
  final HabitEntity habit;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final ValueChanged<bool?>? onCheckboxChanged;
  final bool isCompletedToday;
  final bool isSelectedForDeletion;

  const HabitCard({
    super.key,
    required this.habit,
    this.onTap,
    this.onLongPress,
    this.onCheckboxChanged,
    required this.isCompletedToday,
    this.isSelectedForDeletion = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color cardColor = isSelectedForDeletion
        ? Theme.of(context).colorScheme.error.withAlpha(51)
        : Theme.of(context).cardColor;

    return Card(
      color: cardColor,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        splashFactory: isSelectedForDeletion ? InkRipple.splashFactory : null,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      habit.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (habit.description != null &&
                        habit.description!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          habit.description!,
                          style: Theme.of(context).textTheme.bodyMedium,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
              isSelectedForDeletion
                  ? Checkbox(
                      value: isSelectedForDeletion,
                      onChanged: onCheckboxChanged,
                    )
                  : Checkbox(
                      value: isCompletedToday,
                      onChanged: onCheckboxChanged,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
