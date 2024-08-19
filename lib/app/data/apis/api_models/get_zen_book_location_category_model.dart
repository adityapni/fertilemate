class ZenBookLocationCategoryGetZenBookLocationCategoryModel {
  List<ResultZenBookLocationCategory>? resultZenBookLocationCategory;
  String? message;
  String? status;

  ZenBookLocationCategoryGetZenBookLocationCategoryModel({this.resultZenBookLocationCategory, this.message, this.status});

  ZenBookLocationCategoryGetZenBookLocationCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      resultZenBookLocationCategory = <ResultZenBookLocationCategory>[];
      json['result'].forEach((v) {
        resultZenBookLocationCategory!.add(ResultZenBookLocationCategory.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resultZenBookLocationCategory != null) {
      data['result'] = resultZenBookLocationCategory!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class ResultZenBookLocationCategory {
  String? id;
  String? name;
  String? image;
  String? status;
  String? dateTime;

  ResultZenBookLocationCategory({this.id, this.name, this.image, this.status, this.dateTime});

  ResultZenBookLocationCategory.fromJson(Map<String, dynamic> json) {
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
