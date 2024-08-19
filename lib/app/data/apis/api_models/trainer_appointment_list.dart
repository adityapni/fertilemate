/// data : [{"doctors_booking_id":"1","doctors_booking_doctors_id":"1","name":"test","email":"test@gmail.com","client_surname":"one plus","client_number":"23423424","amount":"10","doctors_booking_date":"2022-12-07","doctors_booking_time":"11:30:00","status":"Active","date_time":"2023-12-08 12:16:46"},{"doctors_booking_id":"2","doctors_booking_doctors_id":"1","name":"test","email":"test@gmail.com","client_surname":"one plus","client_number":"23423424","amount":"10","doctors_booking_date":"2022-12-07","doctors_booking_time":"11:30:00","status":"Active","date_time":"2023-12-08 12:31:36"}]
/// message : "Bookings retrieved successfully"
/// status : "1"

class TrainerAppointmentListModel {
  TrainerAppointmentList({
      List<Data>? data, 
      String? message, 
      String? status,}){
    _data = data;
    _message = message;
    _status = status;
}

  TrainerAppointmentListModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
    _status = json['status'];
  }
  List<Data>? _data;
  String? _message;
  String? _status;
  TrainerAppointmentListModel copyWith({  List<Data>? data,
  String? message,
  String? status,
}) => TrainerAppointmentList(  data: data ?? _data,
  message: message ?? _message,
  status: status ?? _status,
);
  List<Data>? get data => _data;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}

/// doctors_booking_id : "1"
/// doctors_booking_doctors_id : "1"
/// name : "test"
/// email : "test@gmail.com"
/// client_surname : "one plus"
/// client_number : "23423424"
/// amount : "10"
/// doctors_booking_date : "2022-12-07"
/// doctors_booking_time : "11:30:00"
/// status : "Active"
/// date_time : "2023-12-08 12:16:46"

class Data {
  Data({
      String? doctorsBookingId, 
      String? doctorsBookingDoctorsId, 
      String? name, 
      String? email, 
      String? clientSurname, 
      String? clientNumber, 
      String? amount, 
      String? doctorsBookingDate, 
      String? doctorsBookingTime, 
      String? status, 
      String? dateTime,}){
    _doctorsBookingId = doctorsBookingId;
    _doctorsBookingDoctorsId = doctorsBookingDoctorsId;
    _name = name;
    _email = email;
    _clientSurname = clientSurname;
    _clientNumber = clientNumber;
    _amount = amount;
    _doctorsBookingDate = doctorsBookingDate;
    _doctorsBookingTime = doctorsBookingTime;
    _status = status;
    _dateTime = dateTime;
}

  Data.fromJson(dynamic json) {
    _doctorsBookingId = json['doctors_booking_id'];
    _doctorsBookingDoctorsId = json['doctors_booking_doctors_id'];
    _name = json['name'];
    _email = json['email'];
    _clientSurname = json['client_surname'];
    _clientNumber = json['client_number'];
    _amount = json['amount'];
    _doctorsBookingDate = json['doctors_booking_date'];
    _doctorsBookingTime = json['doctors_booking_time'];
    _status = json['status'];
    _dateTime = json['date_time'];
  }
  String? _doctorsBookingId;
  String? _doctorsBookingDoctorsId;
  String? _name;
  String? _email;
  String? _clientSurname;
  String? _clientNumber;
  String? _amount;
  String? _doctorsBookingDate;
  String? _doctorsBookingTime;
  String? _status;
  String? _dateTime;
Data copyWith({  String? doctorsBookingId,
  String? doctorsBookingDoctorsId,
  String? name,
  String? email,
  String? clientSurname,
  String? clientNumber,
  String? amount,
  String? doctorsBookingDate,
  String? doctorsBookingTime,
  String? status,
  String? dateTime,
}) => Data(  doctorsBookingId: doctorsBookingId ?? _doctorsBookingId,
  doctorsBookingDoctorsId: doctorsBookingDoctorsId ?? _doctorsBookingDoctorsId,
  name: name ?? _name,
  email: email ?? _email,
  clientSurname: clientSurname ?? _clientSurname,
  clientNumber: clientNumber ?? _clientNumber,
  amount: amount ?? _amount,
  doctorsBookingDate: doctorsBookingDate ?? _doctorsBookingDate,
  doctorsBookingTime: doctorsBookingTime ?? _doctorsBookingTime,
  status: status ?? _status,
  dateTime: dateTime ?? _dateTime,
);
  String? get doctorsBookingId => _doctorsBookingId;
  String? get doctorsBookingDoctorsId => _doctorsBookingDoctorsId;
  String? get name => _name;
  String? get email => _email;
  String? get clientSurname => _clientSurname;
  String? get clientNumber => _clientNumber;
  String? get amount => _amount;
  String? get doctorsBookingDate => _doctorsBookingDate;
  String? get doctorsBookingTime => _doctorsBookingTime;
  String? get status => _status;
  String? get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['doctors_booking_id'] = _doctorsBookingId;
    map['doctors_booking_doctors_id'] = _doctorsBookingDoctorsId;
    map['name'] = _name;
    map['email'] = _email;
    map['client_surname'] = _clientSurname;
    map['client_number'] = _clientNumber;
    map['amount'] = _amount;
    map['doctors_booking_date'] = _doctorsBookingDate;
    map['doctors_booking_time'] = _doctorsBookingTime;
    map['status'] = _status;
    map['date_time'] = _dateTime;
    return map;
  }

}