class GetSingleVideoModel {
  Data? data;
  List<Result>? result;
  String? message;
  String? status;

  GetSingleVideoModel({this.data, this.result, this.message, this.status});

  GetSingleVideoModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? id;
  String? filterId;
  String? type;
  String? name;
  String? image;
  String? video;
  String? status;

  Data(
      {this.id,
      this.filterId,
      this.type,
      this.name,
      this.image,
      this.video,
      this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filterId = json['filter_id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    video = json['video'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filter_id'] = filterId;
    data['type'] = type;
    data['name'] = name;
    data['image'] = image;
    data['video'] = video;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? filterId;
  String? type;
  String? name;
  String? image;
  String? video;
  String? status;

  Result(
      {this.id,
      this.filterId,
      this.type,
      this.name,
      this.image,
      this.video,
      this.status});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filterId = json['filter_id'];
    type = json['type'];
    name = json['name'];
    image = json['image'];
    video = json['video'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filter_id'] = filterId;
    data['type'] = type;
    data['name'] = name;
    data['image'] = image;
    data['video'] = video;
    data['status'] = status;
    return data;
  }
}
