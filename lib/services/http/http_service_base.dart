import 'package:dio/dio.dart';

abstract class HttpServiceBase {
  void init();
  Future<Response> get(String url, {Map<String, dynamic>? params});
  Future<Response> post(String url, dynamic body);
  Future<Response> put(String url, dynamic body);
  Future<Response> delete(String url, dynamic body);
}
