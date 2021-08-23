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
  String? photo;

  @HiveField(4)
  String? email;

  @HiveField(5)
  DateTime? dob;

  @HiveField(6)
  String? location;

  @HiveField(7)
  bool isBot = false;

  @HiveField(8)
  int? followers;

  @HiveField(9)
  int? following;
}
