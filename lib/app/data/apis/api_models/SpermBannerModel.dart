/// data : [{"banner_id":"1","name":"","banner_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_banner/Rectangle 41958.png"}]
/// message : " Successfully"
/// status : "1"

class SpermBannerModel {
  SpermBannerModel({
      List<Data>? data, 
      String? message, 
      String? status,}){
    _data = data;
    _message = message;
    _status = status;
}




  SpermBannerModel.fromJson(dynamic json) {
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
SpermBannerModel copyWith({  List<Data>? data,
  String? message,
  String? status,
}) => SpermBannerModel(  data: data ?? _data,
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

/// banner_id : "1"
/// name : ""
/// banner_image : "https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_banner/Rectangle 41958.png"

class Data {
  Data({
      String? bannerId, 
      String? name, 
      String? bannerImage,}){
    _bannerId = bannerId;
    _name = name;
    _bannerImage = bannerImage;
}

  Data.fromJson(dynamic json) {
    _bannerId = json['banner_id'];
    _name = json['name'];
    _bannerImage = json['banner_image'];
  }
  String? _bannerId;
  String? _name;
  String? _bannerImage;
Data copyWith({  String? bannerId,
  String? name,
  String? bannerImage,
}) => Data(  bannerId: bannerId ?? _bannerId,
  name: name ?? _name,
  bannerImage: bannerImage ?? _bannerImage,
);
  String? get bannerId => _bannerId;
  String? get name => _name;
  String? get bannerImage => _bannerImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['banner_id'] = _bannerId;
    map['name'] = _name;
    map['banner_image'] = _bannerImage;
    return map;
  }

}