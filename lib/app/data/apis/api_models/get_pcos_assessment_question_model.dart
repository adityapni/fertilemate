class GetPcosAssessmentQuestionModel {
  List<GetPcosAssessmentQuestionData>? data;
  String? message;
  String? status;

  GetPcosAssessmentQuestionModel({this.data, this.message, this.status});

  GetPcosAssessmentQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetPcosAssessmentQuestionData>[];
      json['data'].forEach((v) {
        data!.add(GetPcosAssessmentQuestionData.fromJson(v));
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

class GetPcosAssessmentQuestionData {
  String? id;
  String? questionEn;
  String? questionMl;
  String? answer;
  String? point;
  String? status;
  String? dateTime;
  List<GetPcosAssessmentQuestionOption>? option;
  String? optionId;
  String? optionName;
  String? answerLocal;

  GetPcosAssessmentQuestionData({
    this.id,
    this.questionEn,
    this.questionMl,
    this.answer,
    this.point,
    this.status,
    this.dateTime,
    this.option,
    this.optionId,
    this.optionName,
    this.answerLocal,
  });

  GetPcosAssessmentQuestionData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionMl = json['question_ml'];
    answer = json['answer'];
    point = json['point'];
    status = json['status'];
    dateTime = json['date_time'];
    optionId = json['option_id'];
    optionName = json['option_name'];
    answerLocal = json['answer_local'];
    if (json['option'] != null) {
      option = <GetPcosAssessmentQuestionOption>[];
      json['option'].forEach((v) {
        option!.add(GetPcosAssessmentQuestionOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question_en'] = questionEn;
    data['question_ml'] = questionMl;
    data['answer'] = answer;
    data['point'] = point;
    data['status'] = status;
    data['date_time'] = dateTime;
    if (option != null) {
      data['option'] = option!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetPcosAssessmentQuestionOption {
  String? id;
  String? questonId;
  String? option;
  String? status;

  GetPcosAssessmentQuestionOption(
      {this.id, this.questonId, this.option, this.status});

  GetPcosAssessmentQuestionOption.fromJson(Map<String, dynamic> json) {
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
