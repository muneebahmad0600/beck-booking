import 'dart:convert';

class Helpers{
  static decodeToken(String? token){
    Map<String,dynamic> tokenData = json.decode(ascii
        .decode(base64.decode(base64.normalize(token!.split(".")[1]))));
    return tokenData;
  }
}