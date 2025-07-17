// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_habit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitDeleteState {
  bool get isDeleteMode => throw _privateConstructorUsedError;
  List<String> get selectedIds => throw _privateConstructorUsedError;

  /// Create a copy of HabitDeleteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitDeleteStateCopyWith<HabitDeleteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitDeleteStateCopyWith<$Res> {
  factory $HabitDeleteStateCopyWith(
          HabitDeleteState value, $Res Function(HabitDeleteState) then) =
      _$HabitDeleteStateCopyWithImpl<$Res, HabitDeleteState>;
  @useResult
  $Res call({bool isDeleteMode, List<String> selectedIds});
}

/// @nodoc
class _$HabitDeleteStateCopyWithImpl<$Res, $Val extends HabitDeleteState>
    implements $HabitDeleteStateCopyWith<$Res> {
  _$HabitDeleteStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitDeleteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDeleteMode = null,
    Object? selectedIds = null,
  }) {
    return _then(_value.copyWith(
      isDeleteMode: null == isDeleteMode
          ? _value.isDeleteMode
          : isDeleteMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIds: null == selectedIds
          ? _value.selectedIds
          : selectedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitDeleteStateImplCopyWith<$Res>
    implements $HabitDeleteStateCopyWith<$Res> {
  factory _$$HabitDeleteStateImplCopyWith(_$HabitDeleteStateImpl value,
          $Res Function(_$HabitDeleteStateImpl) then) =
      __$$HabitDeleteStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isDeleteMode, List<String> selectedIds});
}

/// @nodoc
class __$$HabitDeleteStateImplCopyWithImpl<$Res>
    extends _$HabitDeleteStateCopyWithImpl<$Res, _$HabitDeleteStateImpl>
    implements _$$HabitDeleteStateImplCopyWith<$Res> {
  __$$HabitDeleteStateImplCopyWithImpl(_$HabitDeleteStateImpl _value,
      $Res Function(_$HabitDeleteStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitDeleteState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isDeleteMode = null,
    Object? selectedIds = null,
  }) {
    return _then(_$HabitDeleteStateImpl(
      isDeleteMode: null == isDeleteMode
          ? _value.isDeleteMode
          : isDeleteMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIds: null == selectedIds
          ? _value._selectedIds
          : selectedIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$HabitDeleteStateImpl implements _HabitDeleteState {
  const _$HabitDeleteStateImpl(
      {this.isDeleteMode = false, final List<String> selectedIds = const []})
      : _selectedIds = selectedIds;

  @override
  @JsonKey()
  final bool isDeleteMode;
  final List<String> _selectedIds;
  @override
  @JsonKey()
  List<String> get selectedIds {
    if (_selectedIds is EqualUnmodifiableListView) return _selectedIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedIds);
  }

  @override
  String toString() {
    return 'HabitDeleteState(isDeleteMode: $isDeleteMode, selectedIds: $selectedIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitDeleteStateImpl &&
            (identical(other.isDeleteMode, isDeleteMode) ||
                other.isDeleteMode == isDeleteMode) &&
            const DeepCollectionEquality()
                .equals(other._selectedIds, _selectedIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isDeleteMode,
      const DeepCollectionEquality().hash(_selectedIds));

  /// Create a copy of HabitDeleteState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitDeleteStateImplCopyWith<_$HabitDeleteStateImpl> get copyWith =>
      __$$HabitDeleteStateImplCopyWithImpl<_$HabitDeleteStateImpl>(
          this, _$identity);
}

abstract class _HabitDeleteState implements HabitDeleteState {
  const factory _HabitDeleteState(
      {final bool isDeleteMode,
      final List<String> selectedIds}) = _$HabitDeleteStateImpl;

  @override
  bool get isDeleteMode;
  @override
  List<String> get selectedIds;

  /// Create a copy of HabitDeleteState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitDeleteStateImplCopyWith<_$HabitDeleteStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
