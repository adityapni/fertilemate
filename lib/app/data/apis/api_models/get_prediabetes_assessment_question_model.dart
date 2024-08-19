class GetPrediabetesAssessmentQuestionModel {
  List<GetPrediabetesAssessmentQuestionData>? data;
  String? message;
  String? status;

  GetPrediabetesAssessmentQuestionModel({this.data, this.message, this.status});

  GetPrediabetesAssessmentQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetPrediabetesAssessmentQuestionData>[];
      json['data'].forEach((v) {
        data!.add(GetPrediabetesAssessmentQuestionData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }
}

class GetPrediabetesAssessmentQuestionData {
  String? id;
  String? questionEn;
  String? questionMl;
  String? answer;
  String? status;
  String? dateTime;
  List<GetPrediabetesAssessmentQuestionDataOption>? option;
  String? optionId;
  String? point;

  GetPrediabetesAssessmentQuestionData({
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

  GetPrediabetesAssessmentQuestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionMl = json['question_ml'];
    answer = json['answer'];
    status = json['status'];
    dateTime = json['date_time'];
    optionId = json['option_id'];
    point = json['point'];
    if (json['option'] != null) {
      option = <GetPrediabetesAssessmentQuestionDataOption>[];
      json['option'].forEach((v) {
        option!.add(GetPrediabetesAssessmentQuestionDataOption.fromJson(v));
      });
    }
  }
}

class GetPrediabetesAssessmentQuestionDataOption {
  String? id;
  String? questonId;
  String? option;
  String? status;

  GetPrediabetesAssessmentQuestionDataOption(
      {this.id, this.questonId, this.option, this.status});

  GetPrediabetesAssessmentQuestionDataOption.fromJson(
      Map<String, dynamic> json) {
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
