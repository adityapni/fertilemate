class QuestionsModel {
  List<Questions>? questions;
  String? message;
  String? status;

  QuestionsModel({this.questions, this.message, this.status});

  QuestionsModel.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Questions {
  String? questionId;
  String? questionQuestion;
  String? questionType;
  String? questionStatus;
  String? questionSubCategoryId;
  List<Options>? options;

  Questions(
      {this.questionId,
      this.questionQuestion,
      this.questionType,
      this.questionStatus,
      this.questionSubCategoryId,
      this.options});

  Questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    questionQuestion = json['question_question'];
    questionType = json['question_type'];
    questionStatus = json['question_status'];
    questionSubCategoryId = json['question_sub_category_id'];
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((v) {
        options!.add(Options.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['question_id'] = questionId;
    data['question_question'] = questionQuestion;
    data['question_type'] = questionType;
    data['question_status'] = questionStatus;
    data['question_sub_category_id'] = questionSubCategoryId;
    if (options != null) {
      data['options'] = options!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Options {
  String? qOptionId;
  String? qOptionQuestionId;
  String? qOptionName;
  String? qOptionValue;

  Options(
      {this.qOptionId,
      this.qOptionQuestionId,
      this.qOptionName,
      this.qOptionValue});

  Options.fromJson(Map<String, dynamic> json) {
    qOptionId = json['q_option_id'];
    qOptionQuestionId = json['q_option_question_id'];
    qOptionName = json['q_option_name'];
    qOptionValue = json['q_option_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['q_option_id'] = qOptionId;
    data['q_option_question_id'] = qOptionQuestionId;
    data['q_option_name'] = qOptionName;
    data['q_option_value'] = qOptionValue;
    return data;
  }
}
