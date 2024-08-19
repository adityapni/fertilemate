class GetForumQuestionAnswerModel {
  List<Data>? data;
  String? question;
  String? userName;
  String? message;
  String? status;

  GetForumQuestionAnswerModel(
      {this.data, this.question, this.userName, this.message, this.status});

  GetForumQuestionAnswerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    question = json['question'];
    userName = json['user_name'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['question'] = question;
    data['user_name'] = userName;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? id;
  String? forumTopicQuestionId;
  String? userId;
  String? answer;
  String? dateTime;
  String? userName;

  Data(
      {this.id,
      this.forumTopicQuestionId,
      this.userId,
      this.answer,
      this.dateTime,
      this.userName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    forumTopicQuestionId = json['forum_topic_question_id'];
    userId = json['user_id'];
    answer = json['answer'];
    dateTime = json['date_time'];
    userName = json['user_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['forum_topic_question_id'] = forumTopicQuestionId;
    data['user_id'] = userId;
    data['answer'] = answer;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    return data;
  }
}
