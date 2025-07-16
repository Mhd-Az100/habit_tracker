import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddHabitUseCase {
  final HabitRepository repository;

  AddHabitUseCase(this.repository);

  Future<void> call(HabitEntity habit) async {
    await repository.addHabit(habit);
  }
}
