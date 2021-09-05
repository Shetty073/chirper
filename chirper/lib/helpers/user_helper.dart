
import 'dart:io';

import 'package:chirper/services/boxes.dart';
import 'package:chirper/services/user_service.dart';
import 'package:http/http.dart';

class UserHelper {
  Future updateProfilePhoto({required File? pickedFile}) async {
    final userService = UserService();

    MultipartFile photo;
    Map responseData;
    if(pickedFile != null) {
      photo = await MultipartFile.fromPath('photo', pickedFile.path);
      responseData = await userService.updatePhoto(photo: photo);

      if(responseData['nModified'] != null) {
        String newProfilePhotoUrl = responseData['profilePhoto'];

        final box = Boxes.getUsers();
        var user = box.get('user')!;
        user.photo = newProfilePhotoUrl;
        box.put('user', user);

        return true;
      }
    }

    return false;
  }
}
