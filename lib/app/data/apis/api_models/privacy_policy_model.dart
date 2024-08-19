class PrivacyPolicyModel {
  String? message;
  Data? data;
  String? status;

  PrivacyPolicyModel({this.message, this.data, this.status});

  PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  String? id;
  String? name;
  String? description;
  String? dateTime;

  Data({this.id, this.name, this.description, this.dateTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['date_time'] = dateTime;
    return data;
  }
}
