// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_habit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddHabitFormState {
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  RecurrenceType get recurrenceType => throw _privateConstructorUsedError;
  List<int> get daysOfWeek => throw _privateConstructorUsedError;
  String get everyXDays => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;
  bool get isEdit => throw _privateConstructorUsedError;

  /// Create a copy of AddHabitFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddHabitFormStateCopyWith<AddHabitFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddHabitFormStateCopyWith<$Res> {
  factory $AddHabitFormStateCopyWith(
          AddHabitFormState value, $Res Function(AddHabitFormState) then) =
      _$AddHabitFormStateCopyWithImpl<$Res, AddHabitFormState>;
  @useResult
  $Res call(
      {String name,
      String description,
      RecurrenceType recurrenceType,
      List<int> daysOfWeek,
      String everyXDays,
      bool isValid,
      bool isEdit});
}

/// @nodoc
class _$AddHabitFormStateCopyWithImpl<$Res, $Val extends AddHabitFormState>
    implements $AddHabitFormStateCopyWith<$Res> {
  _$AddHabitFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddHabitFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? recurrenceType = null,
    Object? daysOfWeek = null,
    Object? everyXDays = null,
    Object? isValid = null,
    Object? isEdit = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      recurrenceType: null == recurrenceType
          ? _value.recurrenceType
          : recurrenceType // ignore: cast_nullable_to_non_nullable
              as RecurrenceType,
      daysOfWeek: null == daysOfWeek
          ? _value.daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      everyXDays: null == everyXDays
          ? _value.everyXDays
          : everyXDays // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddHabitFormStateImplCopyWith<$Res>
    implements $AddHabitFormStateCopyWith<$Res> {
  factory _$$AddHabitFormStateImplCopyWith(_$AddHabitFormStateImpl value,
          $Res Function(_$AddHabitFormStateImpl) then) =
      __$$AddHabitFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String description,
      RecurrenceType recurrenceType,
      List<int> daysOfWeek,
      String everyXDays,
      bool isValid,
      bool isEdit});
}

/// @nodoc
class __$$AddHabitFormStateImplCopyWithImpl<$Res>
    extends _$AddHabitFormStateCopyWithImpl<$Res, _$AddHabitFormStateImpl>
    implements _$$AddHabitFormStateImplCopyWith<$Res> {
  __$$AddHabitFormStateImplCopyWithImpl(_$AddHabitFormStateImpl _value,
      $Res Function(_$AddHabitFormStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AddHabitFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? recurrenceType = null,
    Object? daysOfWeek = null,
    Object? everyXDays = null,
    Object? isValid = null,
    Object? isEdit = null,
  }) {
    return _then(_$AddHabitFormStateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      recurrenceType: null == recurrenceType
          ? _value.recurrenceType
          : recurrenceType // ignore: cast_nullable_to_non_nullable
              as RecurrenceType,
      daysOfWeek: null == daysOfWeek
          ? _value._daysOfWeek
          : daysOfWeek // ignore: cast_nullable_to_non_nullable
              as List<int>,
      everyXDays: null == everyXDays
          ? _value.everyXDays
          : everyXDays // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      isEdit: null == isEdit
          ? _value.isEdit
          : isEdit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddHabitFormStateImpl implements _AddHabitFormState {
  const _$AddHabitFormStateImpl(
      {this.name = '',
      this.description = '',
      this.recurrenceType = RecurrenceType.daily,
      final List<int> daysOfWeek = const [],
      this.everyXDays = '',
      this.isValid = false,
      this.isEdit = false})
      : _daysOfWeek = daysOfWeek;

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String description;
  @override
  @JsonKey()
  final RecurrenceType recurrenceType;
  final List<int> _daysOfWeek;
  @override
  @JsonKey()
  List<int> get daysOfWeek {
    if (_daysOfWeek is EqualUnmodifiableListView) return _daysOfWeek;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_daysOfWeek);
  }

  @override
  @JsonKey()
  final String everyXDays;
  @override
  @JsonKey()
  final bool isValid;
  @override
  @JsonKey()
  final bool isEdit;

  @override
  String toString() {
    return 'AddHabitFormState(name: $name, description: $description, recurrenceType: $recurrenceType, daysOfWeek: $daysOfWeek, everyXDays: $everyXDays, isValid: $isValid, isEdit: $isEdit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddHabitFormStateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.recurrenceType, recurrenceType) ||
                other.recurrenceType == recurrenceType) &&
            const DeepCollectionEquality()
                .equals(other._daysOfWeek, _daysOfWeek) &&
            (identical(other.everyXDays, everyXDays) ||
                other.everyXDays == everyXDays) &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.isEdit, isEdit) || other.isEdit == isEdit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      recurrenceType,
      const DeepCollectionEquality().hash(_daysOfWeek),
      everyXDays,
      isValid,
      isEdit);

  /// Create a copy of AddHabitFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddHabitFormStateImplCopyWith<_$AddHabitFormStateImpl> get copyWith =>
      __$$AddHabitFormStateImplCopyWithImpl<_$AddHabitFormStateImpl>(
          this, _$identity);
}

abstract class _AddHabitFormState implements AddHabitFormState {
  const factory _AddHabitFormState(
      {final String name,
      final String description,
      final RecurrenceType recurrenceType,
      final List<int> daysOfWeek,
      final String everyXDays,
      final bool isValid,
      final bool isEdit}) = _$AddHabitFormStateImpl;

  @override
  String get name;
  @override
  String get description;
  @override
  RecurrenceType get recurrenceType;
  @override
  List<int> get daysOfWeek;
  @override
  String get everyXDays;
  @override
  bool get isValid;
  @override
  bool get isEdit;

  /// Create a copy of AddHabitFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddHabitFormStateImplCopyWith<_$AddHabitFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
