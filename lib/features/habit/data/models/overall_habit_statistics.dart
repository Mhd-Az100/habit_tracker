import 'package:freezed_annotation/freezed_annotation.dart';

part 'overall_habit_statistics.freezed.dart';
@freezed
class OverallHabitStatisticsModel with _$OverallHabitStatisticsModel {
  factory OverallHabitStatisticsModel({
    required double completionRate,
    required int daysCompletedLast7Days,
    required int daysCompletedLast30Days,
  }) = _OverallHabitStatisticsModel;
}

