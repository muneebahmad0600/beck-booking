// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginInput _$LoginInputFromJson(Map<String, dynamic> json) => LoginInput()
  ..userName = json['userNameOrEmailAddress'] as String?
  ..password = json['password'] as String?
  ..rememberClient = json['rememberClient'] as bool?;

Map<String, dynamic> _$LoginInputToJson(LoginInput instance) =>
    <String, dynamic>{
      'userNameOrEmailAddress': instance.userName,
      'password': instance.password,
      'rememberClient': instance.rememberClient,
    };
