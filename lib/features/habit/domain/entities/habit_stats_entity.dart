import 'package:freezed_annotation/freezed_annotation.dart';
part 'habit_stats_entity.freezed.dart';

@freezed
class HabitStatsEntity with _$HabitStatsEntity {
  const factory HabitStatsEntity({
    required int totalCompletions,
    required int currentStreak,
    required int longestStreak,
  }) = _HabitStatsEntity;
}
