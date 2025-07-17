// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recurrence_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RecurrenceDetails {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() daily,
    required TResult Function(List<DayOfWeek> days) weekly,
    required TResult Function(int daysInterval) everyXDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? daily,
    TResult? Function(List<DayOfWeek> days)? weekly,
    TResult? Function(int daysInterval)? everyXDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? daily,
    TResult Function(List<DayOfWeek> days)? weekly,
    TResult Function(int daysInterval)? everyXDays,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecurrenceDetailsDaily value) daily,
    required TResult Function(_RecurrenceDetailsWeekly value) weekly,
    required TResult Function(_RecurrenceDetailsEveryXDays value) everyXDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RecurrenceDetailsDaily value)? daily,
    TResult? Function(_RecurrenceDetailsWeekly value)? weekly,
    TResult? Function(_RecurrenceDetailsEveryXDays value)? everyXDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecurrenceDetailsDaily value)? daily,
    TResult Function(_RecurrenceDetailsWeekly value)? weekly,
    TResult Function(_RecurrenceDetailsEveryXDays value)? everyXDays,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecurrenceDetailsCopyWith<$Res> {
  factory $RecurrenceDetailsCopyWith(
          RecurrenceDetails value, $Res Function(RecurrenceDetails) then) =
      _$RecurrenceDetailsCopyWithImpl<$Res, RecurrenceDetails>;
}

/// @nodoc
class _$RecurrenceDetailsCopyWithImpl<$Res, $Val extends RecurrenceDetails>
    implements $RecurrenceDetailsCopyWith<$Res> {
  _$RecurrenceDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecurrenceDetails
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RecurrenceDetailsDailyImplCopyWith<$Res> {
  factory _$$RecurrenceDetailsDailyImplCopyWith(
          _$RecurrenceDetailsDailyImpl value,
          $Res Function(_$RecurrenceDetailsDailyImpl) then) =
      __$$RecurrenceDetailsDailyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RecurrenceDetailsDailyImplCopyWithImpl<$Res>
    extends _$RecurrenceDetailsCopyWithImpl<$Res, _$RecurrenceDetailsDailyImpl>
    implements _$$RecurrenceDetailsDailyImplCopyWith<$Res> {
  __$$RecurrenceDetailsDailyImplCopyWithImpl(
      _$RecurrenceDetailsDailyImpl _value,
      $Res Function(_$RecurrenceDetailsDailyImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecurrenceDetails
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RecurrenceDetailsDailyImpl extends _RecurrenceDetailsDaily {
  const _$RecurrenceDetailsDailyImpl() : super._();

  @override
  String toString() {
    return 'RecurrenceDetails.daily()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurrenceDetailsDailyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() daily,
    required TResult Function(List<DayOfWeek> days) weekly,
    required TResult Function(int daysInterval) everyXDays,
  }) {
    return daily();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? daily,
    TResult? Function(List<DayOfWeek> days)? weekly,
    TResult? Function(int daysInterval)? everyXDays,
  }) {
    return daily?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? daily,
    TResult Function(List<DayOfWeek> days)? weekly,
    TResult Function(int daysInterval)? everyXDays,
    required TResult orElse(),
  }) {
    if (daily != null) {
      return daily();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecurrenceDetailsDaily value) daily,
    required TResult Function(_RecurrenceDetailsWeekly value) weekly,
    required TResult Function(_RecurrenceDetailsEveryXDays value) everyXDays,
  }) {
    return daily(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RecurrenceDetailsDaily value)? daily,
    TResult? Function(_RecurrenceDetailsWeekly value)? weekly,
    TResult? Function(_RecurrenceDetailsEveryXDays value)? everyXDays,
  }) {
    return daily?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecurrenceDetailsDaily value)? daily,
    TResult Function(_RecurrenceDetailsWeekly value)? weekly,
    TResult Function(_RecurrenceDetailsEveryXDays value)? everyXDays,
    required TResult orElse(),
  }) {
    if (daily != null) {
      return daily(this);
    }
    return orElse();
  }
}

