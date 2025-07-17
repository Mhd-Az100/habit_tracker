import 'package:habit_tracker/features/habit/domain/entities/habit_entity.dart';
import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetHabitByIdUseCase {
  final HabitRepository repository;

  GetHabitByIdUseCase(this.repository);

  Future<HabitEntity?> call(String id) async {
    return await repository.getHabitById(id);
  }
}