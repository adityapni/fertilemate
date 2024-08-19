class IntimacyGetIntimacyInsightsModel {
  ResultData? resultData;
  String? message;
  String? status;

  IntimacyGetIntimacyInsightsModel({this.resultData, this.message, this.status});

  IntimacyGetIntimacyInsightsModel.fromJson(Map<String, dynamic> json) {
    resultData = json['result'] != null ? ResultData.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resultData != null) {
      data['result'] = resultData!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class ResultData {
  String? id;
  String? name;
  String? image;
  String? description;
  String? status;
  String? dateTime;

  ResultData(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.status,
      this.dateTime});

  ResultData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
