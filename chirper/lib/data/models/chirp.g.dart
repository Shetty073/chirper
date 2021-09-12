// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chirp.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChirpAdapter extends TypeAdapter<Chirp> {
  @override
  final int typeId = 0;

  @override
  Chirp read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chirp()
      ..userId = fields[0] as String?
      ..chirpId = fields[1] as String?
      ..name = fields[2] as String
      ..username = fields[3] as String
      ..profilePhoto = fields[4] as String?
      ..text = fields[5] as String
      ..photos = (fields[6] as List?)?.cast<String>()
      ..video = fields[7] as String?
      ..noOfLikes = fields[8] as int?
      ..noOfReplies = fields[9] as int?
      ..noOfReChirps = fields[10] as int?
      ..isRead = fields[11] as bool
      ..dateTime = fields[12] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Chirp obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.chirpId)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.username)
      ..writeByte(4)
      ..write(obj.profilePhoto)
      ..writeByte(5)
      ..write(obj.text)
      ..writeByte(6)
      ..write(obj.photos)
      ..writeByte(7)
      ..write(obj.video)
      ..writeByte(8)
      ..write(obj.noOfLikes)
      ..writeByte(9)
      ..write(obj.noOfReplies)
      ..writeByte(10)
      ..write(obj.noOfReChirps)
      ..writeByte(11)
      ..write(obj.isRead)
      ..writeByte(12)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChirpAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
