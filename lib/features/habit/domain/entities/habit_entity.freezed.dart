// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitEntity {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  RecurrenceType get recurrenceType =>
      throw _privateConstructorUsedError; // Enum for Daily, Weekly, Every X Days
  List<String> get completionDates =>
      throw _privateConstructorUsedError; // Stores YYYY-MM-DD strings for completed days
  List<int>? get daysOfWeek =>
      throw _privateConstructorUsedError; // weekly recurrence: 1=Monday, 7=Sunday
  int? get everyXDays => throw _privateConstructorUsedError;

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitEntityCopyWith<HabitEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitEntityCopyWith<$Res> {
  factory $HabitEntityCopyWith(
          HabitEntity value, $Res Function(HabitEntity) then) =
      _$HabitEntityCopyWithImpl<$Res, HabitEntity>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      DateTime createdAt,
      RecurrenceType recurrenceType,
      List<String> completionDates,
      List<int>? daysOfWeek,
      int? everyXDays});
}

/// @nodoc
class _$HabitEntityCopyWithImpl<$Res, $Val extends HabitEntity>
    implements $HabitEntityCopyWith<$Res> {
  _$HabitEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? recurrenceType = null,
    Object? completionDates = null,
    Object? daysOfWeek = freezed,
    Object? everyXDays = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurrenceType: null == recurrenceType
          ? _value.recurrenceType
          : recurrenceType // ignore: cast_nullable_to_non_nullable
              as RecurrenceType,
      completionDates: null == completionDates
          ? _value.completionDates
          : completionDates // ignore: cast_nullable_to_non_nullable
              as List<String>,
      daysOfWeek: freezed == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      everyXDays: freezed == everyXDays
          ? _value.everyXDays
          : everyXDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitEntityImplCopyWith<$Res>
    implements $HabitEntityCopyWith<$Res> {
  factory _$$HabitEntityImplCopyWith(
          _$HabitEntityImpl value, $Res Function(_$HabitEntityImpl) then) =
      __$$HabitEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? description,
      DateTime createdAt,
      RecurrenceType recurrenceType,
      List<String> completionDates,
      List<int>? daysOfWeek,
      int? everyXDays});
}

/// @nodoc
class __$$HabitEntityImplCopyWithImpl<$Res>
    extends _$HabitEntityCopyWithImpl<$Res, _$HabitEntityImpl>
    implements _$$HabitEntityImplCopyWith<$Res> {
  __$$HabitEntityImplCopyWithImpl(
      _$HabitEntityImpl _value, $Res Function(_$HabitEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? createdAt = null,
    Object? recurrenceType = null,
    Object? completionDates = null,
    Object? daysOfWeek = freezed,
    Object? everyXDays = freezed,
  }) {
    return _then(_$HabitEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      recurrenceType: null == recurrenceType
          ? _value.recurrenceType
          : recurrenceType // ignore: cast_nullable_to_non_nullable
              as RecurrenceType,
      completionDates: null == completionDates
          ? _value._completionDates
          : completionDates // ignore: cast_nullable_to_non_nullable
              as List<String>,
      daysOfWeek: freezed == daysOfWeek
          ? _value._daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      everyXDays: freezed == everyXDays
          ? _value.everyXDays
          : everyXDays // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$HabitEntityImpl implements _HabitEntity {
  const _$HabitEntityImpl(
      {required this.id,
      required this.name,
      this.description,
      required this.createdAt,
      required this.recurrenceType,
      final List<String> completionDates = const [],
      final List<int>? daysOfWeek,
      this.everyXDays})
      : _completionDates = completionDates,
        _daysOfWeek = daysOfWeek;

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final DateTime createdAt;
  @override
  final RecurrenceType recurrenceType;
// Enum for Daily, Weekly, Every X Days
  final List<String> _completionDates;
// Enum for Daily, Weekly, Every X Days
  @override
  @JsonKey()
  List<String> get completionDates {
    if (_completionDates is EqualUnmodifiableListView) return _completionDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completionDates);
  }

// Stores YYYY-MM-DD strings for completed days
  final List<int>? _daysOfWeek;
// Stores YYYY-MM-DD strings for completed days
  @override
  List<int>? get daysOfWeek {
    final value = _daysOfWeek;
    if (value == null) return null;
    if (_daysOfWeek is EqualUnmodifiableListView) return _daysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// weekly recurrence: 1=Monday, 7=Sunday
  @override
  final int? everyXDays;

  @override
  String toString() {
    return 'HabitEntity(id: $id, name: $name, description: $description, createdAt: $createdAt, recurrenceType: $recurrenceType, completionDates: $completionDates, daysOfWeek: $daysOfWeek, everyXDays: $everyXDays)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.recurrenceType, recurrenceType) ||
                other.recurrenceType == recurrenceType) &&
            const DeepCollectionEquality()
                .equals(other._completionDates, _completionDates) &&
            const DeepCollectionEquality()
                .equals(other._daysOfWeek, _daysOfWeek) &&
            (identical(other.everyXDays, everyXDays) ||
                other.everyXDays == everyXDays));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      createdAt,
      recurrenceType,
      const DeepCollectionEquality().hash(_completionDates),
      const DeepCollectionEquality().hash(_daysOfWeek),
      everyXDays);

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitEntityImplCopyWith<_$HabitEntityImpl> get copyWith =>
      __$$HabitEntityImplCopyWithImpl<_$HabitEntityImpl>(this, _$identity);
}

abstract class _HabitEntity implements HabitEntity {
  const factory _HabitEntity(
      {required final String id,
      required final String name,
      final String? description,
      required final DateTime createdAt,
      required final RecurrenceType recurrenceType,
      final List<String> completionDates,
      final List<int>? daysOfWeek,
      final int? everyXDays}) = _$HabitEntityImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get description;
  @override
  DateTime get createdAt;
  @override
  RecurrenceType get recurrenceType; // Enum for Daily, Weekly, Every X Days
  @override
  List<String>
      get completionDates; // Stores YYYY-MM-DD strings for completed days
  @override
  List<int>? get daysOfWeek; // weekly recurrence: 1=Monday, 7=Sunday
  @override
  int? get everyXDays;

  /// Create a copy of HabitEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitEntityImplCopyWith<_$HabitEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