abstract class _RecurrenceDetailsDaily extends RecurrenceDetails {
  const factory _RecurrenceDetailsDaily() = _$RecurrenceDetailsDailyImpl;
  const _RecurrenceDetailsDaily._() : super._();
}

/// @nodoc
abstract class _$$RecurrenceDetailsWeeklyImplCopyWith<$Res> {
  factory _$$RecurrenceDetailsWeeklyImplCopyWith(
          _$RecurrenceDetailsWeeklyImpl value,
          $Res Function(_$RecurrenceDetailsWeeklyImpl) then) =
      __$$RecurrenceDetailsWeeklyImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<DayOfWeek> days});
}

/// @nodoc
class __$$RecurrenceDetailsWeeklyImplCopyWithImpl<$Res>
    extends _$RecurrenceDetailsCopyWithImpl<$Res, _$RecurrenceDetailsWeeklyImpl>
    implements _$$RecurrenceDetailsWeeklyImplCopyWith<$Res> {
  __$$RecurrenceDetailsWeeklyImplCopyWithImpl(
      _$RecurrenceDetailsWeeklyImpl _value,
      $Res Function(_$RecurrenceDetailsWeeklyImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecurrenceDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
  }) {
    return _then(_$RecurrenceDetailsWeeklyImpl(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<DayOfWeek>,
    ));
  }
}

/// @nodoc

class _$RecurrenceDetailsWeeklyImpl extends _RecurrenceDetailsWeekly {
  const _$RecurrenceDetailsWeeklyImpl({required final List<DayOfWeek> days})
      : _days = days,
        super._();

  final List<DayOfWeek> _days;
  @override
  List<DayOfWeek> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'RecurrenceDetails.weekly(days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurrenceDetailsWeeklyImpl &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_days));

  /// Create a copy of RecurrenceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurrenceDetailsWeeklyImplCopyWith<_$RecurrenceDetailsWeeklyImpl>
      get copyWith => __$$RecurrenceDetailsWeeklyImplCopyWithImpl<
          _$RecurrenceDetailsWeeklyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() daily,
    required TResult Function(List<DayOfWeek> days) weekly,
    required TResult Function(int daysInterval) everyXDays,
  }) {
    return weekly(days);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? daily,
    TResult? Function(List<DayOfWeek> days)? weekly,
    TResult? Function(int daysInterval)? everyXDays,
  }) {
    return weekly?.call(days);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? daily,
    TResult Function(List<DayOfWeek> days)? weekly,
    TResult Function(int daysInterval)? everyXDays,
    required TResult orElse(),
  }) {
    if (weekly != null) {
      return weekly(days);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecurrenceDetailsDaily value) daily,
    required TResult Function(_RecurrenceDetailsWeekly value) weekly,
    required TResult Function(_RecurrenceDetailsEveryXDays value) everyXDays,
  }) {
    return weekly(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RecurrenceDetailsDaily value)? daily,
    TResult? Function(_RecurrenceDetailsWeekly value)? weekly,
    TResult? Function(_RecurrenceDetailsEveryXDays value)? everyXDays,
  }) {
    return weekly?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecurrenceDetailsDaily value)? daily,
    TResult Function(_RecurrenceDetailsWeekly value)? weekly,
    TResult Function(_RecurrenceDetailsEveryXDays value)? everyXDays,
    required TResult orElse(),
  }) {
    if (weekly != null) {
      return weekly(this);
    }
    return orElse();
  }
}

abstract class _RecurrenceDetailsWeekly extends RecurrenceDetails {
  const factory _RecurrenceDetailsWeekly(
      {required final List<DayOfWeek> days}) = _$RecurrenceDetailsWeeklyImpl;
  const _RecurrenceDetailsWeekly._() : super._();

  List<DayOfWeek> get days;

