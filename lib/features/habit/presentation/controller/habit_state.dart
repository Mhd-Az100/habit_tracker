part of 'habit_bloc.dart';

@freezed
class HabitState with _$HabitState {
  const factory HabitState.initial() = _Initial;
  const factory HabitState.loading() = _Loading;
  const factory HabitState.loaded(List<HabitEntity> habits) = _Loaded;
  const factory HabitState.habitLoaded(HabitEntity habit) = _HabitLoaded;
  const factory HabitState.statsLoaded(HabitStatsEntity stats) = _StatsLoaded;  // << new
  const factory HabitState.error(String message) = _Error;
}