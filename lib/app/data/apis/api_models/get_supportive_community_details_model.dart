class GetSupportiveCommunityDetailsModel {
  List<Result>? result;
  String? message;
  String? status;

  GetSupportiveCommunityDetailsModel({this.result, this.message, this.status});

  GetSupportiveCommunityDetailsModel.fromJson(Map<String, dynamic> json) {
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
  String? communityId;
  String? title;
  String? writer;
  String? description;
  String? image;
  String? status;
  String? dateTime;

  Result(
      {this.id,
      this.communityId,
      this.title,
      this.writer,
      this.description,
      this.image,
      this.status,
      this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    communityId = json['community_id'];
    title = json['title'];
    writer = json['writer'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['community_id'] = communityId;
    data['title'] = title;
    data['writer'] = writer;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
