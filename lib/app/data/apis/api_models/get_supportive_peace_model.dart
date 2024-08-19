class GetSupportivePeaceModel {
  List<Result>? result;
  String? message;
  String? status;

  GetSupportivePeaceModel({this.result, this.message, this.status});

  GetSupportivePeaceModel.fromJson(Map<String, dynamic> json) {
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
  String? peaceCategoryId;
  String? peaceSubCategoryId;
  String? title;
  String? image;
  String? description;
  String? status;
  String? dateTime;
  String? peaceCategoryName;
  String? peaceSubCategoryName;

  Result(
      {this.id,
      this.peaceCategoryId,
      this.peaceSubCategoryId,
      this.title,
      this.image,
      this.description,
      this.status,
      this.dateTime,
      this.peaceCategoryName,
      this.peaceSubCategoryName});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    peaceCategoryId = json['peace_category_id'];
    peaceSubCategoryId = json['peace_sub_category_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    dateTime = json['date_time'];
    peaceCategoryName = json['peace_category_name'];
    peaceSubCategoryName = json['peace_sub_category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['peace_category_id'] = peaceCategoryId;
    data['peace_sub_category_id'] = peaceSubCategoryId;
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['peace_category_name'] = peaceCategoryName;
    data['peace_sub_category_name'] = peaceSubCategoryName;
    return data;
  }
}
