class GetFindCoachCategoryModel {
  List<GetFindCoachCategoryResult>? getFindCoachCategoryResult;
  String? message;
  String? status;

  GetFindCoachCategoryModel({this.getFindCoachCategoryResult, this.message, this.status});

  GetFindCoachCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      getFindCoachCategoryResult = <GetFindCoachCategoryResult>[];
      json['result'].forEach((v) {
        getFindCoachCategoryResult!.add(GetFindCoachCategoryResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getFindCoachCategoryResult != null) {
      data['result'] = getFindCoachCategoryResult!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetFindCoachCategoryResult {
  String? id;
  String? name;
  String? image;
  String? status;
  String? dateTime;

  GetFindCoachCategoryResult({this.id, this.name, this.image, this.status, this.dateTime});

  GetFindCoachCategoryResult.fromJson(Map<String, dynamic> json) {
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
