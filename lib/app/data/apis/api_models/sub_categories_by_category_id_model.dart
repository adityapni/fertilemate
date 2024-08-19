/*class SubCategoriesByCategoryIdModel {
  List<Result>? result;
  String? banner;
  String? title;
  String? message;
  String? status;

  SubCategoriesByCategoryIdModel(
      {this.result, this.banner, this.title, this.message, this.status});

  SubCategoriesByCategoryIdModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    banner = json['banner'];
    title = json['title'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['banner'] = banner;
    data['title'] = title;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? categoryId;
  String? name;
  String? pageLink;
  String? image;
  String? description;
  String? status;
  String? screenType;
  String? subCategoryImage;

  Result(
      {this.id,
      this.categoryId,
      this.name,
      this.pageLink,
      this.image,
      this.description,
      this.status,
      this.screenType,
      this.subCategoryImage});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    pageLink = json['page_link'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    screenType = json['screen_type'];
    subCategoryImage = json['sub_category_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['page_link'] = pageLink;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['screen_type'] = screenType;
    data['sub_category_image'] = subCategoryImage;
    return data;
  }
}*/

class SubCategoriesByCategoryIdModel {
  List<Result>? result;
  String? banner;
  String? title;
  String? message;
  String? status;

  SubCategoriesByCategoryIdModel(
      {this.result, this.banner, this.title, this.message, this.status});

  SubCategoriesByCategoryIdModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(new Result.fromJson(v));
      });
    }
    banner = json['banner'];
    title = json['title'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['banner'] = banner;
    data['title'] = title;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? categoryId;
  String? name;
  String? pageLink;
  String? image;
  String? description;
  String? status;
  String? screenType;

  Result(
      {this.id,
      this.categoryId,
      this.name,
      this.pageLink,
      this.image,
      this.description,
      this.status,
      this.screenType});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    pageLink = json['page_link'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    screenType = json['screen_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['page_link'] = pageLink;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['screen_type'] = screenType;
    return data;
  }
}
