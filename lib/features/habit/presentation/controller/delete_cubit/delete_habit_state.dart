part of 'delete_habit_cubit.dart';

@freezed
class HabitDeleteState with _$HabitDeleteState {
  const factory HabitDeleteState({
    @Default(false) bool isDeleteMode,
    @Default([]) List<String> selectedIds,
  }) = _HabitDeleteState;
}
