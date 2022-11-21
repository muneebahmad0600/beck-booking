import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../core/common/constants.dart';
import '../../main.dart';

class DioRequest {
  static final DioRequest _singleton = DioRequest._internal();
  late Dio _dio;
  factory DioRequest() {
    return _singleton;
  }

  Dio get instance => _dio;

  DioRequest._internal() {
    var baseURL = dotenv.env["API_URL"] ?? 'API_URL not found';
    _dio = Dio(BaseOptions(
      baseUrl: baseURL,
      connectTimeout: 5000,
      receiveTimeout: 5000,
    ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest:
              (RequestOptions options, RequestInterceptorHandler handler) =>
                  requestInterceptor(options, handler),
          onResponse: (Response response, ResponseInterceptorHandler handler) =>
              responseInterceptor(response, handler),
          onError: (DioError dioError, ErrorInterceptorHandler handler) =>
              errorInterceptor(dioError, handler),
        ),
      );
  }

  requestInterceptor(
      RequestOptions options, RequestInterceptorHandler handler) async {
    var authToken = await storage.read(key: Constant.AUTH_TOKEN_KEY);
    var tenantId = await storage.read(key: Constant.TENANT_COOKIE_KEY);
    if (authToken != null && tenantId != null) {
      options.headers.addAll({
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $authToken',
        Constant.TENANT_COOKIE_KEY: tenantId,
      });
    }
    return handler.next(options);
  }

  responseInterceptor(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  errorInterceptor(DioError dioError, ErrorInterceptorHandler handler) {
    // switch (dioError.response!.statusCode) {
    //   case 440:
    //     Toastr.error('Session Expired, Please Login again');
    //     NavigationService().key.currentState?.pushNamed('login');
    //     break;
    //   case 500:
    //     Toastr.error('Something went wrong! Please try again');
    //     break;
    // }
    handler.next(dioError);
  }
}

// class HttpService implements HttpServiceBase {
//   String _baseUrl = "";
//   final Dio _dio = Dio();

//   HttpService() {
//     _baseUrl = dotenv.env["API_URL"] ?? 'API_URL not found';
//   }
//   @override
//   void init() async {
//     var authToken = await storage.read(key: Constant.AUTH_TOKEN_KEY);
//     if (authToken == null || authToken.isEmpty) {
//       authToken = '';
//     }
//     _dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest:
//             (RequestOptions options, RequestInterceptorHandler handler) =>
//                 requestInterceptor(options, handler),
//         onResponse: (Response response, ResponseInterceptorHandler handler) =>
//             handler.next(response),
//         onError: (DioError dioError, ErrorInterceptorHandler handler) =>
//             handler.next(dioError),
//       ),
//     );
//   }

//   dynamic requestInterceptor(
//     RequestOptions options,
//     RequestInterceptorHandler handler,
//   ) async {
//     var authToken = await storage.read(key: Constant.AUTH_TOKEN_KEY);
//     options.headers = ({
//       'Content-Type': 'application/json; charset=UTF-8',
//       'Authorization': 'Bearer $authToken',
//       Constant.TENANT_COOKIE_KEY:
//           await StorageUser().read(Constant.TENANT_COOKIE_KEY)
//     });

//     return handler.next(options);
//   }

//   @override
//   Future<Response> get(String url, {Map<String, dynamic>? params}) async {
//     var requestUrl = _baseUrl + url;
//     Response response;
//     try {
//       response = await _dio.get(requestUrl, queryParameters: params);
//     } on DioError catch (e) {
//       // ignore: avoid_print
//       print(e.message);
//       throw Exception(e.message);
//     }

//     return response;
//   }

//   @override
//   Future<Response> post(url, body) async {
//     var requestUrl = _baseUrl + url;
//     Response response;
//     try {
//       response = await _dio.post(requestUrl, data: body);
//     } on DioError catch (e) {
//       // ignore: avoid_print
//       print(e.message);
//       throw Exception(e.message);
//     }
//     return response;
//   }

//   @override
//   Future<Response> put(url, body) async {
//     Response response;
//     try {
//       response = await _dio.post(url, data: body);
//     } on DioError catch (e) {
//       // ignore: avoid_print
//       print(e.message);
//       throw Exception(e.message);
//     }
//     return response;
//   }

//   @override
//   Future<Response> delete(url, body) async {
//     Response response;
//     try {
//       response = await _dio.delete(url, data: body);
//     } on DioError catch (e) {
//       // ignore: avoid_print
//       print(e.message);
//       throw Exception(e.message);
//     }
//     return response;
//   }
// }
