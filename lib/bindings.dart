import 'package:beck_booking/features/booking/controller/booking_controller.dart';
import 'package:beck_booking/features/groups/controller/group_controller.dart';
import 'package:beck_booking/features/login/controller/login_controller.dart';
import 'package:beck_booking/features/main/controller/main_controller.dart';
import 'package:beck_booking/services/auth/auth_service.dart';
import 'package:beck_booking/services/booking/booking_service.dart';
import 'package:beck_booking/services/group/group_service.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => AuthService());
    Get.lazyPut(() => MainController());
    Get.lazyPut(() => BookingController());
    Get.lazyPut(() => BookingService());
    Get.lazyPut(() => GroupController());
    Get.lazyPut(() => GroupService());
  }
}
