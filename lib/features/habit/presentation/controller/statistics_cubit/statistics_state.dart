part of 'statistics_cubit.dart';

@freezed
class StatisticsState with _$StatisticsState {
  const factory StatisticsState({
    @Default(0.0) double completionRate,
    @Default(0) int daysCompletedLast7Days,
    @Default(0) int daysCompletedLast30Days,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _StatisticsState;
}