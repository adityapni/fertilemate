class GetHomeBannerModel {
  List<Data>? data;
  String? message;
  String? status;

  GetHomeBannerModel({this.data, this.message, this.status});

  GetHomeBannerModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? name;
  String? bannerImage;
  String? status;

  Data({this.id, this.name, this.bannerImage, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bannerImage = json['banner_image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['banner_image'] = bannerImage;
    data['status'] = status;
    return data;
  }
}
