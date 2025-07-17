import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/controller/delete_cubit/delete_habit_cubit.dart';


class DeleteModeHeader extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  const DeleteModeHeader({
    super.key,
    required this.onCancel,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitDeleteCubit, HabitDeleteState>(
      builder: (context, state) {
        final isDeleteMode = state.isDeleteMode;
        final selectedCount = state.selectedIds.length;

        if (!isDeleteMode) return const SizedBox.shrink();

        return Container(
          color: Colors.red.shade50,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              IconButton(
                onPressed: onCancel,
                icon: const Icon(Icons.close),
              ),
              Text(
                '$selectedCount selected',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              IconButton(
                onPressed: selectedCount > 0 ? (){
                  onDelete();

                } : null,
                icon: const Icon(Icons.delete, color: Colors.redAccent),
              ),
            ],
          ),
        );
      },
    );
  }
}
