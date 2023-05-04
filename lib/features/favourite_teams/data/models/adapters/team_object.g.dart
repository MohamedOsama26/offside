// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../team_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamObjectAdapter extends TypeAdapter<TeamObject> {
  @override
  final int typeId = 2;

  @override
  TeamObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamObject(
      team: fields[0] as Team,
      teamVenue: fields[1] as TeamVenue?,
    );
  }

  @override
  void write(BinaryWriter writer, TeamObject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.team)
      ..writeByte(1)
      ..write(obj.teamVenue);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
