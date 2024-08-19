class GetMaleFertilityQuizModel {
  List<GetMaleFertilityQuizData>? data;
  String? message;
  String? status;

  GetMaleFertilityQuizModel({this.data, this.message, this.status});

  GetMaleFertilityQuizModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetMaleFertilityQuizData>[];
      json['data'].forEach((v) {
        data!.add(GetMaleFertilityQuizData.fromJson(v));
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

class GetMaleFertilityQuizData {
  String? id;
  String? questionEn;
  String? questionMl;
  String? answer;
  String? status;
  String? dateTime;
  List<GetMaleFertilityQuizDataOption>? option;
  String? optionId;
  String? point;

  GetMaleFertilityQuizData({
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

  GetMaleFertilityQuizData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionEn = json['question_en'];
    questionMl = json['question_ml'];
    answer = json['answer'];
    status = json['status'];
    dateTime = json['date_time'];
    optionId = json['optionId'];
    point = json['point'];
    if (json['option'] != null) {
      option = <GetMaleFertilityQuizDataOption>[];
      json['option'].forEach((v) {
        option!.add(GetMaleFertilityQuizDataOption.fromJson(v));
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
    data['optionId'] = optionId;
    data['point'] = point;
    if (option != null) {
      data['option'] = option!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetMaleFertilityQuizDataOption {
  String? id;
  String? questonId;
  String? option;
  String? status;

  GetMaleFertilityQuizDataOption(
      {this.id, this.questonId, this.option, this.status});

  GetMaleFertilityQuizDataOption.fromJson(Map<String, dynamic> json) {
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
