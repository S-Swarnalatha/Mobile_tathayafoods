import '../api/subscribe_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
//void setValues() async {
//     SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
//     // set values

//     sharedPrefs.setString('token', );
//     print('Values Set in Shared Prefs!!');
//   }

// void getValues() async {
//   print('Getting Values from shared Preferences');
//   SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
//   String user_name = sharedPrefs.getString('user_name');
//    String user_id = sharedPrefs.getString('user_id');
//    String notification_prefs = sharedPrefs.getString('notification_prefs');

//    print('user_name: ${user_name}');
//    print('user_id: ${user_id}');
//    print('notification_prefs: ${notification_prefs}');
// }

class APIService {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://tathayafoods.herokuapp.com/api/signin";

    final response = await http.post(url, body: requestModel.toJson());
    var preferences = await SharedPreferences.getInstance();
    preferences.setString('value_token', json.decode(response.body)['token']);
    preferences.setString('value_userid', json.decode(response.body)['_id']);

    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}

class FarmerLoginAPI {
  Future<LoginResponseModel> login(LoginRequestModel requestModel) async {
    String url = "https://tathayafoods.herokuapp.com/api/farmer/signin";

    final response = await http.post(url, body: requestModel.toJson());
    var preferences = await SharedPreferences.getInstance();
    preferences.setString('value_key', json.decode(response.body)['token']);
    if (response.statusCode == 200 || response.statusCode == 400) {
      return LoginResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
