import 'package:chirper/helpers/secure_storage_helper.dart';
import 'package:chirper/services/auth_service.dart';

class AuthHelper {
  final auth = AuthService();
  final secureStorageHelper = SecureStorageHelper();

  Future register({required Map<String, String> data}) async {
    Map responseData = await auth.register(data: data);

    // store the userId and authToken in secure_storage
    if (responseData['userId'] != null) {
      await secureStorageHelper.writeVal(data: responseData);
    }

    return responseData;
  }


  Future login({required Map<String, String> data}) async {
    Map responseData = await auth.login(data: data);

    // store the userId and authToken in secure_storage
    if (responseData['userId'] != null) {
      await secureStorageHelper.writeVal(data: responseData);
    }

    return responseData;
  }

}