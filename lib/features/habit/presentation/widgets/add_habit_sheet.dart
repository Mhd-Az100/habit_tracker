import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker/core/enums/day_of_week.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/core/extensions/recurrence_type_extension.dart';
import 'package:habit_tracker/core/extensions/string_extension.dart';
import 'package:habit_tracker/core/widgets/full_page_bottom_sheet.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/presentation/controller/habit_bloc.dart';
import 'package:habit_tracker/features/habit/presentation/widgets/everxday_field.dart';
import 'package:uuid/uuid.dart';

class AddHabitSheet extends StatefulWidget {
  final HabitEntity? habitToEdit;

  const AddHabitSheet({super.key, this.habitToEdit});

  @override
  State<AddHabitSheet> createState() => _AddHabitSheetState();
}

class _AddHabitSheetState extends State<AddHabitSheet> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _everyXDaysController = TextEditingController();

  RecurrenceType _selectedRepetition = RecurrenceType.daily;
  List<int> _selectedDaysOfWeek = [];

  @override
  void initState() {
    super.initState();
    if (widget.habitToEdit != null) {
      _nameController.text = widget.habitToEdit!.name;
      _descriptionController.text = widget.habitToEdit!.description ?? '';
      _selectedRepetition = widget.habitToEdit!.recurrenceType;
      _selectedDaysOfWeek = List.from(widget.habitToEdit!.daysOfWeek ?? []);
      _everyXDaysController.text = (widget.habitToEdit!.everyXDays ?? 1).toString();
    } else {
      _everyXDaysController.text = '1';
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _everyXDaysController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      int? everyXDaysValue;
      if (_selectedRepetition == RecurrenceType.everyXDays) {
        everyXDaysValue = int.tryParse(_everyXDaysController.text) ?? 1;
        if (everyXDaysValue <= 0) everyXDaysValue = 1;
      }

      final String habitId = widget.habitToEdit?.id ?? const Uuid().v4();
      final DateTime createdAt = widget.habitToEdit?.createdAt ?? DateTime.now();
      final List<String> completionDates = List.from(widget.habitToEdit?.completionDates ?? []);

      final habit = HabitEntity(
        id: habitId,
        name: _nameController.text,
        description: _descriptionController.text.isEmpty ? null : _descriptionController.text,
        recurrenceType: _selectedRepetition,
        daysOfWeek: _selectedRepetition == RecurrenceType.weekly
            ? _selectedDaysOfWeek
            : null,
        everyXDays: everyXDaysValue,
        createdAt: createdAt,
        completionDates: completionDates,
      );

      if (widget.habitToEdit == null) {
        context.read<HabitBloc>().add(HabitEvent.addHabit(habit));
      } else {
        context.read<HabitBloc>().add(HabitEvent.updateHabit(habit));
      }
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return FullPageBottomSheet(
      title: widget.habitToEdit == null ? 'Add New Habit' : 'Edit Habit',
      child: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Habit Name'),
              validator: (value) => value == null || value.trim().isEmpty
                  ? 'Name is required'
                  : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(labelText: 'Description'),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            Text('Repeat:', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              children: RecurrenceType.values.map((type) {
                return ChoiceChip(
                  onSelected: (val) => setState(() => _selectedRepetition = type),
                  label: Text(type.translate()),
                  selected: _selectedRepetition == type,
                );
              }).toList(),
            ),

            if (_selectedRepetition == RecurrenceType.weekly) ...[
              const SizedBox(height: 16),
              Text('Days of Week:', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                children: List.generate(7, (index) {
                  final dayIntValue = index;
                  final dayOfWeek = DayOfWeek.values[index];
                  final isSelected = _selectedDaysOfWeek.contains(dayIntValue);

                  return FilterChip(
                    label: Text(dayOfWeek.name.capitalize()),
                    selected: isSelected,
                    onSelected: (selected) {
                      setState(() {
                        if (selected) {
                          _selectedDaysOfWeek.add(dayIntValue);
                        } else {
                          _selectedDaysOfWeek.remove(dayIntValue);
                        }
                      });
                    },
                  );
                }),
              ),
            ],

            if (_selectedRepetition == RecurrenceType.everyXDays) ...[
              const SizedBox(height: 12),
              EveryXDaysField(controller: _everyXDaysController),
            ],

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submit,
                child: Text(widget.habitToEdit == null ? 'Save Habit' : 'Update Habit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

