import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'habit_completion_model.freezed.dart';
part 'habit_completion_model.g.dart';

@freezed
@HiveType(typeId: 3, adapterName: 'HabitCompletionModelAdapter')
class HabitCompletionModel with _$HabitCompletionModel {
  const factory HabitCompletionModel({
    @HiveField(0) required String id,
    @HiveField(1) required String habitId,
    @HiveField(2) required DateTime date,
    @HiveField(3) required bool isCompleted,
  }) = _HabitCompletionModel;

  factory HabitCompletionModel.fromJson(Map<String, dynamic> json) => _$HabitCompletionModelFromJson(json);
}
