class PersonalTrainerGetPersonalTrainerCategoryModel {
  List<Data>? data;
  String? message;
  String? status;

  PersonalTrainerGetPersonalTrainerCategoryModel(
      {this.data, this.message, this.status});

  PersonalTrainerGetPersonalTrainerCategoryModel.fromJson(
      Map<String, dynamic> json) {
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
  String? ptcId;
  String? expertConsultationCategoriesId;
  String? trainerCateTypeId;
  String? trainerTypeId;
  String? ptcName;
  String? ptcImage;

  Data(
      {this.ptcId,
      this.expertConsultationCategoriesId,
      this.trainerCateTypeId,
      this.trainerTypeId,
      this.ptcName,
      this.ptcImage});

  Data.fromJson(Map<String, dynamic> json) {
    ptcId = json['ptc_id'];
    expertConsultationCategoriesId = json['expert_consultation_categories_id'];
    trainerCateTypeId = json['trainer_cate_type_id'];
    trainerTypeId = json['trainer_type_id'];
    ptcName = json['ptc_name'];
    ptcImage = json['ptc_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ptc_id'] = ptcId;
    data['expert_consultation_categories_id'] = expertConsultationCategoriesId;
    data['trainer_cate_type_id'] = trainerCateTypeId;
    data['trainer_type_id'] = trainerTypeId;
    data['ptc_name'] = ptcName;
    data['ptc_image'] = ptcImage;
    return data;
  }
}
