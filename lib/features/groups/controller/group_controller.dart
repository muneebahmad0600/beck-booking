import 'package:beck_booking/core/models/group/group_activity_result.dart';
import 'package:get/get.dart';

import '../../../core/models/group/group_list_result.dart';
import '../../../core/models/group/group_result.dart';
import '../../../core/models/response/base_response.dart';
import '../../../core/widgets/dialog.dart';
import '../../../services/group/group_service.dart';

class GroupController extends GetxController {
  final _groupService = Get.find<GroupService>();

  List<GroupResult> groups = [];

  Future<List<GroupResult>> getGroups(Map<String, dynamic> params) async {
    try {
      BaseResponse response = await _groupService.getGroups(params);
      if (response.success!) {
        var result = GroupListResult.fromJson(response.result);
        groups = result.items ?? [];
        update();
      }
      return groups;
    } on Exception {
      displaySnackbar('Error!', 'Error fetching bookings');
    }
    return groups;
  }

  Future<List<GroupActivityResult>> getGroupInvites(
      Map<String, dynamic> params) async {
    try {
      BaseResponse response = await _groupService.getGroupInvites(params);
      if (response.success!) {
        var result = GroupActivityListResult.fromJson(response.result);
        return result.items ?? [];
      }
      return [];
    } on Exception {
      displaySnackbar('Error!', 'Error fetching group invites');
    }
    return [];
  }
}
