class SleepManagementGetSleepManagementSoundTracksByIdModel {
  List<Result>? result;
  String? message;
  String? status;

  SleepManagementGetSleepManagementSoundTracksByIdModel(
      {this.result, this.message, this.status});

  SleepManagementGetSleepManagementSoundTracksByIdModel.fromJson(
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
  String? smstId;
  String? smstName;
  String? smstImage;
  String? smstDescription;
  String? smstMp3;
  String? sleepManagementCategoriesId;
  String? smstTop;
  String? smstFeatured;
  String? smstRecommended;
  String? smstPopular;

  Result(
      {this.smstId,
      this.smstName,
      this.smstImage,
      this.smstDescription,
      this.smstMp3,
      this.sleepManagementCategoriesId,
      this.smstTop,
      this.smstFeatured,
      this.smstRecommended,
      this.smstPopular});

  Result.fromJson(Map<String, dynamic> json) {
    smstId = json['smst_id'];
    smstName = json['smst_name'];
    smstImage = json['smst_image'];
    smstDescription = json['smst_description'];
    smstMp3 = json['smst_mp3'];
    sleepManagementCategoriesId = json['sleep_management_categories_id'];
    smstTop = json['smst_top'];
    smstFeatured = json['smst_featured'];
    smstRecommended = json['smst_recommended'];
    smstPopular = json['smst_popular'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['smst_id'] = smstId;
    data['smst_name'] = smstName;
    data['smst_image'] = smstImage;
    data['smst_description'] = smstDescription;
    data['smst_mp3'] = smstMp3;
    data['sleep_management_categories_id'] = sleepManagementCategoriesId;
    data['smst_top'] = smstTop;
    data['smst_featured'] = smstFeatured;
    data['smst_recommended'] = smstRecommended;
    data['smst_popular'] = smstPopular;
    return data;
  }
}
