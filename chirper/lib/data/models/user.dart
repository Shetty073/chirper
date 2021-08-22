import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String? userId;

  @HiveField(1)
  late String name;

  @HiveField(2)
  late String username;

  @HiveField(3)
  late String photo;

  @HiveField(4)
  late String email;

  @HiveField(5)
  late DateTime dob;

  @HiveField(6)
  late String location;

  @HiveField(7)
  late bool isBot;

  @HiveField(8)
  int? followers;

  @HiveField(9)
  int? following;
}
