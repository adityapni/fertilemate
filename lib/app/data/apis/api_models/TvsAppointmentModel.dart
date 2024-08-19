/// result : [{"id":"2","user_id":"1","clinic_id":"1","test_id":"0","doctor_id":"1","booking_type":"tvs_scan","date":"2023-12-13","time":"05:05:05","consultant_fee":"500","special_instruction":"instruction","status":"1","datetime":"2023-12-18 12:17:44"},{"id":"3","user_id":"1","clinic_id":"1","test_id":"0","doctor_id":"0","booking_type":"tvs_scan","date":"2023-12-19","time":"17:36:00","consultant_fee":"850","special_instruction":"","status":"1","datetime":"2023-12-18 15:37:56"},{"id":"4","user_id":"1","clinic_id":"1","test_id":"0","doctor_id":"0","booking_type":"tvs_scan","date":"2023-12-19","time":"17:36:00","consultant_fee":"850","special_instruction":"","status":"1","datetime":"2023-12-18 15:40:01"},{"id":"5","user_id":"1","clinic_id":"1","test_id":"0","doctor_id":"0","booking_type":"tvs_scan","date":"2023-12-20","time":"19:42:00","consultant_fee":"850","special_instruction":"","status":"1","datetime":"2023-12-18 15:42:37"}]
/// message : "Booking List Successfully"
/// status : "1"

class AppointmentModel {
  AppointmentModel({
      List<AppointmentList>? result,
      String? message, 
      String? status,}){
    _result = result;
    _message = message;
    _status = status;
}

  AppointmentModel.fromJson(dynamic json) {
    if (json['result'] != null) {
      _result = [];
      json['result'].forEach((v) {
        _result?.add(AppointmentList.fromJson(v));
      });
    }
    _message = json['message'];
    _status = json['status'];
  }
  List<AppointmentList>? _result;
  String? _message;
  String? _status;
AppointmentModel copyWith({  List<AppointmentList>? result,
  String? message,
  String? status,
}) => AppointmentModel(  result: result ?? _result,
  message: message ?? _message,
  status: status ?? _status,
);
  List<AppointmentList>? get result => _result;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_result != null) {
      map['result'] = _result?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}

/// id : "2"
/// user_id : "1"
/// clinic_id : "1"
/// test_id : "0"
/// doctor_id : "1"
/// booking_type : "tvs_scan"
/// date : "2023-12-13"
/// time : "05:05:05"
/// consultant_fee : "500"
/// special_instruction : "instruction"
/// status : "1"
/// datetime : "2023-12-18 12:17:44"
///

class AppointmentList {
  AppointmentList({
    String? id,
    String? userId,
    String? clinicId,
    String? testId,
    String? doctorId,
    String? bookingType,
    String? date,
    String? time,
    String? consultantFee,
    String? specialInstruction,
    String? status,
    String? datetime,
    String? doctorName,
    String? doctorPost,
    String? doctorImage,
    String? clinicName,
    String? clinicAddress,}){
    _id = id;
    _userId = userId;
    _clinicId = clinicId;
    _testId = testId;
    _doctorId = doctorId;
    _bookingType = bookingType;
    _date = date;
    _time = time;
    _consultantFee = consultantFee;
    _specialInstruction = specialInstruction;
    _status = status;
    _datetime = datetime;
    _doctorName = doctorName;
    _doctorPost = doctorPost;
    _doctorImage = doctorImage;
    _clinicName = clinicName;
    _clinicAddress = clinicAddress;
}

  AppointmentList.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _clinicId = json['clinic_id'];
    _testId = json['test_id'];
    _doctorId = json['doctor_id'];
    _bookingType = json['booking_type'];
    _date = json['date'];
    _time = json['time'];
    _consultantFee = json['consultant_fee'];
    _specialInstruction = json['special_instruction'];
    _status = json['status'];
    _datetime = json['datetime'];
    _doctorName = json['doctor_name'];
    _doctorPost = json['doctor_post'];
    _doctorImage = json['doctor_image'];
    _clinicName = json['clinic_name'];
    _clinicAddress = json['clinic_address'];
  }
  String? _id;
  String? _userId;
  String? _clinicId;
  String? _testId;
  String? _doctorId;
  String? _bookingType;
  String? _date;
  String? _time;
  String? _consultantFee;
  String? _specialInstruction;
  String? _status;
  String? _datetime;
  String? _doctorName;
  String? _doctorPost;
  String? _doctorImage;
  String? _clinicName;
  String? _clinicAddress;
  AppointmentList copyWith({  String? id,
  String? userId,
  String? clinicId,
  String? testId,
  String? doctorId,
  String? bookingType,
  String? date,
  String? time,
  String? consultantFee,
  String? specialInstruction,
  String? status,
  String? datetime,
    String? doctorName,
    String? doctorPost,
    String? doctorImage,
    String? clinicName,
    String? clinicAddress,
}) => AppointmentList(  id: id ?? _id,
  userId: userId ?? _userId,
  clinicId: clinicId ?? _clinicId,
  testId: testId ?? _testId,
  doctorId: doctorId ?? _doctorId,
  bookingType: bookingType ?? _bookingType,
  date: date ?? _date,
  time: time ?? _time,
  consultantFee: consultantFee ?? _consultantFee,
  specialInstruction: specialInstruction ?? _specialInstruction,
  status: status ?? _status,
  datetime: datetime ?? _datetime,
    doctorName: doctorName ?? _doctorName,
    doctorPost: doctorPost ?? _doctorPost,
    doctorImage: doctorImage ?? _doctorImage,
    clinicName: clinicName ?? _clinicName,
    clinicAddress: clinicAddress ?? _clinicAddress,
);
  String? get id => _id;
  String? get userId => _userId;
  String? get clinicId => _clinicId;
  String? get testId => _testId;
  String? get doctorId => _doctorId;
  String? get bookingType => _bookingType;
  String? get date => _date;
  String? get time => _time;
  String? get consultantFee => _consultantFee;
  String? get specialInstruction => _specialInstruction;
  String? get status => _status;
  String? get datetime => _datetime;
  String? get doctorName => _doctorName;
  String? get doctorPost => _doctorPost;
  String? get doctorImage => _doctorImage;
  String? get clinicName => _clinicName;
  String? get clinicAddress => _clinicAddress;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['clinic_id'] = _clinicId;
    map['test_id'] = _testId;
    map['doctor_id'] = _doctorId;
    map['booking_type'] = _bookingType;
    map['date'] = _date;
    map['time'] = _time;
    map['consultant_fee'] = _consultantFee;
    map['special_instruction'] = _specialInstruction;
    map['status'] = _status;
    map['datetime'] = _datetime;
    map['doctor_name'] = _doctorName;
    map['doctor_post'] = _doctorPost;
    map['doctor_image'] = _doctorImage;
    map['clinic_name'] = _clinicName;
    map['clinic_address'] = _clinicAddress;
    return map;
  }

}