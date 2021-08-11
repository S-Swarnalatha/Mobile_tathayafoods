
class SubscribeResponseModel {
  final  data;
  final String error;

  SubscribeResponseModel({this.data, this.error});

  factory SubscribeResponseModel.fromJson(Map<String, dynamic> json) {
    return SubscribeResponseModel(
      data: json["data"] != null ? json["data"] : "",
      error: json["error"] != null ? json["error"] : "",
    );
  }
}

class SubscribeRequestModel {
  String Product;
  String start;
  String end;



  SubscribeRequestModel({
    this.Product,
    this.start,
        this.end,

  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = {
      'Product': Product,
      'start': start,
      'end': end,

    };

    return map;
  }
}
