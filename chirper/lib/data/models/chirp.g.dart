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
      ..name = fields[1] as String
      ..username = fields[2] as String
      ..profilePhoto = fields[3] as String
      ..text = fields[4] as String
      ..photos = (fields[5] as List?)?.cast<String>()
      ..video = fields[6] as String?
      ..noOfLikes = fields[7] as int?
      ..noOfReplies = fields[8] as int?
      ..noOfReChirps = fields[9] as int?
      ..isRead = fields[10] as bool;
  }

  @override
  void write(BinaryWriter writer, Chirp obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.profilePhoto)
      ..writeByte(4)
      ..write(obj.text)
      ..writeByte(5)
      ..write(obj.photos)
      ..writeByte(6)
      ..write(obj.video)
      ..writeByte(7)
      ..write(obj.noOfLikes)
      ..writeByte(8)
      ..write(obj.noOfReplies)
      ..writeByte(9)
      ..write(obj.noOfReChirps)
      ..writeByte(10)
      ..write(obj.isRead);
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
