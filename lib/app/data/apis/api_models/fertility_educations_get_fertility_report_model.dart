class FertilityEducationsGetFertilityReportModel {
  Data? data;
  String? message;
  String? status;

  FertilityEducationsGetFertilityReportModel(
      {this.data, this.message, this.status});

  FertilityEducationsGetFertilityReportModel.fromJson(
      Map<String, dynamic> json) {
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
  String? id;
  String? fertilityKitId;
  String? userId;
  String? image;
  String? result;
  String? status;
  String? dateTime;
  String? fsh;
  String? thyroid;
  String? spermConcentration;

  Data(
      {this.id,
      this.fertilityKitId,
      this.userId,
      this.image,
      this.result,
      this.status,
      this.dateTime,
      this.fsh,
      this.thyroid,
      this.spermConcentration});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fertilityKitId = json['fertility_kit_id'];
    userId = json['user_id'];
    image = json['image'];
    result = json['result'];
    status = json['status'];
    dateTime = json['date_time'];
    fsh = json['fsh'];
    thyroid = json['thyroid'];
    spermConcentration = json['sperm_concentration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fertility_kit_id'] = fertilityKitId;
    data['user_id'] = userId;
    data['image'] = image;
    data['result'] = result;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['fsh'] = fsh;
    data['thyroid'] = thyroid;
    data['sperm_concentration'] = spermConcentration;
    return data;
  }
}
