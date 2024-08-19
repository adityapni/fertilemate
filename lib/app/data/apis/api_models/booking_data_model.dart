class BookingDataModel {
  Data? data;
  String? message;
  String? status;

  BookingDataModel({this.data, this.message, this.status});

  BookingDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? clinicId;
  String? testId;
  String? doctorId;
  String? trainerId;
  String? bookingType;
  String? date;
  String? time;
  String? consultantFee;
  String? specialInstruction;
  String? status;
  String? paymentStatus;
  String? bookingStatus;
  String? datetime;

  Data(
      {this.id,
        this.userId,
        this.clinicId,
        this.testId,
        this.doctorId,
        this.trainerId,
        this.bookingType,
        this.date,
        this.time,
        this.consultantFee,
        this.specialInstruction,
        this.status,
        this.paymentStatus,
        this.bookingStatus,
        this.datetime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clinicId = json['clinic_id'];
    testId = json['test_id'];
    doctorId = json['doctor_id'];
    trainerId = json['trainer_id'];
    bookingType = json['booking_type'];
    date = json['date'];
    time = json['time'];
    consultantFee = json['consultant_fee'];
    specialInstruction = json['special_instruction'];
    status = json['status'];
    paymentStatus = json['payment_status'];
    bookingStatus = json['booking_status'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['clinic_id'] = clinicId;
    data['test_id'] = testId;
    data['doctor_id'] = doctorId;
    data['trainer_id'] = trainerId;
    data['booking_type'] = bookingType;
    data['date'] = date;
    data['time'] = time;
    data['consultant_fee'] = consultantFee;
    data['special_instruction'] = specialInstruction;
    data['status'] = status;
    data['payment_status'] = paymentStatus;
    data['booking_status'] = bookingStatus;
    data['datetime'] = datetime;
    return data;
  }
}
