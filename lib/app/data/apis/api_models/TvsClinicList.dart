/// doctor : [{"id":"1","clinic_name":"O&G Consultation","clinic_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/tvs_scan/1_1.png"},{"id":"2","clinic_name":"Transvaginal scan","clinic_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/tvs_scan/1_2.png"},{"id":"3","clinic_name":"2D Ultrasound","clinic_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/tvs_scan/1_3.png"},{"id":"4","clinic_name":"HSG Scan","clinic_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/tvs_scan/1_4.png"},{"id":"5","clinic_name":"HSG","clinic_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/tvs_scan/1_5.png"},{"id":"6","clinic_name":"Premium","clinic_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/tvs_scan/1_6.png"}]
/// message : "Tvs Scan List Successfully"
/// status : "1"

class TvsClinicList {
  TvsClinicList({
      List<Doctor>? doctor, 
      String? message, 
      String? status,}){
    _doctor = doctor;
    _message = message;
    _status = status;
}

  TvsClinicList.fromJson(dynamic json) {
    if (json['doctor'] != null) {
      _doctor = [];
      json['doctor'].forEach((v) {
        _doctor?.add(Doctor.fromJson(v));
      });
    }
    _message = json['message'];
    _status = json['status'];
  }
  List<Doctor>? _doctor;
  String? _message;
  String? _status;
TvsClinicList copyWith({  List<Doctor>? doctor,
  String? message,
  String? status,
}) => TvsClinicList(  doctor: doctor ?? _doctor,
  message: message ?? _message,
  status: status ?? _status,
);
  List<Doctor>? get doctor => _doctor;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_doctor != null) {
      map['doctor'] = _doctor?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }

}

/// id : "1"
/// clinic_name : "O&G Consultation"
/// clinic_image : "https://server-php-8-2.technorizen.com/nuru/public/uploads/tvs_scan/1_1.png"

class Doctor {
  Doctor({
      String? id, 
      String? clinicName, 
      String? clinicImage,}){
    _id = id;
    _clinicName = clinicName;
    _clinicImage = clinicImage;
}

  Doctor.fromJson(dynamic json) {
    _id = json['id'];
    _clinicName = json['clinic_name'];
    _clinicImage = json['clinic_image'];
  }
  String? _id;
  String? _clinicName;
  String? _clinicImage;
Doctor copyWith({  String? id,
  String? clinicName,
  String? clinicImage,
}) => Doctor(  id: id ?? _id,
  clinicName: clinicName ?? _clinicName,
  clinicImage: clinicImage ?? _clinicImage,
);
  String? get id => _id;
  String? get clinicName => _clinicName;
  String? get clinicImage => _clinicImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['clinic_name'] = _clinicName;
    map['clinic_image'] = _clinicImage;
    return map;
  }

}