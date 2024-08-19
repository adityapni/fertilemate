class GetRomanticSpotCategoryModel {
  List<ResultData>? resultData;
  String? message;
  String? status;

  GetRomanticSpotCategoryModel({this.resultData, this.message, this.status});

  GetRomanticSpotCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      resultData = <ResultData>[];
      json['result'].forEach((v) {
        resultData!.add(ResultData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resultData != null) {
      data['result'] = resultData!.map((v) => v.toJson()).toList();
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
  String? status;
  String? dateTime;

  ResultData({this.id, this.name, this.image, this.status, this.dateTime});

  ResultData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
