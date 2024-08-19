class GetForumDiscussionModel {
  List<Result>? result;
  String? message;
  String? status;

  GetForumDiscussionModel({this.result, this.message, this.status});

  GetForumDiscussionModel.fromJson(Map<String, dynamic> json) {
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
  String? topicId;
  String? userId;
  String? title;
  String? description;
  String? status;
  String? dateTime;

  Result(
      {this.id,
      this.topicId,
      this.userId,
      this.title,
      this.description,
      this.status,
      this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    topicId = json['topic_id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['topic_id'] = topicId;
    data['user_id'] = userId;
    data['title'] = title;
    data['description'] = description;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
