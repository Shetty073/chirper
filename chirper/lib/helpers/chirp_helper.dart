import 'package:chirper/data/models/chirp.dart';
import 'package:chirper/services/chirp_service.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:chirper/services/boxes.dart';
import 'package:hive/hive.dart';

class ChirpHelper {

  Future chirp({required String chirp, XFile? pickedFile}) async {
    final chirpService = ChirpService();

    MultipartFile? photo;
    Map responseData;
    if(pickedFile != null) {
      photo = await MultipartFile.fromPath('photo', pickedFile.path);
      responseData = await chirpService.sendChirp(chirp: chirp, photo: photo);
    } else {
      responseData = await chirpService.sendChirp(chirp: chirp);
    }
    if(responseData['nModified'] != null) {
      if(responseData['chirp'] != null) {
        Map chirp = responseData['chirp'];
        Chirp myChirp = Chirp()
          ..userId = chirp['author']['_id']
          ..name = chirp['author']['name']
          ..username = chirp['author']['username']
          ..profilePhoto = chirp['author']['photo']
          ..text = chirp['text']
          ..noOfLikes = chirp['likedBy'].length
          ..noOfReChirps = chirp['rechirpedBy'].length
          ..noOfReplies = chirp['replies'].length;
        if(chirp['photos'].length > 0) {
          if(chirp['photos'][0] != null) {
            myChirp.photos = List<String>.from(chirp['photos']);
          }
        }

        LazyBox box = Boxes.getChirps();
        if(!box.containsKey(chirp['_id'])) {
          box.put(chirp['_id'], myChirp);
        }
      }

      return true;
    }


    return false;
  }
}