import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/signup_model.dart';


class API {
  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    String url = "https://tathayafoods.herokuapp.com/api/signup";

    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 201 || response.statusCode == 400) {
   

      return SignupResponseModel.fromJson(
        json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
//farmer api
class FarmerAPI {
  Future<SignupResponseModel> signup(SignupRequestModel requestModel) async {
    String url = "https://tathayafoods.herokuapp.com/api/farmer/signup";

    final response = await http.post(url, body: requestModel.toJson());
    if (response.statusCode == 201) {
      return SignupResponseModel.fromJson(
        json.decode(response.body),

      );
      
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
