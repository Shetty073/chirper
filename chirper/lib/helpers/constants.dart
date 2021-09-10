
class Constants {
  static const BASE_URI = 'http://192.168.1.100:3000';

  // auth
  static const REGISTER_URI = '$BASE_URI/api/auth/register';
  static const LOGIN_URI = '$BASE_URI/api/auth/login';

  // user routes
  static const USERDATA_URI = '$BASE_URI/api/user';
  static const USER_PROFILE_PHOTO_UPDATE_URI = '$USERDATA_URI/profilephoto/change';
  static const FEED_URI = '$BASE_URI/api/user/feed';

  // chirp routes
  static const CREATE_CHIRP_URI = '$BASE_URI/api/chirp/create';
}
