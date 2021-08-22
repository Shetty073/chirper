import 'package:chirper/data/models/user.dart';
import 'package:hive/hive.dart';
import 'package:chirper/data/models/chirp.dart';

class Boxes {
  static LazyBox<Chirp> getChirps() => Hive.lazyBox<Chirp>('chirps');
  static Box<User> getUsers() => Hive.box<User>('users');
}
