import '../../core/models/response/base_response.dart';

abstract class GroupServiceBase {
  Future<BaseResponse> getGroups(Map<String, dynamic> params);
  Future<BaseResponse> getGroupInvites(Map<String, dynamic> params);
}
