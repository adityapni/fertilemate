/// data : [{"id":"1","sperm_count":"sperm count","sperm_concentration":"sperm concentration","image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/sperm_assessment/Rectangle_1953.png","consultation":"consultation","date_time":"2023-12-11 15:58:25"}]
/// message : "sperm assessment List Successfully"
/// status : "1"

class SpermAssessmentModel {
  SpermAssessmentModel({
      List<SpermAssessmentData>? data,
      String? message, 
      String? status,}){
    _data = data;
    _message = message;
    _status = status;
}

  SpermAssessmentModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(SpermAssessmentData.fromJson(v));
      });
    }
    _message = json['message'];
    _status = json['status'];
  }
  List<SpermAssessmentData>? _data;
  String? _message;
  String? _status;
SpermAssessmentModel copyWith({  List<SpermAssessmentData>? data,
  String? message,
  String? status,
}) => SpermAssessmentModel(  data: data ?? _data,
  message: message ?? _message,
  status: status ?? _status,
);
  List<SpermAssessmentData>? get data => _data;
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

/// id : "1"
/// sperm_count : "sperm count"
/// sperm_concentration : "sperm concentration"
/// image : "https://server-php-8-2.technorizen.com/nuru/public/uploads/sperm_assessment/Rectangle_1953.png"
/// consultation : "consultation"
/// date_time : "2023-12-11 15:58:25"

class SpermAssessmentData {
  SpermAssessmentData({
      String? id, 
      String? spermCount, 
      String? spermConcentration, 
      String? image, 
      String? consultation, 
      String? dateTime,}){
    _id = id;
    _spermCount = spermCount;
    _spermConcentration = spermConcentration;
    _image = image;
    _consultation = consultation;
    _dateTime = dateTime;
}

  SpermAssessmentData.fromJson(dynamic json) {
    _id = json['id'];
    _spermCount = json['sperm_count'];
    _spermConcentration = json['sperm_concentration'];
    _image = json['image'];
    _consultation = json['consultation'];
    _dateTime = json['date_time'];
  }
  String? _id;
  String? _spermCount;
  String? _spermConcentration;
  String? _image;
  String? _consultation;
  String? _dateTime;
  SpermAssessmentData copyWith({  String? id,
  String? spermCount,
  String? spermConcentration,
  String? image,
  String? consultation,
  String? dateTime,
}) => SpermAssessmentData(  id: id ?? _id,
  spermCount: spermCount ?? _spermCount,
  spermConcentration: spermConcentration ?? _spermConcentration,
  image: image ?? _image,
  consultation: consultation ?? _consultation,
  dateTime: dateTime ?? _dateTime,
);
  String? get id => _id;
  String? get spermCount => _spermCount;
  String? get spermConcentration => _spermConcentration;
  String? get image => _image;
  String? get consultation => _consultation;
  String? get dateTime => _dateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['sperm_count'] = _spermCount;
    map['sperm_concentration'] = _spermConcentration;
    map['image'] = _image;
    map['consultation'] = _consultation;
    map['date_time'] = _dateTime;
    return map;
  }

}