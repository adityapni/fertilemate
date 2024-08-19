class GetForumTopicModel {
  List<Doctor>? doctor;
  String? message;
  String? status;

  GetForumTopicModel({this.doctor, this.message, this.status});

  GetForumTopicModel.fromJson(Map<String, dynamic> json) {
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
  String? status;
  String? dateTime;

  Doctor({this.id, this.name, this.status, this.dateTime});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
