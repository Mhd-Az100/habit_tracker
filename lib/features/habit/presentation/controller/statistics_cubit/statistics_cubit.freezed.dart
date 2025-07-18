// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatisticsState {
  double get completionRate =>
      throw _privateConstructorUsedError; // Overall completion rate as a percentage
  int get daysCompletedLast7Days =>
      throw _privateConstructorUsedError; // Number of distinct days with at least one completion
  int get daysCompletedLast30Days =>
      throw _privateConstructorUsedError; // Number of distinct days with at least one completion
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticsStateCopyWith<StatisticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsStateCopyWith<$Res> {
  factory $StatisticsStateCopyWith(
          StatisticsState value, $Res Function(StatisticsState) then) =
      _$StatisticsStateCopyWithImpl<$Res, StatisticsState>;
  @useResult
  $Res call(
      {double completionRate,
      int daysCompletedLast7Days,
      int daysCompletedLast30Days,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class _$StatisticsStateCopyWithImpl<$Res, $Val extends StatisticsState>
    implements $StatisticsStateCopyWith<$Res> {
  _$StatisticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completionRate = null,
    Object? daysCompletedLast7Days = null,
    Object? daysCompletedLast30Days = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      daysCompletedLast7Days: null == daysCompletedLast7Days
          ? _value.daysCompletedLast7Days
          : daysCompletedLast7Days // ignore: cast_nullable_to_non_nullable
              as int,
      daysCompletedLast30Days: null == daysCompletedLast30Days
          ? _value.daysCompletedLast30Days
          : daysCompletedLast30Days // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsStateImplCopyWith<$Res>
    implements $StatisticsStateCopyWith<$Res> {
  factory _$$StatisticsStateImplCopyWith(_$StatisticsStateImpl value,
          $Res Function(_$StatisticsStateImpl) then) =
      __$$StatisticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double completionRate,
      int daysCompletedLast7Days,
      int daysCompletedLast30Days,
      bool isLoading,
      String? errorMessage});
}

/// @nodoc
class __$$StatisticsStateImplCopyWithImpl<$Res>
    extends _$StatisticsStateCopyWithImpl<$Res, _$StatisticsStateImpl>
    implements _$$StatisticsStateImplCopyWith<$Res> {
  __$$StatisticsStateImplCopyWithImpl(
      _$StatisticsStateImpl _value, $Res Function(_$StatisticsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completionRate = null,
    Object? daysCompletedLast7Days = null,
    Object? daysCompletedLast30Days = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$StatisticsStateImpl(
      completionRate: null == completionRate
          ? _value.completionRate
          : completionRate // ignore: cast_nullable_to_non_nullable
              as double,
      daysCompletedLast7Days: null == daysCompletedLast7Days
          ? _value.daysCompletedLast7Days
          : daysCompletedLast7Days // ignore: cast_nullable_to_non_nullable
              as int,
      daysCompletedLast30Days: null == daysCompletedLast30Days
          ? _value.daysCompletedLast30Days
          : daysCompletedLast30Days // ignore: cast_nullable_to_non_nullable
              as int,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StatisticsStateImpl implements _StatisticsState {
  const _$StatisticsStateImpl(
      {this.completionRate = 0.0,
      this.daysCompletedLast7Days = 0,
      this.daysCompletedLast30Days = 0,
      this.isLoading = false,
      this.errorMessage});

  @override
  @JsonKey()
  final double completionRate;
// Overall completion rate as a percentage
  @override
  @JsonKey()
  final int daysCompletedLast7Days;
// Number of distinct days with at least one completion
  @override
  @JsonKey()
  final int daysCompletedLast30Days;
// Number of distinct days with at least one completion
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'StatisticsState(completionRate: $completionRate, daysCompletedLast7Days: $daysCompletedLast7Days, daysCompletedLast30Days: $daysCompletedLast30Days, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsStateImpl &&
            (identical(other.completionRate, completionRate) ||
                other.completionRate == completionRate) &&
            (identical(other.daysCompletedLast7Days, daysCompletedLast7Days) ||
                other.daysCompletedLast7Days == daysCompletedLast7Days) &&
            (identical(
                    other.daysCompletedLast30Days, daysCompletedLast30Days) ||
                other.daysCompletedLast30Days == daysCompletedLast30Days) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, completionRate,
      daysCompletedLast7Days, daysCompletedLast30Days, isLoading, errorMessage);

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsStateImplCopyWith<_$StatisticsStateImpl> get copyWith =>
      __$$StatisticsStateImplCopyWithImpl<_$StatisticsStateImpl>(
          this, _$identity);
}

abstract class _StatisticsState implements StatisticsState {
  const factory _StatisticsState(
      {final double completionRate,
      final int daysCompletedLast7Days,
      final int daysCompletedLast30Days,
      final bool isLoading,
      final String? errorMessage}) = _$StatisticsStateImpl;

  @override
  double get completionRate; // Overall completion rate as a percentage
  @override
  int get daysCompletedLast7Days; // Number of distinct days with at least one completion
  @override
  int get daysCompletedLast30Days; // Number of distinct days with at least one completion
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of StatisticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticsStateImplCopyWith<_$StatisticsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
