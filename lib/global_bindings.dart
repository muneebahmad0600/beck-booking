import 'package:beck_booking/features/booking/controller/booking_controller.dart';
import 'package:beck_booking/features/groups/controller/group_controller.dart';
import 'package:beck_booking/features/login/controller/auth_controller.dart';
import 'package:beck_booking/features/main/controller/main_controller.dart';
import 'package:beck_booking/services/auth/auth_service.dart';
import 'package:beck_booking/services/booking/booking_service.dart';
import 'package:beck_booking/services/group/group_service.dart';
import 'package:get/get.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(AuthService(), permanent: true);
    Get.put(MainController(), permanent: true);
    Get.put(BookingController(), permanent: true);
    Get.put(BookingService(), permanent: true);
    Get.put(GroupController(), permanent: true);
    Get.put(GroupService(), permanent: true);
  }
}
