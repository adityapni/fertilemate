class GetPaymentTokenModel {
  Result? result;
  int? status;
  String? message;

  GetPaymentTokenModel({this.result, this.status, this.message});

  GetPaymentTokenModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Result {
  String? token;
  String? expiration;

  Result({this.token, this.expiration});

  Result.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    expiration = json['expiration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['expiration'] = expiration;
    return data;
  }
}
