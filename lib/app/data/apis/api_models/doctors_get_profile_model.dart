class DoctorsGetProfileModel {
  String? message;
  String? token;
  UserData? userData;
  String? status;
  String? userType;

  DoctorsGetProfileModel(
      {this.message, this.token, this.userData, this.status, this.userType});

  DoctorsGetProfileModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    token = json['token'];
    userType = json['user_type'];
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['token'] = token;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    data['status'] = status;
    data['user_type'] = userType;
    return data;
  }
}

class UserData {
  String? id;
  String? name;
  String? post;
  String? image;
  String? email;
  String? otp;
  String? password;
  String? createdAt;
  String? updatedAt;
  String? professionalProfile;
  String? consultFee;
  String? clinic;
  String? yearOfExperience;
  String? languages;
  String? education;
  String? expertConsultation;
  String? userName;
  String? companyName;
  String? mobile;
  String? gender;
  String? occupation;
  String? maritalStatus;
  String? dob;
  String? countryCode;
  String? lastName;
  String? identificationCardNo;
  String? uploadMedicalLicences;
  String? description;
  String? verifyStatus;

  UserData(
      {this.id,
      this.name,
      this.post,
      this.image,
      this.email,
      this.otp,
      this.password,
      this.createdAt,
      this.updatedAt,
      this.professionalProfile,
      this.consultFee,
      this.clinic,
      this.yearOfExperience,
      this.languages,
      this.education,
      this.expertConsultation,
      this.userName,
      this.companyName,
      this.mobile,
      this.gender,
      this.occupation,
      this.maritalStatus,
      this.dob,
      this.countryCode,
      this.lastName,
      this.identificationCardNo,
      this.uploadMedicalLicences,
      this.description,
      this.verifyStatus});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    post = json['post'];
    image = json['image'];
    email = json['email'];
    otp = json['otp'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    professionalProfile = json['professional_profile'];
    consultFee = json['consult_fee'];
    clinic = json['clinic'];
    yearOfExperience = json['year_of_experience'];
    languages = json['languages'];
    education = json['education'];
    expertConsultation = json['expert_consultation'];
    userName = json['user_name'];
    companyName = json['company_name'];
    mobile = json['mobile'];
    gender = json['gender'];
    maritalStatus = json['marital_status'];
    occupation = json['occupation'];
    dob = json['dob'];
    countryCode = json['country_code'];
    lastName = json['last_name'];
    identificationCardNo = json['identification_card_no'];
    uploadMedicalLicences = json['upload_medicale_licences'];
    description = json['description'];
    verifyStatus = json['verify_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['post'] = post;
    data['image'] = image;
    data['email'] = email;
    data['otp'] = otp;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['professional_profile'] = professionalProfile;
    data['consult_fee'] = consultFee;
    data['clinic'] = clinic;
    data['year_of_experience'] = yearOfExperience;
    data['languages'] = languages;
    data['education'] = education;
    data['expert_consultation'] = expertConsultation;
    data['user_name'] = userName;
    data['company_name'] = companyName;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['occupation'] = occupation;
    data['marital_status'] = maritalStatus;
    data['dob'] = dob;
    data['country_code'] = countryCode;
    data['last_name'] = lastName;
    data['identification_card_no'] = identificationCardNo;
    data['upload_medicale_licences'] = uploadMedicalLicences;
    data['description'] = description;
    data['verify_status'] = verifyStatus;
    return data;
  }
}
