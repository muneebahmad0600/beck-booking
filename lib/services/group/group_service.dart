import 'dart:developer';

import 'package:beck_booking/core/models/response/base_response.dart';
import 'package:dio/dio.dart';

import '../http/http_service.dart';
import 'group_service_base.dart';

class GroupService extends GroupServiceBase {
  final Dio _httpService = DioRequest().instance;

  @override
  Future<BaseResponse> getGroups(Map<String, dynamic> params) async {
    String url = 'api/services/app/Group/GetPagedResult';
    try {
      var response = await _httpService.get(url, queryParameters: params);
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }

  @override
  Future<BaseResponse> getGroupInvites(Map<String, dynamic> params) async {
    String url = 'api/services/app/Invite/GetGroupInvites';
    try {
      var response = await _httpService.get(url, queryParameters: params);
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }
}
