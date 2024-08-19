class GetDoctorUpcomingAppointmentModel {
  List<Result>? result;
  String? message;
  String? status;

  GetDoctorUpcomingAppointmentModel({this.result, this.message, this.status});

  GetDoctorUpcomingAppointmentModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
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
  String? userImage;

  Result(
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
        this.userImage});

  Result.fromJson(Map<String, dynamic> json) {
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
    data['user_image'] = userImage;
    return data;
  }
}
