class GetUpcomingBookingAppointmentModel {
  List<AppointmentResult>? appointmentResult;
  String? message;
  String? status;

  GetUpcomingBookingAppointmentModel({this.appointmentResult, this.message, this.status});

  GetUpcomingBookingAppointmentModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      appointmentResult = <AppointmentResult>[];
      json['result'].forEach((v) {
        appointmentResult!.add(AppointmentResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appointmentResult != null) {
      data['result'] = appointmentResult!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class AppointmentResult {
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
  String? doctorName;
  String? doctorPost;
  String? doctorImage;
  String? clinicName;
  String? clinicAddress;

  AppointmentResult(
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
      this.doctorName,
      this.doctorPost,
      this.doctorImage,
      this.clinicName,
      this.clinicAddress});

  AppointmentResult.fromJson(Map<String, dynamic> json) {
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
    doctorName = json['doctor_name'];
    doctorPost = json['doctor_post'];
    doctorImage = json['doctor_image'];
    clinicName = json['clinic_name'];
    clinicAddress = json['clinic_address'];
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
    data['doctor_name'] = doctorName;
    data['doctor_post'] = doctorPost;
    data['doctor_image'] = doctorImage;
    data['clinic_name'] = clinicName;
    data['clinic_address'] = clinicAddress;
    return data;
  }
}
