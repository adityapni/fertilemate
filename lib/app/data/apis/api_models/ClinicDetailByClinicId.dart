/// data : {"clinic_id":"10","clinic_name":"Cooper Lubin","clinic_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/available_test/3d6d4cfa795422a21256d52f156976c7.jpg","clinic_address":"20-G Jalan Jalil 1, Bumi Bukit Jalil, Lebuhraya Bukit Jalil, Bukit Jalil, 57000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur","clinic_monday":"10:00-14:00,17:00-20:00","clinic_tuesday":"10:00-14:00,17:00-20:00","clinic_wednesday":"10:00-14:00,17:00-20:00","clinic_thursday":"10:00-14:00,17:00-20:00","clinic_friday":"10:00-14:00,17:00-20:00","clinic_saturday":"10:00-14:00,17:00-20:00","clinic_sunday":"10:00-14:00,17:00-20:00","service_address":"4.3, Jalan Furw, 34500, Kuala Lumpur, MalaysiaSperm ConcentrationSpem CountConsultan","sperm_concentration":"sperm concentration","sperm_count":"sperm count","consultan":"consultan","status":"Active","clients":200,"rating":"4.5/5"}
/// message : "Data Found Successfully"
/// status : "1"

class ClinicDetailByClinicIdModel {
  ClinicDetailByClinicId({
    ClinicDetailByClinicIdData? data,
      String? message, 
      String? status,}){
    _data = data;
    _message = message;
    _status = status;
}

  ClinicDetailByClinicIdModel.fromJson(dynamic json) {
    _data = json['data'] != null ? ClinicDetailByClinicIdData.fromJson(json['data']) : null;
    _message = json['message'];
    _status = json['status'];
  }
  ClinicDetailByClinicIdData? _data;
  String? _message;
  String? _status;
  ClinicDetailByClinicIdModel copyWith({  ClinicDetailByClinicIdData? data,
  String? message,
  String? status,
}) => ClinicDetailByClinicId(  data: data ?? _data,
  message: message ?? _message,
  status: status ?? _status,
);
  ClinicDetailByClinicIdData? get data => _data;
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

/// clinic_id : "10"
/// clinic_name : "Cooper Lubin"
/// clinic_image : "https://server-php-8-2.technorizen.com/nuru/public/uploads/available_test/3d6d4cfa795422a21256d52f156976c7.jpg"
/// clinic_address : "20-G Jalan Jalil 1, Bumi Bukit Jalil, Lebuhraya Bukit Jalil, Bukit Jalil, 57000 Kuala Lumpur, Wilayah Persekutuan Kuala Lumpur"
/// clinic_monday : "10:00-14:00,17:00-20:00"
/// clinic_tuesday : "10:00-14:00,17:00-20:00"
/// clinic_wednesday : "10:00-14:00,17:00-20:00"
/// clinic_thursday : "10:00-14:00,17:00-20:00"
/// clinic_friday : "10:00-14:00,17:00-20:00"
/// clinic_saturday : "10:00-14:00,17:00-20:00"
/// clinic_sunday : "10:00-14:00,17:00-20:00"
/// service_address : "4.3, Jalan Furw, 34500, Kuala Lumpur, MalaysiaSperm ConcentrationSpem CountConsultan"
/// sperm_concentration : "sperm concentration"
/// sperm_count : "sperm count"
/// consultan : "consultan"
/// status : "Active"
/// clients : 200
/// rating : "4.5/5"

class ClinicDetailByClinicIdData {
  ClinicDetailByClinicIdData({
      String? clinicId, 
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
      String? spermConcentration, 
      String? spermCount, 
      String? consultan, 
      String? status, 
      num? clients, 
      String? rating,}){
    _clinicId = clinicId;
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
    _spermConcentration = spermConcentration;
    _spermCount = spermCount;
    _consultan = consultan;
    _status = status;
    _clients = clients;
    _rating = rating;
}

  ClinicDetailByClinicIdData.fromJson(dynamic json) {
    _clinicId = json['clinic_id'];
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
    _spermConcentration = json['sperm_concentration'];
    _spermCount = json['sperm_count'];
    _consultan = json['consultan'];
    _status = json['status'];
    _clients = json['clients'];
    _rating = json['rating'];
  }
  String? _clinicId;
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
  String? _spermConcentration;
  String? _spermCount;
  String? _consultan;
  String? _status;
  num? _clients;
  String? _rating;
  ClinicDetailByClinicIdData copyWith({  String? clinicId,
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
  String? spermConcentration,
  String? spermCount,
  String? consultan,
  String? status,
  num? clients,
  String? rating,
}) => ClinicDetailByClinicIdData(  clinicId: clinicId ?? _clinicId,
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
  spermConcentration: spermConcentration ?? _spermConcentration,
  spermCount: spermCount ?? _spermCount,
  consultan: consultan ?? _consultan,
  status: status ?? _status,
  clients: clients ?? _clients,
  rating: rating ?? _rating,
);
  String? get clinicId => _clinicId;
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
  String? get spermConcentration => _spermConcentration;
  String? get spermCount => _spermCount;
  String? get consultan => _consultan;
  String? get status => _status;
  num? get clients => _clients;
  String? get rating => _rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['clinic_id'] = _clinicId;
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
    map['sperm_concentration'] = _spermConcentration;
    map['sperm_count'] = _spermCount;
    map['consultan'] = _consultan;
    map['status'] = _status;
    map['clients'] = _clients;
    map['rating'] = _rating;
    return map;
  }

}