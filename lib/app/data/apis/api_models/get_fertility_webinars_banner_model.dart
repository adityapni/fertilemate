class GetFertilityWebinarsBannerModel {
  BannerResult? bannerResult;
  String? message;
  String? status;

  GetFertilityWebinarsBannerModel({this.bannerResult, this.message, this.status});

  GetFertilityWebinarsBannerModel.fromJson(Map<String, dynamic> json) {
    bannerResult = json['result'] != null ? BannerResult.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bannerResult != null) {
      data['result'] = bannerResult!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class BannerResult {
  String? id;
  String? name;
  String? image;
  String? description;
  String? status;
  String? dateTime;

  BannerResult(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.status,
      this.dateTime});

  BannerResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
