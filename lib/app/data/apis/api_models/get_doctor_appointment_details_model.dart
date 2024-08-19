class GetDoctorAppointmentDetailsModel {
  GetDoctorAppointmentDetailsResult? getDoctorAppointmentDetailsResult;
  String? message;
  String? status;

  GetDoctorAppointmentDetailsModel({this.getDoctorAppointmentDetailsResult, this.message, this.status});

  GetDoctorAppointmentDetailsModel.fromJson(Map<String, dynamic> json) {
    getDoctorAppointmentDetailsResult = json['result'] != null ? GetDoctorAppointmentDetailsResult.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getDoctorAppointmentDetailsResult != null) {
      data['result'] = getDoctorAppointmentDetailsResult!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetDoctorAppointmentDetailsResult {
  String? id;
  String? userId;
  String? clinicId;
  String? testId;
  String? doctorId;
  String? bookingType;
  String? date;
  String? time;
  String? consultantFee;
  String? specialInstruction;
  String? status;
  String? datetime;
  String? userName;
  String? userMobile;
  String? email;
  String? gender;
  String? dob;
  String? userImage;

  GetDoctorAppointmentDetailsResult(
      {this.id,
      this.userId,
      this.clinicId,
      this.testId,
      this.doctorId,
      this.bookingType,
      this.date,
      this.time,
      this.consultantFee,
      this.specialInstruction,
      this.status,
      this.datetime,
      this.userName,
      this.userMobile,
      this.email,
      this.gender,
      this.dob,
      this.userImage});

  GetDoctorAppointmentDetailsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clinicId = json['clinic_id'];
    testId = json['test_id'];
    doctorId = json['doctor_id'];
    bookingType = json['booking_type'];
    date = json['date'];
    time = json['time'];
    consultantFee = json['consultant_fee'];
    specialInstruction = json['special_instruction'];
    status = json['status'];
    datetime = json['datetime'];
    userName = json['user_name'];
    userMobile = json['user_mobile'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['clinic_id'] = clinicId;
    data['test_id'] = testId;
    data['doctor_id'] = doctorId;
    data['booking_type'] = bookingType;
    data['date'] = date;
    data['time'] = time;
    data['consultant_fee'] = consultantFee;
    data['special_instruction'] = specialInstruction;
    data['status'] = status;
    data['datetime'] = datetime;
    data['user_name'] = userName;
    data['user_mobile'] = userMobile;
    data['email'] = email;
    data['gender'] = gender;
    data['dob'] = dob;
    data['user_image'] = userImage;
    return data;
  }
}
