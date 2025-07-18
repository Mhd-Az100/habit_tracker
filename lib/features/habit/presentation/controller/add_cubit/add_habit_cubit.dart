import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:habit_tracker/core/dependency_injection/injection.dart';
import 'package:habit_tracker/core/enums/recurrence_type.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/presentation/controller/bloc/habit_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:uuid/uuid.dart';

part 'add_habit_cubit.freezed.dart';
part 'add_habit_state.dart';

@Injectable()
class AddHabitCubit extends Cubit<AddHabitFormState> {
  final Uuid uuid;
  AddHabitCubit(this.uuid) : super(const AddHabitFormState());

  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final everyXDaysController = TextEditingController();

  bool isEditing = false;
  HabitEntity? originalHabit;

  void initialize(HabitEntity? habit) {
    if (habit != null) {
      isEditing = true;
      originalHabit = habit;
      nameController.text = habit.name;
      descriptionController.text = habit.description ?? '';
      everyXDaysController.text = (habit.everyXDays ?? 1).toString();
      emit(state.copyWith(
        name: habit.name,
        description: habit.description ?? '',
        recurrenceType: habit.recurrenceType,
        daysOfWeek: habit.daysOfWeek ?? [],
        everyXDays: everyXDaysController.text,
        isValid: habit.name.trim().isNotEmpty,
      ));
    } else {
      everyXDaysController.text = '1';
    }
  }

  void onNameChanged(String value) =>
      emit(state.copyWith(name: value, isValid: value.trim().isNotEmpty));

  void onDescriptionChanged(String value) =>
      emit(state.copyWith(description: value));

  void onRecurrenceChanged(RecurrenceType type) =>
      emit(state.copyWith(recurrenceType: type));

  void toggleDay(int day) {
    final updated = [...state.daysOfWeek];
    updated.contains(day) ? updated.remove(day) : updated.add(day);
    emit(state.copyWith(daysOfWeek: updated));
  }

  void submitForm(BuildContext context) {
    int? everyX = state.recurrenceType == RecurrenceType.everyXDays
        ? int.tryParse(everyXDaysController.text) ?? 1
        : null;

    final habit = HabitEntity(
      id: isEditing ? originalHabit!.id : getIt<Uuid>().v4(),
      name: nameController.text,
      description:
          descriptionController.text.isEmpty ? null : descriptionController.text,
      recurrenceType: state.recurrenceType,
      daysOfWeek: state.recurrenceType == RecurrenceType.weekly
          ? state.daysOfWeek
          : null,
      everyXDays: everyX,
      createdAt: isEditing ? originalHabit!.createdAt : DateTime.now(),
      completionDates: isEditing
          ? List.from(originalHabit!.completionDates)
          : [],
    );

    final bloc = context.read<HabitBloc>();
    if (isEditing) {
      bloc.add(HabitEvent.updateHabit(habit));
    } else {
      bloc.add(HabitEvent.addHabit(habit));
    }

    Navigator.of(context).pop();
  }

  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    everyXDaysController.dispose();
  }
}
