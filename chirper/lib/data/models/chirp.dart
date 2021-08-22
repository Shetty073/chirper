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
  late String text;

  @HiveField(4)
  List<String>? photos;

  @HiveField(5)
  String? video;

  @HiveField(6)
  int? noOfLikes;

  @HiveField(7)
  int? noOfReplies;

  @HiveField(8)
  int? noOfReChirps;
}
