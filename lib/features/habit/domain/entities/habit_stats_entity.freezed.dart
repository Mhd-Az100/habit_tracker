// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_stats_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HabitStatsEntity {
  int get totalCompletions => throw _privateConstructorUsedError;
  int get currentStreak => throw _privateConstructorUsedError;
  int get longestStreak => throw _privateConstructorUsedError;

  /// Create a copy of HabitStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HabitStatsEntityCopyWith<HabitStatsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HabitStatsEntityCopyWith<$Res> {
  factory $HabitStatsEntityCopyWith(
          HabitStatsEntity value, $Res Function(HabitStatsEntity) then) =
      _$HabitStatsEntityCopyWithImpl<$Res, HabitStatsEntity>;
  @useResult
  $Res call({int totalCompletions, int currentStreak, int longestStreak});
}

/// @nodoc
class _$HabitStatsEntityCopyWithImpl<$Res, $Val extends HabitStatsEntity>
    implements $HabitStatsEntityCopyWith<$Res> {
  _$HabitStatsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HabitStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCompletions = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
  }) {
    return _then(_value.copyWith(
      totalCompletions: null == totalCompletions
          ? _value.totalCompletions
          : totalCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HabitStatsEntityImplCopyWith<$Res>
    implements $HabitStatsEntityCopyWith<$Res> {
  factory _$$HabitStatsEntityImplCopyWith(_$HabitStatsEntityImpl value,
          $Res Function(_$HabitStatsEntityImpl) then) =
      __$$HabitStatsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalCompletions, int currentStreak, int longestStreak});
}

/// @nodoc
class __$$HabitStatsEntityImplCopyWithImpl<$Res>
    extends _$HabitStatsEntityCopyWithImpl<$Res, _$HabitStatsEntityImpl>
    implements _$$HabitStatsEntityImplCopyWith<$Res> {
  __$$HabitStatsEntityImplCopyWithImpl(_$HabitStatsEntityImpl _value,
      $Res Function(_$HabitStatsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of HabitStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalCompletions = null,
    Object? currentStreak = null,
    Object? longestStreak = null,
  }) {
    return _then(_$HabitStatsEntityImpl(
      totalCompletions: null == totalCompletions
          ? _value.totalCompletions
          : totalCompletions // ignore: cast_nullable_to_non_nullable
              as int,
      currentStreak: null == currentStreak
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      longestStreak: null == longestStreak
          ? _value.longestStreak
          : longestStreak // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$HabitStatsEntityImpl implements _HabitStatsEntity {
  const _$HabitStatsEntityImpl(
      {required this.totalCompletions,
      required this.currentStreak,
      required this.longestStreak});

  @override
  final int totalCompletions;
  @override
  final int currentStreak;
  @override
  final int longestStreak;

  @override
  String toString() {
    return 'HabitStatsEntity(totalCompletions: $totalCompletions, currentStreak: $currentStreak, longestStreak: $longestStreak)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HabitStatsEntityImpl &&
            (identical(other.totalCompletions, totalCompletions) ||
                other.totalCompletions == totalCompletions) &&
            (identical(other.currentStreak, currentStreak) ||
                other.currentStreak == currentStreak) &&
            (identical(other.longestStreak, longestStreak) ||
                other.longestStreak == longestStreak));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, totalCompletions, currentStreak, longestStreak);

  /// Create a copy of HabitStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HabitStatsEntityImplCopyWith<_$HabitStatsEntityImpl> get copyWith =>
      __$$HabitStatsEntityImplCopyWithImpl<_$HabitStatsEntityImpl>(
          this, _$identity);
}

abstract class _HabitStatsEntity implements HabitStatsEntity {
  const factory _HabitStatsEntity(
      {required final int totalCompletions,
      required final int currentStreak,
      required final int longestStreak}) = _$HabitStatsEntityImpl;

  @override
  int get totalCompletions;
  @override
  int get currentStreak;
  @override
  int get longestStreak;

  /// Create a copy of HabitStatsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HabitStatsEntityImplCopyWith<_$HabitStatsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
