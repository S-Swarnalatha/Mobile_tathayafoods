
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/address.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressAPI {

  Future<AddressResponseModel> address(AddressRequestModel requestModel) async {
     SharedPreferences  preferences= await SharedPreferences.getInstance();
 
    var savedtoken = preferences.getString('value_token');


    String url = "https://tathayafoods.herokuapp.com/api/address/create";

    final response = await http.post(url, headers:{
      "Authorization":"Bearer $savedtoken",
    },
    body: requestModel.toJson());
    
    if (response.statusCode == 200) {
      return AddressResponseModel.fromJson(
       json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}
class FarmerAddressAPI {

  Future<AddressResponseModel> address(AddressRequestModel requestModel) async {
     SharedPreferences  preferences= await SharedPreferences.getInstance();
 
    var savedtoken = preferences.getString('value_key');


    String url = "https://tathayafoods.herokuapp.com/api/address/create";

    final response = await http.post(url, headers:{
      "Authorization":"Bearer $savedtoken",
    },
    body: requestModel.toJson());
    
    if (response.statusCode == 200) {
      return AddressResponseModel.fromJson(
       json.decode(response.body),
      );
    } else {
      throw Exception('Failed to load data!');
    }
  }
}