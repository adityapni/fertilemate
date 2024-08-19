class CycleTrackingOptionModel {
  List<Result>? result;
  String? title;
  String? message;
  String? status;

  CycleTrackingOptionModel(
      {this.result, this.title, this.message, this.status});

  CycleTrackingOptionModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    title = json['title'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? subCategoryId;
  String? name;
  String? status;

  Result({this.id, this.subCategoryId, this.name, this.status});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    name = json['name'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sub_category_id'] = subCategoryId;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
