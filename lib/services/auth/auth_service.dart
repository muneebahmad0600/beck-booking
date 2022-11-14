import 'dart:convert';
import 'dart:developer';

import 'package:beck_booking/core/models/response/base_response.dart';
import 'package:beck_booking/core/models/tenant/tenant_input.dart';
import 'package:get/get.dart';
import '../../core/models/login/login_input.dart';
import '../http/http_service.dart';
import '../http/http_service_base.dart';
import 'auth_service_base.dart';

class AuthService implements AuthServiceBase {
  final int? userId = null;
  final HttpServiceBase _httpService = Get.put(HttpService());
  AuthService() {
    _httpService.init();
  }

  @override
  Future<BaseResponse> login(LoginInput input) async {
    var loginUrl = 'api/TokenAuth/Authenticate';
    var loginData = input.toJson();
    try {
      var response = await _httpService.post(loginUrl, loginData);
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }

  // BeckIT
  // Mens_room
  // optician
  @override
  Future<BaseResponse> isTanentAvailable() async {
    TenantInput input = TenantInput(tenancyName: "optician");
    var url = 'api/services/app/Account/IsTenantAvailable';
    var data = json.encode(input.toJson());
    try {
      var response = await _httpService.post(url, data);
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }
}
