import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageHelper {
  // Create storage
  final storage = new FlutterSecureStorage();

  Future readVal({required String key}) async {
    // read and return val of key
    String? value = await storage.read(key: key);
    return value;
  }

  Future writeVal({required Map data}) async {
    // write key : value data
    for(final key in data.keys) {
      await storage.write(key: key, value: data[key]);
    }
  }

}