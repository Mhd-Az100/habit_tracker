import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/features/habit/domain/entities/habit_completion_entity.dart';
import 'package:habit_tracker/features/habit/domain/repositories/habit_repository.dart';
import 'package:habit_tracker/features/habit/domain/usecases/get_habit_stats_usecase.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uuid/uuid.dart';


class MockHabitRepository extends Mock implements HabitRepository {}

void main() {
  late GetHabitStatsUseCase useCase;
  late MockHabitRepository mockRepository;

  setUp(() {
    mockRepository = MockHabitRepository();
    useCase = GetHabitStatsUseCase(mockRepository);
  });

  test('should return 0 stats when no completions', () async {
    when(() => mockRepository.getCompletionsForHabit(any()))
        .thenAnswer((_) async => []);

    final result = await useCase.call('habit-id');

    expect(result.totalCompletions, 0);
    expect(result.currentStreak, 0);
    expect(result.longestStreak, 0);
  });

  test('should return correct stats for consecutive completions', () async {
    final today = DateTime.now();
    final completions = [
      HabitCompletionEntity(habitId: 'habit-id', date: today.subtract(Duration(days: 2)), id: const Uuid().v4(), isCompleted: true),
      HabitCompletionEntity(habitId: 'habit-id', date: today.subtract(Duration(days: 1)), id: const Uuid().v4(), isCompleted: false),
      HabitCompletionEntity(habitId: 'habit-id', date: today, id: const Uuid().v4(), isCompleted: false),
    ];

    when(() => mockRepository.getCompletionsForHabit(any()))
        .thenAnswer((_) async => completions);

    final result = await useCase.call('habit-id');

    expect(result.totalCompletions, 3);
    expect(result.currentStreak, 3);
    expect(result.longestStreak, 3);
  });

  test('should reset current streak if gap in completions', () async {
    final today = DateTime.now();
    final completions = [
      HabitCompletionEntity(habitId: 'habit-id', date: today.subtract(Duration(days: 4)), id: const Uuid().v4(), isCompleted: false),
      HabitCompletionEntity(habitId: 'habit-id', date: today.subtract(Duration(days: 2)), id: const Uuid().v4(), isCompleted: false),
      HabitCompletionEntity(habitId: 'habit-id', date: today, id: const Uuid().v4(), isCompleted: true),
    ];

    when(() => mockRepository.getCompletionsForHabit(any()))
        .thenAnswer((_) async => completions);

    final result = await useCase.call('habit-id');

    expect(result.totalCompletions, 3);
    expect(result.currentStreak, 1); // today only
    expect(result.longestStreak, 1); // no two in a row
  });
}
