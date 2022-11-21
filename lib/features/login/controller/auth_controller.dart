import 'package:beck_booking/core/models/login/session.dart';
import 'package:beck_booking/core/models/response/base_response.dart';
import 'package:beck_booking/global_bindings.dart';
import 'package:get/get.dart';

import '../../../core/common/constants.dart';
import '../../../core/models/login/login_input.dart';
import '../../../core/models/login/login_result.dart';
import '../../../core/models/tenant/tenant_result.dart';
import '../../../core/widgets/dialog.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/secure_storage/storage_user.dart';

class AuthController extends GetxController {
  Session? session;
  final secureStorage = StorageUser();
  final _authService = AuthService();

  void isTenantAvailable() async {
    try {
      BaseResponse response = await _authService.isTanentAvailable();
      if (!response.success!) {
        displaySnackbar(
            'Invalid Tenant', 'The tenant provided is not available.');
        return;
      }
      TenantResult tanent = TenantResult.fromJson(response.result);
      secureStorage.save(
          Constant.TENANT_COOKIE_KEY, tanent.tenantId!.toString());
    } on Exception {
      displaySnackbar('Error!', 'Error fetching tenant');
    }
  }

  Future<bool> login(String userName, String password) async {
    if (userName == "" || password == "") {
      return false;
    }
    try {
      var loginInput = LoginInput();
      loginInput.password = password;
      loginInput.userName = userName;
      BaseResponse response = await _authService.login(loginInput);
      if (!response.success!) {
        displaySnackbar('Something went wrong', 'please try again');
        return false;
      }
      LoginResult loginData = LoginResult.fromJson(response.result);
      if (loginData.userId == 0) {
        displaySnackbar('Invalid Credentials', 'Invalid username and password');
        return false;
      }
      await secureStorage.saveUserData(loginData);
      getSessionDataForUser();
      return true;
    } on Exception {
      displaySnackbar('Error In SignIn', 'Error in SignIn');
      return false;
    }
  }

  void getSessionDataForUser() async {
    try {
      BaseResponse response = await _authService.getSessionDataForUser();
      if (!response.success!) {
        displaySnackbar(
            'Invalid Tenant', 'The tenant provided is not available.');
        return;
      }
      session = Session.fromJson(response.result);
      update();
    } on Exception {
      displaySnackbar('Error!', 'Error fetching tenant');
    }
  }

  void logout() async {
    await secureStorage.clear();
    GlobalBindings().dependencies();
    Get.offAllNamed("/login");
  }
}
