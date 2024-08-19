class ExpertConsultationGetExpertConsultationCategoriesModel {
  List<Result>? result;
  String? message;
  String? status;

  ExpertConsultationGetExpertConsultationCategoriesModel(
      {this.result, this.message, this.status});

  ExpertConsultationGetExpertConsultationCategoriesModel.fromJson(
      Map<String, dynamic> json) {
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
  String? expertConsultationCategoriesId;
  String? expertConsultationCategoriesName;

  Result(
      {this.expertConsultationCategoriesId,
        this.expertConsultationCategoriesName});

  Result.fromJson(Map<String, dynamic> json) {
    expertConsultationCategoriesId = json['expert_consultation_categories_id'];
    expertConsultationCategoriesName =
    json['expert_consultation_categories_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['expert_consultation_categories_id'] =
        expertConsultationCategoriesId;
    data['expert_consultation_categories_name'] =
        expertConsultationCategoriesName;
    return data;
  }
}
