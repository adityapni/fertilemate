class GetIntimacySubCategoryModel {
  List<GetIntimacySubCategoryResult>? result;
  String? message;
  String? status;

  GetIntimacySubCategoryModel({this.result, this.message, this.status});

  GetIntimacySubCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetIntimacySubCategoryResult>[];
      json['result'].forEach((v) {
        result!.add(GetIntimacySubCategoryResult.fromJson(v));
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

class GetIntimacySubCategoryResult {
  String? id;
  String? intimacyCategoryId;
  String? name;
  String? image;
  String? status;
  String? dateTime;
  String? saved;
  String? description;

  GetIntimacySubCategoryResult({
    this.id,
    this.intimacyCategoryId,
    this.name,
    this.image,
    this.status,
    this.dateTime,
    this.saved,
    this.description,
  });

  GetIntimacySubCategoryResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    intimacyCategoryId = json['intimacy_category_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    dateTime = json['saved'];
    saved = json['saved'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['intimacy_category_id'] = intimacyCategoryId;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['saved'] = saved;
    data['description'] = description;
    return data;
  }
}
