class TvsScanGetTrainerTypeListModel {
  List<Doctor>? doctor;
  String? message;
  String? status;

  TvsScanGetTrainerTypeListModel({this.doctor, this.message, this.status});

  TvsScanGetTrainerTypeListModel.fromJson(Map<String, dynamic> json) {
    if (json['doctor'] != null) {
      doctor = <Doctor>[];
      json['doctor'].forEach((v) {
        doctor!.add(Doctor.fromJson(v));
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

class Doctor {
  String? id;
  String? name;

  Doctor({this.id, this.name});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
