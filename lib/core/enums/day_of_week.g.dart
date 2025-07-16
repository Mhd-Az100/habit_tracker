// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_of_week.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayOfWeekAdapter extends TypeAdapter<DayOfWeek> {
  @override
  final int typeId = 1;

  @override
  DayOfWeek read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DayOfWeek.monday;
      case 1:
        return DayOfWeek.tuesday;
      case 2:
        return DayOfWeek.wednesday;
      case 3:
        return DayOfWeek.thursday;
      case 4:
        return DayOfWeek.friday;
      case 5:
        return DayOfWeek.saturday;
      case 6:
        return DayOfWeek.sunday;
      default:
        return DayOfWeek.monday;
    }
  }

  @override
  void write(BinaryWriter writer, DayOfWeek obj) {
    switch (obj) {
      case DayOfWeek.monday:
        writer.writeByte(0);
        break;
      case DayOfWeek.tuesday:
        writer.writeByte(1);
        break;
      case DayOfWeek.wednesday:
        writer.writeByte(2);
        break;
      case DayOfWeek.thursday:
        writer.writeByte(3);
        break;
      case DayOfWeek.friday:
        writer.writeByte(4);
        break;
      case DayOfWeek.saturday:
        writer.writeByte(5);
        break;
      case DayOfWeek.sunday:
        writer.writeByte(6);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayOfWeekAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
