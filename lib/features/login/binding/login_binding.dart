import 'package:get/get.dart';

import '../../../services/auth/auth_service.dart';
import '../controller/login_controller.dart';

class LoginBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthService());
    Get.put(LoginController());
  }
}
