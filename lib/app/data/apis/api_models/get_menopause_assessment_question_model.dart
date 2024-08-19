class GetMenopauseAssessmentQuestionModel {
  List<GetMenopauseAssessmentQuestionData>? data;
  String? message;
  String? status;

  GetMenopauseAssessmentQuestionModel({this.data, this.message, this.status});

  GetMenopauseAssessmentQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetMenopauseAssessmentQuestionData>[];
      json['data'].forEach((v) {
        data!.add(GetMenopauseAssessmentQuestionData.fromJson(v));
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

class GetMenopauseAssessmentQuestionData {
  String? id;
  String? questionEn;
  String? questionMl;
  String? answer;
  String? status;
  String? dateTime;
  List<GetMenopauseAssessmentQuestionDataOption>? option;
  String? optionId;
  String? point;

  GetMenopauseAssessmentQuestionData({
    this.id,
    this.questionEn,
    this.questionMl,
    this.answer,
    this.status,
    this.dateTime,
    this.option,
    this.optionId,
    this.point,
  });

  GetMenopauseAssessmentQuestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionMl = json['question_ml'];
    answer = json['answer'];
    status = json['status'];
    dateTime = json['date_time'];
    optionId = json['option_id'];
    point = json['point'];
    if (json['option'] != null) {
      option = <GetMenopauseAssessmentQuestionDataOption>[];
      json['option'].forEach((v) {
        option!.add(GetMenopauseAssessmentQuestionDataOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question_en'] = questionEn;
    data['question_ml'] = questionMl;
    data['answer'] = answer;
    data['status'] = status;
    data['date_time'] = dateTime;
    if (option != null) {
      data['option'] = option!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetMenopauseAssessmentQuestionDataOption {
  String? id;
  String? questonId;
  String? option;
  String? status;

  GetMenopauseAssessmentQuestionDataOption(
      {this.id, this.questonId, this.option, this.status});

  GetMenopauseAssessmentQuestionDataOption.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questonId = json['queston_id'];
    option = json['option'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['queston_id'] = questonId;
    data['option'] = option;
    data['status'] = status;
    return data;
  }
}
