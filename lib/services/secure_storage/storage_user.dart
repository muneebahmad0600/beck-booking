import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/common/constants.dart';
import '../../core/models/login/login_result.dart';

class StorageUser {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future saveUserData(LoginResult data) async {
    await storage.write(
        key: Constant.USER_ID_KEY, value: data.userId.toString());
    // storage.write(key: Constant.USER_EMAIL_KEY, value: result.email);
    // storage.write(
    //     key: Constant.PERSON_ID_KEY, value: result.personId.toString());
    await storage.write(key: Constant.AUTH_TOKEN_KEY, value: data.accessToken);
  }

  Future save(String key, String value) async {
    return await storage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await storage.read(key: key);
  }

  Future<Map<String, String>> readAll() async {
    return await storage.readAll();
  }

  Future<void> remove(String key) async {
    return await storage.delete(key: key);
  }

  Future<void> clear() async {
    await storage.deleteAll();
  }
}
