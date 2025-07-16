// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_completion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HabitCompletionModel _$HabitCompletionModelFromJson(Map<String, dynamic> json) {
  return _HabitCompletionModel.fromJson(json);
}

/// @nodoc
mixin _$HabitCompletionModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get habitId => throw _privateConstructorUsedError;
  @HiveField(2)
  DateTime get date => throw _privateConstructorUsedError;
  @HiveField(3)
  bool get isCompleted => throw _privateConstructorUsedError;

  /// Serializes this HabitCompletionModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitCompletionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitCompletionModelCopyWith<HabitCompletionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitCompletionModelCopyWith<$Res> {
  factory $HabitCompletionModelCopyWith(HabitCompletionModel value,
          $Res Function(HabitCompletionModel) then) =
      _$HabitCompletionModelCopyWithImpl<$Res, HabitCompletionModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String habitId,
      @HiveField(2) DateTime date,
      @HiveField(3) bool isCompleted});
}

/// @nodoc
class _$HabitCompletionModelCopyWithImpl<$Res,
        $Val extends HabitCompletionModel>
    implements $HabitCompletionModelCopyWith<$Res> {
  _$HabitCompletionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitCompletionModel
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
abstract class _$$HabitCompletionModelImplCopyWith<$Res>
    implements $HabitCompletionModelCopyWith<$Res> {
  factory _$$HabitCompletionModelImplCopyWith(_$HabitCompletionModelImpl value,
          $Res Function(_$HabitCompletionModelImpl) then) =
      __$$HabitCompletionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String habitId,
      @HiveField(2) DateTime date,
      @HiveField(3) bool isCompleted});
}

/// @nodoc
class __$$HabitCompletionModelImplCopyWithImpl<$Res>
    extends _$HabitCompletionModelCopyWithImpl<$Res, _$HabitCompletionModelImpl>
    implements _$$HabitCompletionModelImplCopyWith<$Res> {
  __$$HabitCompletionModelImplCopyWithImpl(_$HabitCompletionModelImpl _value,
      $Res Function(_$HabitCompletionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitCompletionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? habitId = null,
    Object? date = null,
    Object? isCompleted = null,
  }) {
    return _then(_$HabitCompletionModelImpl(
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
@JsonSerializable()
class _$HabitCompletionModelImpl implements _HabitCompletionModel {
  const _$HabitCompletionModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.habitId,
      @HiveField(2) required this.date,
      @HiveField(3) required this.isCompleted});

  factory _$HabitCompletionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitCompletionModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String habitId;
  @override
  @HiveField(2)
  final DateTime date;
  @override
  @HiveField(3)
  final bool isCompleted;

  @override
  String toString() {
    return 'HabitCompletionModel(id: $id, habitId: $habitId, date: $date, isCompleted: $isCompleted)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitCompletionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.habitId, habitId) || other.habitId == habitId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.isCompleted, isCompleted) ||
                other.isCompleted == isCompleted));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, habitId, date, isCompleted);

  /// Create a copy of HabitCompletionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitCompletionModelImplCopyWith<_$HabitCompletionModelImpl>
      get copyWith =>
          __$$HabitCompletionModelImplCopyWithImpl<_$HabitCompletionModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitCompletionModelImplToJson(
      this,
    );
  }
}

abstract class _HabitCompletionModel implements HabitCompletionModel {
  const factory _HabitCompletionModel(
          {@HiveField(0) required final String id,
          @HiveField(1) required final String habitId,
          @HiveField(2) required final DateTime date,
          @HiveField(3) required final bool isCompleted}) =
      _$HabitCompletionModelImpl;

  factory _HabitCompletionModel.fromJson(Map<String, dynamic> json) =
      _$HabitCompletionModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get habitId;
  @override
  @HiveField(2)
  DateTime get date;
  @override
  @HiveField(3)
  bool get isCompleted;

  /// Create a copy of HabitCompletionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitCompletionModelImplCopyWith<_$HabitCompletionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
