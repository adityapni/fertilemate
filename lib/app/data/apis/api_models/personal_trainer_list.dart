class PersonalTrainerGetPersonalTrainerModel {
  List<PersonalTrainerData>? personalTrainerData;
  String? message;
  String? status;

  PersonalTrainerGetPersonalTrainerModel(
      {this.personalTrainerData, this.message, this.status});

  PersonalTrainerGetPersonalTrainerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      personalTrainerData = <PersonalTrainerData>[];
      json['data'].forEach((v) {
        personalTrainerData!.add(PersonalTrainerData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (personalTrainerData != null) {
      data['data'] = personalTrainerData!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class PersonalTrainerData {
  String? id;
  String? name;
  String? image;
  String? description;
  String? consultFee;
  String? personalTrainerAddress1;
  String? personalTrainerAddress2;
  String? personalTrainerCity;
  String? personalTrainerState;
  String? personalTrainerCountry;
  String? personalTrainerLatitude;
  String? personalTrainerLongitude;
  String? personalTrainerPincode;
  String? personalTrainerPhone;
  String? userName;
  String? companyName;
  String? mobile;
  String? gender;
  String? dob;
  String? email;
  String? personalTrainerOtp;
  String? password;
  String? personalTrainerCreatedAt;
  String? personalTrainerUpdatedAt;
  String? countryCode;
  String? testimonials;
  String? clients;
  String? verifyStatus;
  String? personalTrainerImage;

  PersonalTrainerData(
      {this.id,
        this.name,
        this.image,
        this.description,
        this.consultFee,
        this.personalTrainerAddress1,
        this.personalTrainerAddress2,
        this.personalTrainerCity,
        this.personalTrainerState,
        this.personalTrainerCountry,
        this.personalTrainerLatitude,
        this.personalTrainerLongitude,
        this.personalTrainerPincode,
        this.personalTrainerPhone,
        this.userName,
        this.companyName,
        this.mobile,
        this.gender,
        this.dob,
        this.email,
        this.personalTrainerOtp,
        this.password,
        this.personalTrainerCreatedAt,
        this.personalTrainerUpdatedAt,
        this.countryCode,
        this.testimonials,
        this.clients,
        this.verifyStatus,
        this.personalTrainerImage});

  PersonalTrainerData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    consultFee = json['consult_fee'];
    personalTrainerAddress1 = json['personal_trainer_address_1'];
    personalTrainerAddress2 = json['personal_trainer_address_2'];
    personalTrainerCity = json['personal_trainer_city'];
    personalTrainerState = json['personal_trainer_state'];
    personalTrainerCountry = json['personal_trainer_country'];
    personalTrainerLatitude = json['personal_trainer_latitude'];
    personalTrainerLongitude = json['personal_trainer_longitude'];
    personalTrainerPincode = json['personal_trainer_pincode'];
    personalTrainerPhone = json['personal_trainer_phone'];
    userName = json['user_name'];
    companyName = json['company_name'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    email = json['email'];
    personalTrainerOtp = json['personal_trainer_otp'];
    password = json['password'];
    personalTrainerCreatedAt = json['personal_trainer_created_at'];
    personalTrainerUpdatedAt = json['personal_trainer_updated_at'];
    countryCode = json['country_code'];
    testimonials = json['testimonials'];
    clients = json['clients'];
    verifyStatus = json['verify_status'];
    personalTrainerImage = json['personal_trainer_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['consult_fee'] = consultFee;
    data['personal_trainer_address_1'] = personalTrainerAddress1;
    data['personal_trainer_address_2'] = personalTrainerAddress2;
    data['personal_trainer_city'] = personalTrainerCity;
    data['personal_trainer_state'] = personalTrainerState;
    data['personal_trainer_country'] = personalTrainerCountry;
    data['personal_trainer_latitude'] = personalTrainerLatitude;
    data['personal_trainer_longitude'] = personalTrainerLongitude;
    data['personal_trainer_pincode'] = personalTrainerPincode;
    data['personal_trainer_phone'] = personalTrainerPhone;
    data['user_name'] = userName;
    data['company_name'] = companyName;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['dob'] = dob;
    data['email'] = email;
    data['personal_trainer_otp'] = personalTrainerOtp;
    data['password'] = password;
    data['personal_trainer_created_at'] = personalTrainerCreatedAt;
    data['personal_trainer_updated_at'] = personalTrainerUpdatedAt;
    data['country_code'] = countryCode;
    data['testimonials'] = testimonials;
    data['clients'] = clients;
    data['verify_status'] = verifyStatus;
    data['personal_trainer_image'] = personalTrainerImage;
    return data;
  }
}
