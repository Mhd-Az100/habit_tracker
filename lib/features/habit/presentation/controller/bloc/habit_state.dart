part of 'habit_bloc.dart';

@freezed
class HabitState with _$HabitState {
  const factory HabitState.initial() = _Initial;
  const factory HabitState.loading() = _Loading;
  const factory HabitState.loaded({
    required List<HabitEntity> allHabits,
    required List<HabitEntity> habitsOfDay,
    required DateTime selectedDate,
  }) = _Loaded;
  const factory HabitState.statsLoaded(HabitStatsEntity stats) =
      _StatsLoaded;
  const factory HabitState.error(String message) = _Error;
}
