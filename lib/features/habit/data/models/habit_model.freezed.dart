// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HabitModel _$HabitModelFromJson(Map<String, dynamic> json) {
  return _HabitModel.fromJson(json);
}

/// @nodoc
mixin _$HabitModel {
  @HiveField(0)
  String get id => throw _privateConstructorUsedError;
  @HiveField(1)
  String get name => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get description => throw _privateConstructorUsedError;
  @HiveField(3)
  RecurrenceType get recurrenceType =>
      throw _privateConstructorUsedError; // Using separate fields for clarity and type safety
  @HiveField(4)
  List<int>? get daysOfWeek =>
      throw _privateConstructorUsedError; // For weekly recurrence (e.g., [1, 3, 5] for Mon, Wed, Fri)
  @HiveField(5)
  int? get everyXDays =>
      throw _privateConstructorUsedError; // For "every X days" recurrence (e.g., 3)
  @HiveField(6)
  DateTime get createdAt =>
      throw _privateConstructorUsedError; // Crucially, this tracks multiple completion dates
  @HiveField(7)
  List<String> get completionDates => throw _privateConstructorUsedError;

  /// Serializes this HabitModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitModelCopyWith<HabitModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitModelCopyWith<$Res> {
  factory $HabitModelCopyWith(
          HabitModel value, $Res Function(HabitModel) then) =
      _$HabitModelCopyWithImpl<$Res, HabitModel>;
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3) RecurrenceType recurrenceType,
      @HiveField(4) List<int>? daysOfWeek,
      @HiveField(5) int? everyXDays,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) List<String> completionDates});
}

/// @nodoc
class _$HabitModelCopyWithImpl<$Res, $Val extends HabitModel>
    implements $HabitModelCopyWith<$Res> {
  _$HabitModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? recurrenceType = null,
    Object? daysOfWeek = freezed,
    Object? everyXDays = freezed,
    Object? createdAt = null,
    Object? completionDates = null,
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
      recurrenceType: null == recurrenceType
          ? _value.recurrenceType
          : recurrenceType // ignore: cast_nullable_to_non_nullable
              as RecurrenceType,
      daysOfWeek: freezed == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      everyXDays: freezed == everyXDays
          ? _value.everyXDays
          : everyXDays // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completionDates: null == completionDates
          ? _value.completionDates
          : completionDates // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitModelImplCopyWith<$Res>
    implements $HabitModelCopyWith<$Res> {
  factory _$$HabitModelImplCopyWith(
          _$HabitModelImpl value, $Res Function(_$HabitModelImpl) then) =
      __$$HabitModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String id,
      @HiveField(1) String name,
      @HiveField(2) String? description,
      @HiveField(3) RecurrenceType recurrenceType,
      @HiveField(4) List<int>? daysOfWeek,
      @HiveField(5) int? everyXDays,
      @HiveField(6) DateTime createdAt,
      @HiveField(7) List<String> completionDates});
}

