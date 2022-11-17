import 'package:beck_booking/services/secure_storage/storage_user.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../core/common/constants.dart';
import '../../main.dart';
import 'http_service_base.dart';

class HttpService implements HttpServiceBase {
  String _baseUrl = "";
  final Dio _dio = Dio();

  HttpService() {
    _baseUrl = dotenv.env["API_URL"] ?? 'API_URL not found';
  }
  @override
  void init() async {
    var authToken = await storage.read(key: Constant.AUTH_TOKEN_KEY);
    if (authToken == null || authToken.isEmpty) {
      authToken = '';
    }
    _dio.options = BaseOptions(headers: {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $authToken',
    });
  }

  @override
  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    var requestUrl = _baseUrl + url;
    Response response;
    try {
      response = await _dio.get(requestUrl,
          queryParameters: params,
          options: Options(headers: {
            Constant.TENANT_COOKIE_KEY:
                await StorageUser().read(Constant.TENANT_COOKIE_KEY)
          }));
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.message);
      throw Exception(e.message);
    }

    return response;
  }

  @override
  Future<Response> post(url, body) async {
    var requestUrl = _baseUrl + url;
    Response response;
    try {
      response = await _dio.post(requestUrl,
          data: body,
          options: Options(headers: {
            Constant.TENANT_COOKIE_KEY:
                await StorageUser().read(Constant.TENANT_COOKIE_KEY)
          }));
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> put(url, body) async {
    Response response;
    try {
      response = await _dio.post(url, data: body);
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }

  @override
  Future<Response> delete(url, body) async {
    Response response;
    try {
      response = await _dio.delete(url, data: body);
    } on DioError catch (e) {
      // ignore: avoid_print
      print(e.message);
      throw Exception(e.message);
    }
    return response;
  }
}
