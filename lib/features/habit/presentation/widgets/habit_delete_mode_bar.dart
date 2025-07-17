import 'package:flutter/material.dart';

class HabitDeleteModeBar extends StatelessWidget {
  final int selectedCount;
  final VoidCallback onDeleteSelected;
  final VoidCallback onCancel;

  const HabitDeleteModeBar({
    super.key,
    required this.selectedCount,
    required this.onDeleteSelected,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('($selectedCount) selected'),
          ElevatedButton.icon(
            onPressed: onDeleteSelected,
            icon: const Icon(Icons.delete),
            label: const Text('Delete Selected'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
              foregroundColor: Theme.of(context).colorScheme.onError,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: onCancel,
          ),
        ],
      ),
    );
  }
}