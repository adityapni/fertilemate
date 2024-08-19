class CategoriesByMainCategoryIdModel {
  List<Data>? data;
  String? message;
  MainCategory? mainCategory;
  String? title;
  String? status;

  CategoriesByMainCategoryIdModel(
      {this.data, this.message, this.mainCategory, this.title, this.status});

  CategoriesByMainCategoryIdModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    mainCategory = json['main_category'] != null
        ? MainCategory.fromJson(json['main_category'])
        : null;
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    if (mainCategory != null) {
      data['main_category'] = mainCategory!.toJson();
    }
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? categoryId;
  String? mainCategoryId;
  String? categoryName;
  String? categoryImage;
  String? description;
  String? type;

  Data(
      {this.categoryId,
      this.mainCategoryId,
      this.categoryName,
      this.categoryImage,
      this.description,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    mainCategoryId = json['main_category_id'];
    categoryName = json['category_name'];
    categoryImage = json['category_image'];
    description = json['description'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['main_category_id'] = mainCategoryId;
    data['category_name'] = categoryName;
    data['category_image'] = categoryImage;
    data['description'] = description;
    data['type'] = type;
    return data;
  }
}

class MainCategory {
  String? id;
  String? name;
  String? image;
  String? status;
  String? description;
  String? bannerImage;
  String? bannerVideo;

  MainCategory(
      {this.id,
      this.name,
      this.image,
      this.status,
      this.description,
      this.bannerImage,
      this.bannerVideo});

  MainCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    description = json['description'];
    bannerImage = json['banner_image'];
    bannerVideo = json['banner_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['description'] = description;
    data['banner_image'] = bannerImage;
    data['banner_video'] = bannerVideo;
    return data;
  }
}
