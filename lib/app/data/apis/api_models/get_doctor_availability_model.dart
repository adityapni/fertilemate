class DoctorAvailabilityModel {
  List<DoctorAvailabilityData>? data;
  String? message;
  String? status;

  DoctorAvailabilityModel({this.data, this.message, this.status});

  DoctorAvailabilityModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DoctorAvailabilityData>[];
      json['data'].forEach((v) {
        data!.add(DoctorAvailabilityData.fromJson(v));
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

class DoctorAvailabilityData {
  String? id;
  String? day;
  String? time;
  String? other;

  DoctorAvailabilityData({this.id, this.day, this.time, this.other});

  DoctorAvailabilityData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    day = json['day'];
    time = json['time'];
    other = json['other'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['day'] = day;
    data['time'] = time;
    data['other'] = other;
    return data;
  }
}
