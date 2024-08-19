class GetPeaceCategoryModel {
  List<Result>? result;
  String? message;
  String? status;

  GetPeaceCategoryModel({this.result, this.message, this.status});

  GetPeaceCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? name;
  String? status;
  String? dateTime;

  Result({this.id, this.name, this.status, this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
