class GetLatestQuestionModel {
  List<Data>? data;
  String? message;
  String? status;

  GetLatestQuestionModel({this.data, this.message, this.status});

  GetLatestQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? forumTopicId;
  String? question;
  String? count;
  String? dateTime;
  String? userName;

  Data(
      {this.id,
      this.userId,
      this.forumTopicId,
      this.question,
      this.count,
      this.dateTime,
      this.userName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    forumTopicId = json['forum_topic_id'];
    question = json['question'];
    count = json['count'];
    dateTime = json['date_time'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['forum_topic_id'] = forumTopicId;
    data['question'] = question;
    data['count'] = count;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    return data;
  }
}
