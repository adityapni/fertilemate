/// data : {"id":"1","clinic_name":"O&G Consultation","clinic_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/tvs_scan/1_1.png","clinic_address":"5-G fdgdfJalan Jalil 1, Bumi Bukit Jalil, Lebuhraya Bu...","clinic_monday":"10:00-14:00,17:00-20:00","clinic_tuesday":"10:00-14:00,17:00-20:00","clinic_wednesday":"10:00-14:00,17:00-20:00","clinic_thursday":"10:00-14:00,17:00-20:00","clinic_friday":"10:00-14:00,17:00-20:00","clinic_saturday":"10:00-14:00,17:00-20:00","clinic_sunday":"10:00-14:00,17:00-20:00","service_address":"5-G fdgdfJalan Jalil 1, Bumi Bukit Jalil, Lebuhraya Bu...","consultan_fees":"850","status":"1"}
/// message : "Bookings Detail"
/// status : "1"

class AvailableClinicsGetClinicDetailByIdModel {
  AvailableClinicsGetClinicDetailByIdModel({
      Data? data, 
      String? message, 
      String? status,}){
    _data = data;
    _message = message;
    _status = status;
}

  AvailableClinicsGetClinicDetailByIdModel.fromJson(dynamic json) {
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _message = json['message'];
    _status = json['status'];
  }
  Data? _data;
  String? _message;
  String? _status;
AvailableClinicsGetClinicDetailByIdModel copyWith({  Data? data,
  String? message,
  String? status,
}) => AvailableClinicsGetClinicDetailByIdModel(  data: data ?? _data,
  message: message ?? _message,
  status: status ?? _status,
);
  Data? get data => _data;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}

/// id : "1"
/// clinic_name : "O&G Consultation"
/// clinic_image : "https://server-php-8-2.technorizen.com/nuru/public/uploads/tvs_scan/1_1.png"
/// clinic_address : "5-G fdgdfJalan Jalil 1, Bumi Bukit Jalil, Lebuhraya Bu..."
/// clinic_monday : "10:00-14:00,17:00-20:00"
/// clinic_tuesday : "10:00-14:00,17:00-20:00"
/// clinic_wednesday : "10:00-14:00,17:00-20:00"
/// clinic_thursday : "10:00-14:00,17:00-20:00"
/// clinic_friday : "10:00-14:00,17:00-20:00"
/// clinic_saturday : "10:00-14:00,17:00-20:00"
/// clinic_sunday : "10:00-14:00,17:00-20:00"
/// service_address : "5-G fdgdfJalan Jalil 1, Bumi Bukit Jalil, Lebuhraya Bu..."
/// consultan_fees : "850"
/// status : "1"

class Data {
  Data({
      String? id, 
      String? clinicName, 
      String? clinicImage, 
      String? clinicAddress, 
      String? clinicMonday, 
      String? clinicTuesday, 
      String? clinicWednesday, 
      String? clinicThursday, 
      String? clinicFriday, 
      String? clinicSaturday, 
      String? clinicSunday, 
      String? serviceAddress, 
      String? consultanFees, 
      String? status,}){
    _id = id;
    _clinicName = clinicName;
    _clinicImage = clinicImage;
    _clinicAddress = clinicAddress;
    _clinicMonday = clinicMonday;
    _clinicTuesday = clinicTuesday;
    _clinicWednesday = clinicWednesday;
    _clinicThursday = clinicThursday;
    _clinicFriday = clinicFriday;
    _clinicSaturday = clinicSaturday;
    _clinicSunday = clinicSunday;
    _serviceAddress = serviceAddress;
    _consultanFees = consultanFees;
    _status = status;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _clinicName = json['clinic_name'];
    _clinicImage = json['clinic_image'];
    _clinicAddress = json['clinic_address'];
    _clinicMonday = json['clinic_monday'];
    _clinicTuesday = json['clinic_tuesday'];
    _clinicWednesday = json['clinic_wednesday'];
    _clinicThursday = json['clinic_thursday'];
    _clinicFriday = json['clinic_friday'];
    _clinicSaturday = json['clinic_saturday'];
    _clinicSunday = json['clinic_sunday'];
    _serviceAddress = json['service_address'];
    _consultanFees = json['consultan_fees'];
    _status = json['status'];
  }
  String? _id;
  String? _clinicName;
  String? _clinicImage;
  String? _clinicAddress;
  String? _clinicMonday;
  String? _clinicTuesday;
  String? _clinicWednesday;
  String? _clinicThursday;
  String? _clinicFriday;
  String? _clinicSaturday;
  String? _clinicSunday;
  String? _serviceAddress;
  String? _consultanFees;
  String? _status;
Data copyWith({  String? id,
  String? clinicName,
  String? clinicImage,
  String? clinicAddress,
  String? clinicMonday,
  String? clinicTuesday,
  String? clinicWednesday,
  String? clinicThursday,
  String? clinicFriday,
  String? clinicSaturday,
  String? clinicSunday,
  String? serviceAddress,
  String? consultanFees,
  String? status,
}) => Data(  id: id ?? _id,
  clinicName: clinicName ?? _clinicName,
  clinicImage: clinicImage ?? _clinicImage,
  clinicAddress: clinicAddress ?? _clinicAddress,
  clinicMonday: clinicMonday ?? _clinicMonday,
  clinicTuesday: clinicTuesday ?? _clinicTuesday,
  clinicWednesday: clinicWednesday ?? _clinicWednesday,
  clinicThursday: clinicThursday ?? _clinicThursday,
  clinicFriday: clinicFriday ?? _clinicFriday,
  clinicSaturday: clinicSaturday ?? _clinicSaturday,
  clinicSunday: clinicSunday ?? _clinicSunday,
  serviceAddress: serviceAddress ?? _serviceAddress,
  consultanFees: consultanFees ?? _consultanFees,
  status: status ?? _status,
);
  String? get id => _id;
  String? get clinicName => _clinicName;
  String? get clinicImage => _clinicImage;
  String? get clinicAddress => _clinicAddress;
  String? get clinicMonday => _clinicMonday;
  String? get clinicTuesday => _clinicTuesday;
  String? get clinicWednesday => _clinicWednesday;
  String? get clinicThursday => _clinicThursday;
  String? get clinicFriday => _clinicFriday;
  String? get clinicSaturday => _clinicSaturday;
  String? get clinicSunday => _clinicSunday;
  String? get serviceAddress => _serviceAddress;
  String? get consultanFees => _consultanFees;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['clinic_name'] = _clinicName;
    map['clinic_image'] = _clinicImage;
    map['clinic_address'] = _clinicAddress;
    map['clinic_monday'] = _clinicMonday;
    map['clinic_tuesday'] = _clinicTuesday;
    map['clinic_wednesday'] = _clinicWednesday;
    map['clinic_thursday'] = _clinicThursday;
    map['clinic_friday'] = _clinicFriday;
    map['clinic_saturday'] = _clinicSaturday;
    map['clinic_sunday'] = _clinicSunday;
    map['service_address'] = _serviceAddress;
    map['consultan_fees'] = _consultanFees;
    map['status'] = _status;
    return map;
  }

}