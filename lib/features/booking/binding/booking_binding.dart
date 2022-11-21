import 'package:get/get.dart';

import '../../../services/booking/booking_service.dart';
import '../controller/booking_controller.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BookingService());
    Get.lazyPut(() => BookingController());
  }
}
