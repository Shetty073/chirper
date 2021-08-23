import 'package:chirper/services/chirp_service.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';

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
      print(responseData);
      return true;
    }

    return false;
  }
}