class GuidesGetGuidBySubCategoryIdModel {
  List<Result>? result;
  String? message;
  String? status;

  GuidesGetGuidBySubCategoryIdModel({this.result, this.message, this.status});

  GuidesGetGuidBySubCategoryIdModel.fromJson(Map<String, dynamic> json) {
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
  String? guideId;
  String? guideQuestion;
  String? guideImage;
  String? guideAnswer;
  String? guideSubCategoryId;

  Result(
      {this.guideId,
      this.guideQuestion,
      this.guideImage,
      this.guideAnswer,
      this.guideSubCategoryId});

  Result.fromJson(Map<String, dynamic> json) {
    guideId = json['guide_id'];
    guideQuestion = json['guide_question'];
    guideImage = json['guide_image'];
    guideAnswer = json['guide_answer'];
    guideSubCategoryId = json['guide_sub_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['guide_id'] = guideId;
    data['guide_question'] = guideQuestion;
    data['guide_image'] = guideImage;
    data['guide_answer'] = guideAnswer;
    data['guide_sub_category_id'] = guideSubCategoryId;
    return data;
  }
}
