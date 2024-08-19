class DoctorsGetDoctorByIdModel {
  Doctor? doctor;
  String? message;
  String? status;

  DoctorsGetDoctorByIdModel({this.doctor, this.message, this.status});

  DoctorsGetDoctorByIdModel.fromJson(Map<String, dynamic> json) {
    doctor =
    json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Doctor {
  String? id;
  String? name;
  String? post;
  String? image;
  String? professionalProfile;
  String? consultFee;
  String? clinic;
  String? yearOfExperience;
  String? languages;
  String? education;

  Doctor(
      {this.id,
        this.name,
        this.post,
        this.image,
        this.professionalProfile,
        this.consultFee,
        this.clinic,
        this.yearOfExperience,
        this.languages,
        this.education});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    post = json['post'];
    image = json['image'];
    professionalProfile = json['professional_profile'];
    consultFee = json['consult_fee'];
    clinic = json['clinic'];
    yearOfExperience = json['year_of_experience'];
    languages = json['languages'];
    education = json['education'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['post'] = post;
    data['image'] = image;
    data['professional_profile'] = professionalProfile;
    data['consult_fee'] = consultFee;
    data['clinic'] = clinic;
    data['year_of_experience'] = yearOfExperience;
    data['languages'] = languages;
    data['education'] = education;
    return data;
  }
}
