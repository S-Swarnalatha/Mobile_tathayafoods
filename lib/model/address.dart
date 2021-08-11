class AddressResponseModel {
  final  msg;
  final String error;

  AddressResponseModel({this.msg, this.error});

  factory AddressResponseModel.fromJson(Map<String, dynamic> json) {
    return AddressResponseModel(
      msg: json["msg"] != null ? json["msg"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class AddressRequestModel {
  String doorNo;
  String streetName;
  String city;
  String state;
  String pincode;

  AddressRequestModel(
      {this.doorNo, 
      this.streetName,
      this.city, 
      this.pincode, 
      this.state});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'doorNo': doorNo,
      'streetName': streetName,
      'city': city,
      'state': state,
      'pincode': pincode,
    };

    return map;
  }
}
