class GetFertilityEducationBannerModel {
  Result? result;
  String? message;
  String? status;

  GetFertilityEducationBannerModel({this.result, this.message, this.status});

  GetFertilityEducationBannerModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? image;
  String? description;
  String? status;
  String? dateTime;

  Result({this.id, this.image, this.description, this.status, this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
