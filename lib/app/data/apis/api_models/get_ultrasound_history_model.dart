class UltrasoundImageHistoryModel {
  List<UltrasoundImageHistoryData>? doctor;
  String? message;
  String? status;

  UltrasoundImageHistoryModel({this.doctor, this.message, this.status});

  UltrasoundImageHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['doctor'] != null) {
      doctor = <UltrasoundImageHistoryData>[];
      json['doctor'].forEach((v) {
        doctor!.add(UltrasoundImageHistoryData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctor != null) {
      data['doctor'] = doctor!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class UltrasoundImageHistoryData {
  String? id;
  String? userId;
  String? image;
  String? remark;
  String? dateTime;
  String? currentdate;

  UltrasoundImageHistoryData(
      {this.id,
      this.userId,
      this.image,
      this.remark,
      this.dateTime,
      this.currentdate});

  UltrasoundImageHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    image = json['image'];
    remark = json['remark'];
    dateTime = json['date_time'];
    currentdate = json['currentdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['image'] = image;
    data['remark'] = remark;
    data['date_time'] = dateTime;
    data['currentdate'] = currentdate;
    return data;
  }
}
