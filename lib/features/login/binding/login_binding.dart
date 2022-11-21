import 'package:get/get.dart';

import '../../../services/auth/auth_service.dart';
import '../controller/auth_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => AuthController());
  }
}
