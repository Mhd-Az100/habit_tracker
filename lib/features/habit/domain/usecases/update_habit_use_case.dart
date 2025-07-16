import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateHabitUseCase {
  final HabitRepository repository;

  UpdateHabitUseCase(this.repository);

  Future<void> call(HabitEntity habit) async {
    await repository.updateHabit(habit);
  }
}
