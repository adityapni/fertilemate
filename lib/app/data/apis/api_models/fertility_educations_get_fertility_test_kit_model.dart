class FertilityEducationsGetFertilityTestKitModel {
  List<Data>? data;
  String? message;
  String? status;

  FertilityEducationsGetFertilityTestKitModel(
      {this.data, this.message, this.status});

  FertilityEducationsGetFertilityTestKitModel.fromJson(
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
  String? id;
  String? name;
  String? image;
  String? status;
  String? fecImage;

  Data({this.id, this.name, this.image, this.status, this.fecImage});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    fecImage = json['fec_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['fec_image'] = fecImage;
    return data;
  }
}
