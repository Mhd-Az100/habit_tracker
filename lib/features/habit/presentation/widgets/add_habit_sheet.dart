import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/dependency_injection/injection.dart';
import 'package:habit_tracker/core/enums/day_of_week.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/core/extensions/recurrence_type_extension.dart';
import 'package:habit_tracker/core/extensions/string_extension.dart';
import 'package:habit_tracker/core/widgets/full_page_bottom_sheet.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/presentation/controller/add_cubit/add_habit_cubit.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/everxday_field.dart';

class AddHabitSheet extends StatelessWidget {
  final HabitEntity? habitToEdit;

  const AddHabitSheet({super.key, this.habitToEdit});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<AddHabitCubit>()..initialize(habitToEdit),
      child: const _AddHabitForm(),
    );
  }
}


class _AddHabitForm extends StatelessWidget {
  const _AddHabitForm();

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddHabitCubit>();
    final formKey = GlobalKey<FormState>();

    return BlocBuilder<AddHabitCubit, AddHabitFormState>(
      builder: (context, state) {
        return FullPageBottomSheet(
          title: cubit.isEditing ? 'Edit Habit' : 'Add New Habit',
          child: Form(
            key: formKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                TextFormField(
                  controller: cubit.nameController,
                  decoration: const InputDecoration(labelText: 'Habit Name'),
                  onChanged: cubit.onNameChanged,
                  validator: (value) => value == null || value.trim().isEmpty
                      ? 'Name is required'
                      : null,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: cubit.descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  onChanged: cubit.onDescriptionChanged,
                ),
                const SizedBox(height: 16),
                Text('Repeat:', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8.0,
                  children: RecurrenceType.values.map((type) {
                    return ChoiceChip(
                      onSelected: (_) => cubit.onRecurrenceChanged(type),
                      label: Text(type.translate()),
                      selected: state.recurrenceType == type,
                    );
                  }).toList(),
                ),

                if (state.recurrenceType == RecurrenceType.weekly) ...[
                  const SizedBox(height: 16),
                  Text('Days of Week:', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8.0,
                    children: List.generate(7, (index) {
                      final dayOfWeek = DayOfWeek.values[index];
                      final isSelected = state.daysOfWeek.contains(index);

                      return FilterChip(
                        label: Text(dayOfWeek.name.capitalize()),
                        selected: isSelected,
                        onSelected: (_) => cubit.toggleDay(index),
                      );
                    }),
                  ),
                ],

                if (state.recurrenceType == RecurrenceType.everyXDays) ...[
                  const SizedBox(height: 12),
                  EveryXDaysField(controller: cubit.everyXDaysController),
                ],

                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        cubit.submitForm(context);
                      }
                    },
                    child: Text(cubit.isEditing ? 'Update Habit' : 'Save Habit'),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}