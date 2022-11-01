import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/common/constants.dart';
import '../../core/models/login/login_result.dart';

class StorageUser {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  void writeUserInformationToStorage(LoginResult data) {
    storage.write(key: Constant.USER_ID_KEY, value: data.userId.toString());
    // storage.write(key: Constant.USER_EMAIL_KEY, value: result.email);
    // storage.write(
    //     key: Constant.PERSON_ID_KEY, value: result.personId.toString());
    storage.write(key: Constant.AUTH_TOKEN_KEY, value: data.accessToken);
  }

  Future writeUserStorage(String key, String value) async {
    return await storage.write(key: key, value: value);
  }

  Future<String?> readUserStorage(String key) async {
    return await storage.read(key: key);
  }

  Future<Map<String, String>> readAllUserStorage() async {
    return await storage.readAll();
  }

  Future<void> removeUserStorage(String key) async {
    return await storage.delete(key: key);
  }

  Future<void> removeAllUserStorage() async {
    await storage.deleteAll();
  }
}
