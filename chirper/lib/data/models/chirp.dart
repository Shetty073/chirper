import 'package:hive/hive.dart';

part 'chirp.g.dart';

@HiveType(typeId: 0)
class Chirp {
  @HiveField(0)
  String? userId;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String username;

  @HiveField(3)
  late String profilePhoto;

  @HiveField(4)
  late String text;

  @HiveField(5)
  List<String>? photos;

  @HiveField(6)
  String? video;

  @HiveField(7)
  int? noOfLikes;

  @HiveField(8)
  int? noOfReplies;

  @HiveField(9)
  int? noOfReChirps;

  @HiveField(10)
  bool isRead = true;

  // TODO: Add datetime field
}
