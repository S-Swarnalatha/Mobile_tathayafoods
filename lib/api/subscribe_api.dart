
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/subscribe_model.dart';
import 'package:shared_preferences/shared_preferences.dart';


 

//var token='eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI2MGYyNjA5ODA0Y2EwZDQ3ZGNmNTRjOTciLCJyb2xlIjoidXNlciIsImVtYWlsIjoicUBnbWFpbC5jb20iLCJpYXQiOjE2MjY2NzU4MTMsImV4cCI6MTYyNjY5MzgxM30.BRK2HIM9zh_A2nD0rxb9PlXXs5hcWh7C7R5EzoCLt3s',

 
class SubscribeAPI {

  Future<SubscribeResponseModel> subscribe(SubscribeRequestModel requestModel) async {
     SharedPreferences  preferences= await SharedPreferences.getInstance();
 
    var savedtoken = preferences.getString('value_token');
        var saveduserid = preferences.getString('value_userid');


    String url = "https://tathayafoods.herokuapp.com/api/subscribe";

    final response = await http.post(url, headers:{
      "Authorization":"Bearer $savedtoken",
      "user":"$saveduserid"
    },
    body: requestModel.toJson());
    
    if (response.statusCode == 200) {
      return SubscribeResponseModel.fromJson(
       json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
