class GetSupportiveCommunityModel {
  List<Result>? result;
  String? message;
  String? status;

  GetSupportiveCommunityModel({this.result, this.message, this.status});

  GetSupportiveCommunityModel.fromJson(Map<String, dynamic> json) {
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
  String? title;
  String? description;
  String? image;
  String? status;
  String? dateTime;

  Result(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.status,
      this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
