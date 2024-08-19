class GetPeaceSubCategoryModel {
  List<GetPeaceSubCategoryResult>? getPeaceSubCategoryResult;
  String? message;
  String? status;

  GetPeaceSubCategoryModel(
      {this.getPeaceSubCategoryResult, this.message, this.status});

  GetPeaceSubCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      getPeaceSubCategoryResult = <GetPeaceSubCategoryResult>[];
      json['result'].forEach((v) {
        getPeaceSubCategoryResult!.add(GetPeaceSubCategoryResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getPeaceSubCategoryResult != null) {
      data['result'] =
          getPeaceSubCategoryResult!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetPeaceSubCategoryResult {
  String? id;
  String? peaceCategoryId;
  String? name;
  String? status;
  String? dateTime;

  GetPeaceSubCategoryResult(
      {this.id, this.peaceCategoryId, this.name, this.status, this.dateTime});

  GetPeaceSubCategoryResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    peaceCategoryId = json['peace_category_id'];
    name = json['name'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['peace_category_id'] = peaceCategoryId;
    data['name'] = name;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
