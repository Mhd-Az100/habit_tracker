import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'delete_habit_cubit.freezed.dart';
part 'delete_habit_state.dart';

@Injectable()
class HabitDeleteCubit extends Cubit<HabitDeleteState> {
  HabitDeleteCubit() : super(const HabitDeleteState());

  void enterDeleteMode() => emit(state.copyWith(isDeleteMode: true));

  void exitDeleteMode() => emit(const HabitDeleteState());

  void toggleSelection(String habitId) {
    final selected = List<String>.from(state.selectedIds);
    if (selected.contains(habitId)) {
      selected.remove(habitId);
    } else {
      selected.add(habitId);
    }
    emit(state.copyWith(selectedIds: selected));
  }

  void clearSelection() => emit(state.copyWith(selectedIds: []));

  bool isSelected(String habitId) => state.selectedIds.contains(habitId);
}
