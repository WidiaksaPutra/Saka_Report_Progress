// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_list_type_progress_report.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DropdownListTypeProgressReportHiveAdapter
    extends TypeAdapter<DropdownListTypeProgressReportHive> {
  @override
  final int typeId = 1;

  @override
  DropdownListTypeProgressReportHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DropdownListTypeProgressReportHive(
      id: fields[0] as String,
      type: fields[1] as String,
      projectInputType: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DropdownListTypeProgressReportHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.projectInputType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropdownListTypeProgressReportHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
