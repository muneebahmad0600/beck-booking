import 'dart:convert';
import 'dart:developer';

import 'package:beck_booking/core/models/response/base_response.dart';
import 'package:beck_booking/core/models/tenant/tenant_input.dart';
import 'package:dio/dio.dart';
import '../../core/models/login/login_input.dart';
import '../http/http_service.dart';
import 'auth_service_base.dart';

class AuthService implements AuthServiceBase {
  final int? userId = null;
  final Dio _httpService = DioRequest().instance;

  // BeckIT
  // Mens_room
  // optician
  @override
  Future<BaseResponse> isTanentAvailable() async {
    TenantInput input = TenantInput(tenancyName: "optician");
    var url = 'api/services/app/Account/IsTenantAvailable';
    var data = json.encode(input.toJson());
    try {
      var response = await _httpService.post(url, data: data);
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }

  @override
  Future<BaseResponse> login(LoginInput input) async {
    var loginUrl = 'api/TokenAuth/Authenticate';
    var payload = input.toJson();
    try {
      var response = await _httpService.post(loginUrl, data: payload);
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }

  @override
  Future<BaseResponse> getSessionDataForUser() async {
    var loginUrl = 'api/services/app/Session/GetCurrentLoginInformations';
    try {
      var response = await _httpService.get(loginUrl);
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }
}
