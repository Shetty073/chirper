import 'package:chirper/data/models/chirp.dart';
import 'package:chirper/helpers/date_time_helper.dart';
import 'package:chirper/services/boxes.dart';
import 'package:hive/hive.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketIoService {
  static IO.Socket? socket;

  static void connect() {
    if (socket == null) {
      socket = IO.io(
          'http://192.168.1.100:3000',
          IO.OptionBuilder()
              .setTransports(['websocket', 'polling']) // for Flutter or Dart VM
              .disableAutoConnect() // disable auto-connection
              // .setExtraHeaders({'foo': 'bar'}) // optional
              .build());
    }

    Box box = Boxes.getUsers();
    var user = box.get('user');

    if (socket!.disconnected) {
      socket!.connect();
      socket!.emit('join', user?.userId);
    }
  }

  static void listen() {
    if (socket == null) {
      connect();
    } else {
      if (socket!.disconnected) {
        connect();
      }
    }

    socket!.on('joined', (data) {
      print('socket connected and joined');
    });

    socket!.on('chirp', (chirp) {
      LazyBox box = Boxes.getChirps();
      if (!box.containsKey(chirp['_id'])) {
        Chirp myChirp = Chirp()
          ..userId = chirp['author']['_id']
          ..chirpId = chirp['_id']
          ..name = chirp['author']['name']
          ..username = chirp['author']['username']
          ..profilePhoto = chirp['author']['photo']
          ..text = chirp['text']
          ..noOfLikes = chirp['likedBy'].length
          ..noOfReChirps = chirp['rechirpedBy'].length
          ..noOfReplies = chirp['replies'].length
          ..dateTime = DateTimeHelper.getParsedDate(chirp['createdAt']);

        if (chirp['photos'].length > 0) {
          if (chirp['photos'][0] != null) {
            myChirp.photos = List<String>.from(chirp['photos']);
          }
        }

        box.put(chirp['_id'], myChirp);
      }
    });
  }
}
