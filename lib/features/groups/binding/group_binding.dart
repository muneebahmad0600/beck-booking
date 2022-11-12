import 'package:beck_booking/features/groups/controller/group_controller.dart';
import 'package:beck_booking/services/group/group_service.dart';
import 'package:get/get.dart';

class GroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GroupController());
    Get.put(GroupService());
  }
}
