// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../team_venue.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TeamVenueAdapter extends TypeAdapter<TeamVenue> {
  @override
  final int typeId = 1;

  @override
  TeamVenue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TeamVenue(
      id: fields[0] as int?,
      name: fields[1] as String?,
      address: fields[3] as String?,
      city: fields[4] as String?,
      capacity: fields[5] as int?,
      surface: fields[6] as String?,
      image: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TeamVenue obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.address)
      ..writeByte(4)
      ..write(obj.city)
      ..writeByte(5)
      ..write(obj.capacity)
      ..writeByte(6)
      ..write(obj.surface)
      ..writeByte(7)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TeamVenueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
