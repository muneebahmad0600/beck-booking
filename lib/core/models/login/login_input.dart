import 'package:json_annotation/json_annotation.dart';
part 'login_input.g.dart';

@JsonSerializable()
class LoginInput {
  LoginInput();

  @JsonKey(name: 'userNameOrEmailAddress')
  String? userName = '';

  @JsonKey(name: 'password')
  String? password = '';

  @JsonKey(name: 'rememberClient')
  bool? rememberClient = false;

  factory LoginInput.fromJson(Map<String, dynamic> json) =>
      _$LoginInputFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInputToJson(this);
}
