/// data : [{"fec_id":"1","fec_name":"Pregnancy","fec_created_at":"2023-12-08 11:12:25","fec_updated_at":"2023-12-08 11:12:25","fec_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/"},{"fec_id":"2","fec_name":"Men's Health","fec_created_at":"2023-12-08 11:12:25","fec_updated_at":"2023-12-08 11:12:25","fec_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/"},{"fec_id":"3","fec_name":"Technology","fec_created_at":"2023-12-08 11:12:25","fec_updated_at":"2023-12-08 11:12:25","fec_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/"}]
/// message : "Doctor List Successfully"
/// status : "1"

class BlogCategoryModel {
  BlogCategory({
      List<Data>? data, 
      String? message, 
      String? status,}){
    _data = data;
    _message = message;
    _status = status;
}

  BlogCategoryModel.fromJson(dynamic json) {
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
  BlogCategoryModel copyWith({  List<Data>? data,
  String? message,
  String? status,
}) => BlogCategory(  data: data ?? _data,
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

/// fec_id : "1"
/// fec_name : "Pregnancy"
/// fec_created_at : "2023-12-08 11:12:25"
/// fec_updated_at : "2023-12-08 11:12:25"
/// fec_image : "https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/"

class Data {
  Data({
      String? fecId, 
      String? fecName, 
      String? fecCreatedAt, 
      String? fecUpdatedAt, 
      String? fecImage,}){
    _fecId = fecId;
    _fecName = fecName;
    _fecCreatedAt = fecCreatedAt;
    _fecUpdatedAt = fecUpdatedAt;
    _fecImage = fecImage;
}

  Data.fromJson(dynamic json) {
    _fecId = json['fec_id'];
    _fecName = json['fec_name'];
    _fecCreatedAt = json['fec_created_at'];
    _fecUpdatedAt = json['fec_updated_at'];
    _fecImage = json['fec_image'];
  }
  String? _fecId;
  String? _fecName;
  String? _fecCreatedAt;
  String? _fecUpdatedAt;
  String? _fecImage;
Data copyWith({  String? fecId,
  String? fecName,
  String? fecCreatedAt,
  String? fecUpdatedAt,
  String? fecImage,
}) => Data(  fecId: fecId ?? _fecId,
  fecName: fecName ?? _fecName,
  fecCreatedAt: fecCreatedAt ?? _fecCreatedAt,
  fecUpdatedAt: fecUpdatedAt ?? _fecUpdatedAt,
  fecImage: fecImage ?? _fecImage,
);
  String? get fecId => _fecId;
  String? get fecName => _fecName;
  String? get fecCreatedAt => _fecCreatedAt;
  String? get fecUpdatedAt => _fecUpdatedAt;
  String? get fecImage => _fecImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fec_id'] = _fecId;
    map['fec_name'] = _fecName;
    map['fec_created_at'] = _fecCreatedAt;
    map['fec_updated_at'] = _fecUpdatedAt;
    map['fec_image'] = _fecImage;
    return map;
  }

}