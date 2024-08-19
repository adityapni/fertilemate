class DoctorsModel {
  List<Doctor>? doctor;
  String? message;
  String? status;

  DoctorsModel({this.doctor, this.message, this.status});

  DoctorsModel.fromJson(Map<String, dynamic> json) {
    if (json['doctor'] != null) {
      doctor = <Doctor>[];
      json['doctor'].forEach((v) {
        doctor!.add(new Doctor.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}

class Doctor {
  String? doctorId;
  String? doctorName;
  String? doctorPost;
  String? doctorEmail;
  String? doctorMobile;
  String? image;

  Doctor(
      {
        this.doctorId,
        this.doctorName,
        this.doctorPost,
        this.doctorEmail,
        this.doctorMobile,
        this.image});

  Doctor.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    doctorPost = json['doctor_post'];
    doctorEmail = json['doctor_email'];
    doctorMobile = json['doctor_mobile'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['doctor_name'] = this.doctorName;
    data['doctor_post'] = this.doctorPost;
    data['doctor_email'] = this.doctorEmail;
    data['doctor_mobile'] = this.doctorMobile;
    data['image'] = this.image;
    return data;
  }
}

