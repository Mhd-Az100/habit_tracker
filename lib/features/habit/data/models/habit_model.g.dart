// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'habit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HabitModelAdapter extends TypeAdapter<HabitModel> {
  @override
  final int typeId = 2;

  @override
  HabitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HabitModel(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String?,
      recurrenceType: fields[3] as RecurrenceType,
      recurrenceValue: fields[4] as dynamic,
      createdAt: fields[5] as DateTime,
      completedDate: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, HabitModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.recurrenceType)
      ..writeByte(4)
      ..write(obj.recurrenceValue)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.completedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HabitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HabitImpl _$$HabitImplFromJson(Map<String, dynamic> json) => _$HabitImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      recurrenceType:
          $enumDecode(_$RecurrenceTypeEnumMap, json['recurrenceType']),
      recurrenceValue: json['recurrenceValue'],
      createdAt: DateTime.parse(json['createdAt'] as String),
      completedDate: DateTime.parse(json['completedDate'] as String),
    );

Map<String, dynamic> _$$HabitImplToJson(_$HabitImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'recurrenceType': _$RecurrenceTypeEnumMap[instance.recurrenceType]!,
      'recurrenceValue': instance.recurrenceValue,
      'createdAt': instance.createdAt.toIso8601String(),
      'completedDate': instance.completedDate.toIso8601String(),
    };

const _$RecurrenceTypeEnumMap = {
  RecurrenceType.daily: 'daily',
  RecurrenceType.weekly: 'weekly',
  RecurrenceType.everyXDays: 'everyXDays',
};
