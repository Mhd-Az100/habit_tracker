import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllHabitsUseCase {
  final HabitRepository repository;

  GetAllHabitsUseCase(this.repository);

  Future<List<HabitEntity>> call() async {
    return await repository.getAllHabits();
  }
}
