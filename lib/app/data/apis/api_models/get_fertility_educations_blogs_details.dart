class GetFertilityEducationsBlogsDetailsModel {
  Data? data;
  String? message;
  String? status;

  GetFertilityEducationsBlogsDetailsModel(
      {this.data, this.message, this.status});

  GetFertilityEducationsBlogsDetailsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? febId;
  String? febTitle;
  String? febImage;
  String? febDescription;
  String? febShorDescription;
  String? febVideo;
  String? febAverageRating;
  String? febReadingTime;
  String? febType;
  String? febDoctorsId;
  String? febTrainersId;
  String? febTelehealthsId;
  String? febLabsId;
  String? febFecCategoryId;
  String? febPdf;
  String? febPerson;
  bool? saveStatus;

  Data({
    this.febId,
    this.febTitle,
    this.febImage,
    this.febDescription,
    this.febShorDescription,
    this.febVideo,
    this.febAverageRating,
    this.febReadingTime,
    this.febType,
    this.febDoctorsId,
    this.febTrainersId,
    this.febTelehealthsId,
    this.febLabsId,
    this.febFecCategoryId,
    this.febPdf,
    this.febPerson,
    this.saveStatus,
  });

  Data.fromJson(Map<String, dynamic> json) {
    febId = json['feb_id'];
    febTitle = json['feb_title'];
    febImage = json['feb_image'];
    febDescription = json['feb_description'];
    febShorDescription = json['feb_short_description'];
    febVideo = json['feb_video'];
    febAverageRating = json['feb_average_rating'];
    febReadingTime = json['feb_reading_time'];
    febType = json['feb_type'];
    febDoctorsId = json['feb_doctors_id'];
    febTrainersId = json['feb_trainers_id'];
    febTelehealthsId = json['feb_telehealths_id'];
    febLabsId = json['feb_labs_id'];
    febFecCategoryId = json['feb_fec_category_id'];
    febPdf = json['feb_pdf'];
    febPerson = json['feb_person'];
    saveStatus = json['save_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['feb_id'] = febId;
    data['feb_title'] = febTitle;
    data['feb_image'] = febImage;
    data['feb_description'] = febDescription;
    data['feb_short_description'] = febShorDescription;
    data['feb_video'] = febVideo;
    data['feb_average_rating'] = febAverageRating;
    data['feb_reading_time'] = febReadingTime;
    data['feb_type'] = febType;
    data['feb_doctors_id'] = febDoctorsId;
    data['feb_trainers_id'] = febTrainersId;
    data['feb_telehealths_id'] = febTelehealthsId;
    data['feb_labs_id'] = febLabsId;
    data['feb_fec_category_id'] = febFecCategoryId;
    data['feb_pdf'] = febPdf;
    data['feb_person'] = febPerson;
    return data;
  }
}
