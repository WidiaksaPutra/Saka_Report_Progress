// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dropdown_list_project_progress_report.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DropdownListProjectProgressReportHiveAdapter
    extends TypeAdapter<DropdownListProjectProgressReportHive> {
  @override
  final int typeId = 2;

  @override
  DropdownListProjectProgressReportHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DropdownListProjectProgressReportHive(
      id: fields[0] as String,
      type: fields[1] as String,
      label: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DropdownListProjectProgressReportHive obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.label);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropdownListProjectProgressReportHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
