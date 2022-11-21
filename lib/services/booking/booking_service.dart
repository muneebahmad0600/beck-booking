import 'dart:developer';

import 'package:beck_booking/core/models/booking/booking_comment_input.dart';
import 'package:beck_booking/core/models/response/base_response.dart';
import 'package:beck_booking/services/booking/booking_service_base.dart';
import 'package:dio/dio.dart';

import '../http/http_service.dart';

class BookingService implements BookingServiceBase {
  final Dio _httpService = DioRequest().instance;

  @override
  Future<BaseResponse> getBookings(Map<String, dynamic> params) async {
    String url = 'api/services/app/Booking/GetPagedResult';
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
  Future<BaseResponse> getBookingById(String id) async {
    String url = 'api/services/app/Booking/Get';
    try {
      var response = await _httpService.get(url, queryParameters: {'Id': id});
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }

  @override
  Future<BaseResponse> getBookingComments(String id) async {
    String url = 'api/services/app/Comment/GetAll';
    try {
      var response = await _httpService.get(url, queryParameters: {'Id': id});
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }

  @override
  Future<BaseResponse> addComment(BookingCommentInput comment) async {
    String url = 'api/services/app/Comment/Create';
    try {
      var response = await _httpService.post(url, data: comment);
      var parsedResponse = BaseResponse.fromJson(response.data);
      return parsedResponse;
    } on Exception catch (e) {
      log(e.toString());
    }
    return BaseResponse();
  }
}
