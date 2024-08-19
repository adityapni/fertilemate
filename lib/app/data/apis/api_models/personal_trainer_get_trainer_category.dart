class PersonalTrainerGetTrainerCategoryModel {
  List<TrainerCategoryData>? trainerCategoryData;
  String? message;
  String? status;

  PersonalTrainerGetTrainerCategoryModel(
      {this.trainerCategoryData, this.message, this.status});

  PersonalTrainerGetTrainerCategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      trainerCategoryData = <TrainerCategoryData>[];
      json['data'].forEach((v) {
        trainerCategoryData!.add(TrainerCategoryData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trainerCategoryData != null) {
      data['data'] = trainerCategoryData!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class TrainerCategoryData {
  String? id;
  String? ptcName;
  String? ptcImage;

  TrainerCategoryData({this.id, this.ptcName, this.ptcImage});

  TrainerCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ptcName = json['ptc_name'];
    ptcImage = json['ptc_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ptc_name'] = ptcName;
    data['ptc_image'] = ptcImage;
    return data;
  }
}