/// @nodoc
class __$$HabitModelImplCopyWithImpl<$Res>
    extends _$HabitModelCopyWithImpl<$Res, _$HabitModelImpl>
    implements _$$HabitModelImplCopyWith<$Res> {
  __$$HabitModelImplCopyWithImpl(
      _$HabitModelImpl _value, $Res Function(_$HabitModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = freezed,
    Object? recurrenceType = null,
    Object? daysOfWeek = freezed,
    Object? everyXDays = freezed,
    Object? createdAt = null,
    Object? completionDates = null,
  }) {
    return _then(_$HabitModelImpl(
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
      recurrenceType: null == recurrenceType
          ? _value.recurrenceType
          : recurrenceType // ignore: cast_nullable_to_non_nullable
              as RecurrenceType,
      daysOfWeek: freezed == daysOfWeek
          ? _value._daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      everyXDays: freezed == everyXDays
          ? _value.everyXDays
          : everyXDays // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      completionDates: null == completionDates
          ? _value._completionDates
          : completionDates // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HabitModelImpl implements _HabitModel {
  const _$HabitModelImpl(
      {@HiveField(0) required this.id,
      @HiveField(1) required this.name,
      @HiveField(2) this.description,
      @HiveField(3) required this.recurrenceType,
      @HiveField(4) final List<int>? daysOfWeek,
      @HiveField(5) this.everyXDays,
      @HiveField(6) required this.createdAt,
      @HiveField(7) final List<String> completionDates = const []})
      : _daysOfWeek = daysOfWeek,
        _completionDates = completionDates;

  factory _$HabitModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HabitModelImplFromJson(json);

  @override
  @HiveField(0)
  final String id;
  @override
  @HiveField(1)
  final String name;
  @override
  @HiveField(2)
  final String? description;
  @override
  @HiveField(3)
  final RecurrenceType recurrenceType;
// Using separate fields for clarity and type safety
  final List<int>? _daysOfWeek;
// Using separate fields for clarity and type safety
  @override
  @HiveField(4)
  List<int>? get daysOfWeek {
    final value = _daysOfWeek;
    if (value == null) return null;
    if (_daysOfWeek is EqualUnmodifiableListView) return _daysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// For weekly recurrence (e.g., [1, 3, 5] for Mon, Wed, Fri)
  @override
  @HiveField(5)
  final int? everyXDays;
// For "every X days" recurrence (e.g., 3)
  @override
  @HiveField(6)
  final DateTime createdAt;
// Crucially, this tracks multiple completion dates
  final List<String> _completionDates;
// Crucially, this tracks multiple completion dates
  @override
  @JsonKey()
  @HiveField(7)
  List<String> get completionDates {
    if (_completionDates is EqualUnmodifiableListView) return _completionDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completionDates);
  }

  @override
  String toString() {
    return 'HabitModel(id: $id, name: $name, description: $description, recurrenceType: $recurrenceType, daysOfWeek: $daysOfWeek, everyXDays: $everyXDays, createdAt: $createdAt, completionDates: $completionDates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.recurrenceType, recurrenceType) ||
                other.recurrenceType == recurrenceType) &&
            const DeepCollectionEquality()
                .equals(other._daysOfWeek, _daysOfWeek) &&
            (identical(other.everyXDays, everyXDays) ||
                other.everyXDays == everyXDays) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._completionDates, _completionDates));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      recurrenceType,
      const DeepCollectionEquality().hash(_daysOfWeek),
      everyXDays,
      createdAt,
      const DeepCollectionEquality().hash(_completionDates));

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitModelImplCopyWith<_$HabitModelImpl> get copyWith =>
      __$$HabitModelImplCopyWithImpl<_$HabitModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HabitModelImplToJson(
      this,
    );
  }
}

abstract class _HabitModel implements HabitModel {
  const factory _HabitModel(
      {@HiveField(0) required final String id,
      @HiveField(1) required final String name,
      @HiveField(2) final String? description,
      @HiveField(3) required final RecurrenceType recurrenceType,
      @HiveField(4) final List<int>? daysOfWeek,
      @HiveField(5) final int? everyXDays,
      @HiveField(6) required final DateTime createdAt,
      @HiveField(7) final List<String> completionDates}) = _$HabitModelImpl;

  factory _HabitModel.fromJson(Map<String, dynamic> json) =
      _$HabitModelImpl.fromJson;

  @override
  @HiveField(0)
  String get id;
  @override
  @HiveField(1)
  String get name;
  @override
  @HiveField(2)
  String? get description;
  @override
  @HiveField(3)
  RecurrenceType
      get recurrenceType; // Using separate fields for clarity and type safety
  @override
  @HiveField(4)
  List<int>?
      get daysOfWeek; // For weekly recurrence (e.g., [1, 3, 5] for Mon, Wed, Fri)
  @override
  @HiveField(5)
  int? get everyXDays; // For "every X days" recurrence (e.g., 3)
  @override
  @HiveField(6)
  DateTime get createdAt; // Crucially, this tracks multiple completion dates
  @override
  @HiveField(7)
  List<String> get completionDates;

  /// Create a copy of HabitModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitModelImplCopyWith<_$HabitModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
