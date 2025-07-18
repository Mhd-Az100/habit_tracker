// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calendar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CalendarState {
  DateTime get focusedDay => throw _privateConstructorUsedError;
  DateTime get selectedDay => throw _privateConstructorUsedError;
  Map<DateTime, DayCompletionStatus> get dayStatuses =>
      throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalendarStateCopyWith<CalendarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateCopyWith<$Res> {
  factory $CalendarStateCopyWith(
          CalendarState value, $Res Function(CalendarState) then) =
      _$CalendarStateCopyWithImpl<$Res, CalendarState>;
  @useResult
  $Res call(
      {DateTime focusedDay,
      DateTime selectedDay,
      Map<DateTime, DayCompletionStatus> dayStatuses,
      String? errorMessage});
}

/// @nodoc
class _$CalendarStateCopyWithImpl<$Res, $Val extends CalendarState>
    implements $CalendarStateCopyWith<$Res> {
  _$CalendarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusedDay = null,
    Object? selectedDay = null,
    Object? dayStatuses = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayStatuses: null == dayStatuses
          ? _value.dayStatuses
          : dayStatuses // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, DayCompletionStatus>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalendarStateImplCopyWith<$Res>
    implements $CalendarStateCopyWith<$Res> {
  factory _$$CalendarStateImplCopyWith(
          _$CalendarStateImpl value, $Res Function(_$CalendarStateImpl) then) =
      __$$CalendarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime focusedDay,
      DateTime selectedDay,
      Map<DateTime, DayCompletionStatus> dayStatuses,
      String? errorMessage});
}

/// @nodoc
class __$$CalendarStateImplCopyWithImpl<$Res>
    extends _$CalendarStateCopyWithImpl<$Res, _$CalendarStateImpl>
    implements _$$CalendarStateImplCopyWith<$Res> {
  __$$CalendarStateImplCopyWithImpl(
      _$CalendarStateImpl _value, $Res Function(_$CalendarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? focusedDay = null,
    Object? selectedDay = null,
    Object? dayStatuses = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CalendarStateImpl(
      focusedDay: null == focusedDay
          ? _value.focusedDay
          : focusedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      selectedDay: null == selectedDay
          ? _value.selectedDay
          : selectedDay // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dayStatuses: null == dayStatuses
          ? _value._dayStatuses
          : dayStatuses // ignore: cast_nullable_to_non_nullable
              as Map<DateTime, DayCompletionStatus>,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CalendarStateImpl implements _CalendarState {
  const _$CalendarStateImpl(
      {required this.focusedDay,
      required this.selectedDay,
      required final Map<DateTime, DayCompletionStatus> dayStatuses,
      this.errorMessage})
      : _dayStatuses = dayStatuses;

  @override
  final DateTime focusedDay;
  @override
  final DateTime selectedDay;
  final Map<DateTime, DayCompletionStatus> _dayStatuses;
  @override
  Map<DateTime, DayCompletionStatus> get dayStatuses {
    if (_dayStatuses is EqualUnmodifiableMapView) return _dayStatuses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_dayStatuses);
  }

  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CalendarState(focusedDay: $focusedDay, selectedDay: $selectedDay, dayStatuses: $dayStatuses, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalendarStateImpl &&
            (identical(other.focusedDay, focusedDay) ||
                other.focusedDay == focusedDay) &&
            (identical(other.selectedDay, selectedDay) ||
                other.selectedDay == selectedDay) &&
            const DeepCollectionEquality()
                .equals(other._dayStatuses, _dayStatuses) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, focusedDay, selectedDay,
      const DeepCollectionEquality().hash(_dayStatuses), errorMessage);

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      __$$CalendarStateImplCopyWithImpl<_$CalendarStateImpl>(this, _$identity);
}

abstract class _CalendarState implements CalendarState {
  const factory _CalendarState(
      {required final DateTime focusedDay,
      required final DateTime selectedDay,
      required final Map<DateTime, DayCompletionStatus> dayStatuses,
      final String? errorMessage}) = _$CalendarStateImpl;

  @override
  DateTime get focusedDay;
  @override
  DateTime get selectedDay;
  @override
  Map<DateTime, DayCompletionStatus> get dayStatuses;
  @override
  String? get errorMessage;

  /// Create a copy of CalendarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalendarStateImplCopyWith<_$CalendarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
