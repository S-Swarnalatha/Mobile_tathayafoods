import '../api/subscribe_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginResponseModel  {
  final String token;
  final String error;

  LoginResponseModel({this.token, this.error});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      token: json["token"] != null ? json["token"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
 

}


class LoginRequestModel {
  String email;
  String password;

  LoginRequestModel({
    this.email,
    this.password,
       

  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'email': email,
      'password': password,
      
    };

    return map;
  }
}
