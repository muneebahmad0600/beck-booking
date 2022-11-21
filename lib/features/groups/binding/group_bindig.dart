import 'package:get/get.dart';

import '../../../services/group/group_service.dart';
import '../controller/group_controller.dart';

class GroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GroupService());
    Get.lazyPut(() => GroupController());
  }
}
