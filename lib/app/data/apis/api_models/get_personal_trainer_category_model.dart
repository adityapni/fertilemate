/*
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
  String? ptcName;
  String? ptcImage;

  Data({this.ptcId, this.ptcName, this.ptcImage});

  Data.fromJson(Map<String, dynamic> json) {
    ptcId = json['ptc_id'];
    ptcName = json['ptc_name'];
    ptcImage = json['ptc_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ptc_id'] = ptcId;
    data['ptc_name'] = ptcName;
    data['ptc_image'] = ptcImage;
    return data;
  }
}
*/
