import 'package:hive/hive.dart';

part 'chirp.g.dart';

@HiveType(typeId: 0)
class Chirp {
  @HiveField(0)
  String? userId;

  @HiveField(1)
  String? chirpId;

  @HiveField(2)
  late String name;

  @HiveField(3)
  late String username;

  @HiveField(4)
  late String? profilePhoto;

  @HiveField(5)
  late String text;

  @HiveField(6)
  List<String>? photos;

  @HiveField(7)
  String? video;

  @HiveField(8)
  int? noOfLikes;

  @HiveField(9)
  int? noOfReplies;

  @HiveField(10)
  int? noOfReChirps;

  @HiveField(11)
  bool isRead = true;

  @HiveField(12)
  late DateTime dateTime;
}
