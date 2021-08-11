class SignupResponseModel {
  final String message;
  

  SignupResponseModel({this.message});

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) {
    return SignupResponseModel(
     message : json["message"] != null ? json["message"] : "",
    );
  }
}

class SignupRequestModel {
  String firstName;
  String lastName;
  String email;
  String password;
 

  SignupRequestModel({
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    

  });

  Map<String,dynamic> toJson() {
    Map<String, dynamic> map = {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      

    };

    return map;
  }
}
