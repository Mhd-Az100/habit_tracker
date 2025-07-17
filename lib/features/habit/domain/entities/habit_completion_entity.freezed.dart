// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_completion_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitCompletionEntity {
  String get id =>
      throw _privateConstructorUsedError; // Unique ID for the completion record
  String get habitId =>
      throw _privateConstructorUsedError; // Link to the HabitEntity
  DateTime get date => throw _privateConstructorUsedError;
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Create a copy of HabitCompletionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitCompletionEntityCopyWith<HabitCompletionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCompletionEntityCopyWith<$Res> {
  factory $HabitCompletionEntityCopyWith(HabitCompletionEntity value,
          $Res Function(HabitCompletionEntity) then) =
      _$HabitCompletionEntityCopyWithImpl<$Res, HabitCompletionEntity>;
  @useResult
  $Res call({String id, String habitId, DateTime date, bool isCompleted});
}

/// @nodoc
class _$HabitCompletionEntityCopyWithImpl<$Res,
        $Val extends HabitCompletionEntity>
    implements $HabitCompletionEntityCopyWith<$Res> {
  _$HabitCompletionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitCompletionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? habitId = null,
    Object? date = null,
    Object? isCompleted = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitCompletionEntityImplCopyWith<$Res>
    implements $HabitCompletionEntityCopyWith<$Res> {
  factory _$$HabitCompletionEntityImplCopyWith(
          _$HabitCompletionEntityImpl value,
          $Res Function(_$HabitCompletionEntityImpl) then) =
      __$$HabitCompletionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String habitId, DateTime date, bool isCompleted});
}

/// @nodoc
class __$$HabitCompletionEntityImplCopyWithImpl<$Res>
    extends _$HabitCompletionEntityCopyWithImpl<$Res,
        _$HabitCompletionEntityImpl>
    implements _$$HabitCompletionEntityImplCopyWith<$Res> {
  __$$HabitCompletionEntityImplCopyWithImpl(_$HabitCompletionEntityImpl _value,
      $Res Function(_$HabitCompletionEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitCompletionEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? habitId = null,
    Object? date = null,
    Object? isCompleted = null,
  }) {
    return _then(_$HabitCompletionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      habitId: null == habitId
          ? _value.habitId
          : habitId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isCompleted: null == isCompleted
          ? _value.isCompleted
          : isCompleted // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HabitCompletionEntityImpl implements _HabitCompletionEntity {
  const _$HabitCompletionEntityImpl(
      {required this.id,
      required this.habitId,
      required this.date,
      required this.isCompleted});

  @override
  final String id;
// Unique ID for the completion record
  @override
  final String habitId;
// Link to the HabitEntity
  @override
  final DateTime date;
  @override
  final bool isCompleted;

  @override
  String toString() {
    return 'HabitCompletionEntity(id: $id, habitId: $habitId, date: $date, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitCompletionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, habitId, date, isCompleted);

  /// Create a copy of HabitCompletionEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitCompletionEntityImplCopyWith<_$HabitCompletionEntityImpl>
      get copyWith => __$$HabitCompletionEntityImplCopyWithImpl<
          _$HabitCompletionEntityImpl>(this, _$identity);
}

abstract class _HabitCompletionEntity implements HabitCompletionEntity {
  const factory _HabitCompletionEntity(
      {required final String id,
      required final String habitId,
      required final DateTime date,
      required final bool isCompleted}) = _$HabitCompletionEntityImpl;

  @override
  String get id; // Unique ID for the completion record
  @override
  String get habitId; // Link to the HabitEntity
  @override
  DateTime get date;
  @override
  bool get isCompleted;

  /// Create a copy of HabitCompletionEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitCompletionEntityImplCopyWith<_$HabitCompletionEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
