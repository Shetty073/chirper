// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User()
      ..userId = fields[0] as String?
      ..name = fields[1] as String
      ..username = fields[2] as String
      ..photo = fields[3] as String?
      ..email = fields[4] as String?
      ..dob = fields[5] as DateTime?
      ..location = fields[6] as String?
      ..isBot = fields[7] as bool
      ..followers = fields[8] as int?
      ..following = fields[9] as int?;
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.username)
      ..writeByte(3)
      ..write(obj.photo)
      ..writeByte(4)
      ..write(obj.email)
      ..writeByte(5)
      ..write(obj.dob)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.isBot)
      ..writeByte(8)
      ..write(obj.followers)
      ..writeByte(9)
      ..write(obj.following);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
