import '../../core/models/login/login_input.dart';
import '../../core/models/response/base_response.dart';

abstract class AuthServiceBase {
  Future<BaseResponse> isTanentAvailable();
  Future<BaseResponse> login(LoginInput input);
}
