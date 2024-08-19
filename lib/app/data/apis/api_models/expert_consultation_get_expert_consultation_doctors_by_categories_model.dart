class ExpertConsultationGetExpertConsultationDoctorsByCategoriesModel {
  List<Result>? result;
  String? message;
  String? status;

  ExpertConsultationGetExpertConsultationDoctorsByCategoriesModel(
      {this.result, this.message, this.status});

  ExpertConsultationGetExpertConsultationDoctorsByCategoriesModel.fromJson(
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
  String? id;
  String? name;
  String? post;
  String? image;
  String? professionalProfile;
  String? consultFee;
  String? clinic;
  String? yearOfExperience;
  String? languages;
  String? education;
  String? createdAt;
  String? updatedAt;
  String? expertConsultation;

  Result(
      {this.id,
      this.name,
      this.post,
      this.image,
      this.professionalProfile,
      this.consultFee,
      this.clinic,
      this.yearOfExperience,
      this.languages,
      this.education,
      this.createdAt,
      this.updatedAt,
      this.expertConsultation});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    post = json['post'];
    image = json['image'];
    professionalProfile = json['professional_profile'];
    consultFee = json['consult_fee'];
    clinic = json['clinic'];
    yearOfExperience = json['year_of_experience'];
    languages = json['languages'];
    education = json['education'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    expertConsultation = json['expert_consultation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['post'] = post;
    data['image'] = image;
    data['professional_profile'] = professionalProfile;
    data['consult_fee'] = consultFee;
    data['clinic'] = clinic;
    data['year_of_experience'] = yearOfExperience;
    data['languages'] = languages;
    data['education'] = education;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['expert_consultation'] = expertConsultation;
    return data;
  }
}
