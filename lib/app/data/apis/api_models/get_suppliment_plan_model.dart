class GetSupplementPlanModel {
  List<GetSupplementPlanResult>? result;
  String? message;
  String? status;

  GetSupplementPlanModel({this.result, this.message, this.status});

  GetSupplementPlanModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetSupplementPlanResult>[];
      json['result'].forEach((v) {
        result!.add(GetSupplementPlanResult.fromJson(v));
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

class GetSupplementPlanResult {
  String? id;
  String? subCategoryId;
  String? name;
  String? amount;
  String? dateTime;
  String? image;
  String? title;
  String? subTitle;

  GetSupplementPlanResult(
      {this.id,
      this.subCategoryId,
      this.name,
      this.amount,
      this.dateTime,
      this.image,
      this.title,
      this.subTitle});

  GetSupplementPlanResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    name = json['name'];
    amount = json['amount'];
    dateTime = json['date_time'];
    image = json['image'];
    title = json['title'];
    subTitle = json['sub_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sub_category_id'] = subCategoryId;
    data['name'] = name;
    data['amount'] = amount;
    data['date_time'] = dateTime;
    data['image'] = image;
    data['title'] = title;
    data['sub_title'] = subTitle;
    return data;
  }
}
