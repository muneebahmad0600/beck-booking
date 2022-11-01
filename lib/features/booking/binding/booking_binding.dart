import 'package:beck_booking/features/booking/controller/booking_controller.dart';
import 'package:beck_booking/services/booking/booking_service.dart';
import 'package:get/get.dart';

class BookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookingService());
    Get.put(BookingController());
  }
}