  /// Create a copy of RecurrenceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurrenceDetailsWeeklyImplCopyWith<_$RecurrenceDetailsWeeklyImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RecurrenceDetailsEveryXDaysImplCopyWith<$Res> {
  factory _$$RecurrenceDetailsEveryXDaysImplCopyWith(
          _$RecurrenceDetailsEveryXDaysImpl value,
          $Res Function(_$RecurrenceDetailsEveryXDaysImpl) then) =
      __$$RecurrenceDetailsEveryXDaysImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int daysInterval});
}

/// @nodoc
class __$$RecurrenceDetailsEveryXDaysImplCopyWithImpl<$Res>
    extends _$RecurrenceDetailsCopyWithImpl<$Res,
        _$RecurrenceDetailsEveryXDaysImpl>
    implements _$$RecurrenceDetailsEveryXDaysImplCopyWith<$Res> {
  __$$RecurrenceDetailsEveryXDaysImplCopyWithImpl(
      _$RecurrenceDetailsEveryXDaysImpl _value,
      $Res Function(_$RecurrenceDetailsEveryXDaysImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecurrenceDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? daysInterval = null,
  }) {
    return _then(_$RecurrenceDetailsEveryXDaysImpl(
      daysInterval: null == daysInterval
          ? _value.daysInterval
          : daysInterval // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RecurrenceDetailsEveryXDaysImpl extends _RecurrenceDetailsEveryXDays {
  const _$RecurrenceDetailsEveryXDaysImpl({required this.daysInterval})
      : super._();

  @override
  final int daysInterval;

  @override
  String toString() {
    return 'RecurrenceDetails.everyXDays(daysInterval: $daysInterval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecurrenceDetailsEveryXDaysImpl &&
            (identical(other.daysInterval, daysInterval) ||
                other.daysInterval == daysInterval));
  }

  @override
  int get hashCode => Object.hash(runtimeType, daysInterval);

  /// Create a copy of RecurrenceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecurrenceDetailsEveryXDaysImplCopyWith<_$RecurrenceDetailsEveryXDaysImpl>
      get copyWith => __$$RecurrenceDetailsEveryXDaysImplCopyWithImpl<
          _$RecurrenceDetailsEveryXDaysImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() daily,
    required TResult Function(List<DayOfWeek> days) weekly,
    required TResult Function(int daysInterval) everyXDays,
  }) {
    return everyXDays(daysInterval);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? daily,
    TResult? Function(List<DayOfWeek> days)? weekly,
    TResult? Function(int daysInterval)? everyXDays,
  }) {
    return everyXDays?.call(daysInterval);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? daily,
    TResult Function(List<DayOfWeek> days)? weekly,
    TResult Function(int daysInterval)? everyXDays,
    required TResult orElse(),
  }) {
    if (everyXDays != null) {
      return everyXDays(daysInterval);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_RecurrenceDetailsDaily value) daily,
    required TResult Function(_RecurrenceDetailsWeekly value) weekly,
    required TResult Function(_RecurrenceDetailsEveryXDays value) everyXDays,
  }) {
    return everyXDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_RecurrenceDetailsDaily value)? daily,
    TResult? Function(_RecurrenceDetailsWeekly value)? weekly,
    TResult? Function(_RecurrenceDetailsEveryXDays value)? everyXDays,
  }) {
    return everyXDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_RecurrenceDetailsDaily value)? daily,
    TResult Function(_RecurrenceDetailsWeekly value)? weekly,
    TResult Function(_RecurrenceDetailsEveryXDays value)? everyXDays,
    required TResult orElse(),
  }) {
    if (everyXDays != null) {
      return everyXDays(this);
    }
    return orElse();
  }
}

abstract class _RecurrenceDetailsEveryXDays extends RecurrenceDetails {
  const factory _RecurrenceDetailsEveryXDays(
      {required final int daysInterval}) = _$RecurrenceDetailsEveryXDaysImpl;
  const _RecurrenceDetailsEveryXDays._() : super._();

  int get daysInterval;

  /// Create a copy of RecurrenceDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecurrenceDetailsEveryXDaysImplCopyWith<_$RecurrenceDetailsEveryXDaysImpl>
      get copyWith => throw _privateConstructorUsedError;
}
