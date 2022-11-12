import 'package:beck_booking/core/models/response/base_response.dart';
import 'package:get/get.dart';

import '../../../core/common/constants.dart';
import '../../../core/models/login/login_input.dart';
import '../../../core/models/login/login_result.dart';
import '../../../core/models/tenant/tenant_result.dart';
import '../../../core/widgets/dialog.dart';
import '../../../services/auth/auth_service.dart';
import '../../../services/secure_storage/storage_user.dart';

class LoginController extends GetxController {
  final secureStorage = StorageUser();
  final _authService = Get.find<AuthService>();

  var loginInput = LoginInput();

  void isTenantAvailable() async {
    try {
      BaseResponse response = await _authService.isTanentAvailable();
      if (!response.success!) {
        displaySnackbar(
            'Invalid Tenant', 'The tenant provided is not available.');
        return;
      }
      TenantResult tanent = TenantResult.fromJson(response.result);
      secureStorage.writeUserStorage(
          Constant.COOKIE_KEY, tanent.tenantId!.toString());
    } on Exception {
      displaySnackbar('Error!', 'Error fetching tenant');
    }
  }

  void login(String userName, String password) async {
    if (userName == "" || password == "") {
      return;
    }
    try {
      loginInput.password = password;
      loginInput.userName = userName;
      BaseResponse response = await _authService.login(loginInput);
      if (!response.success!) {
        displaySnackbar('Something went wrong', 'please try again');
        return;
      }
      LoginResult loginData = LoginResult.fromJson(response.result);
      if (loginData.userId == 0) {
        displaySnackbar('Invalid Credentials', 'Invalid username and password');
        return;
      }
      secureStorage.writeUserInformationToStorage(loginData);
      Get.offAllNamed('/main');
    } on Exception {
      displaySnackbar('Error In SignIn', 'Error in SignIn');
    }
  }
}
