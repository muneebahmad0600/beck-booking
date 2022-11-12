import 'dart:developer';

import 'package:beck_booking/core/models/response/base_response.dart';
import 'package:get/get.dart';

import '../http/http_service.dart';
import '../http/http_service_base.dart';
import 'group_service_base.dart';

class GroupService extends GroupServiceBase {
  final HttpServiceBase _httpService = Get.put(HttpService());

  GroupService() {
    _httpService.init();
  }

  @override
  Future<BaseResponse> getGroups(Map<String, dynamic> params) async {
    String url = 'api/services/app/Group/GetPagedResult';
    try {
      var response = await _httpService.get(url, params: params);
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }
}
