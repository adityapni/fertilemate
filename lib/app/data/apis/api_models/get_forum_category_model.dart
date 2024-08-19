class GetForumCategoryModel {
  List<Data1>? data1;
  List<Data2>? data2;
  String? message;
  String? status;

  GetForumCategoryModel({this.data1, this.data2, this.message, this.status});

  GetForumCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data1'] != null) {
      data1 = <Data1>[];
      json['data1'].forEach((v) {
        data1!.add(Data1.fromJson(v));
      });
    }
    if (json['data2'] != null) {
      data2 = <Data2>[];
      json['data2'].forEach((v) {
        data2!.add(Data2.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (data1 != null) {
      data['data1'] = data1!.map((v) => v.toJson()).toList();
    }
    if (data2 != null) {
      data['data2'] = data2!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data1 {
  String? id;
  String? type;
  String? title;
  String? description;
  String? image;
  String? status;

  Data1(
      {this.id,
      this.type,
      this.title,
      this.description,
      this.image,
      this.status});

  Data1.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}

class Data2 {
  String? id;
  String? type;
  String? title;
  String? description;
  String? image;
  String? status;

  Data2(
      {this.id,
      this.type,
      this.title,
      this.description,
      this.image,
      this.status});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}
