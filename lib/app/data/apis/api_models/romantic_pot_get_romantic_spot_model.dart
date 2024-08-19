class RomanticSpotGetRomanticSpotModel {
  List<RomanticSpotGetRomanticSpotResult>? result;
  String? message;
  String? status;

  RomanticSpotGetRomanticSpotModel({this.result, this.message, this.status});

  RomanticSpotGetRomanticSpotModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <RomanticSpotGetRomanticSpotResult>[];
      json['result'].forEach((v) {
        result!.add(RomanticSpotGetRomanticSpotResult.fromJson(v));
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

class RomanticSpotGetRomanticSpotResult {
  String? id;
  String? name;
  String? image;
  String? description;
  String? status;
  String? dateTime;
  String? addreess;
  String? lat;
  String? lon;
  String? city;

  RomanticSpotGetRomanticSpotResult(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.status,
      this.dateTime,
      this.addreess,
      this.lat,
      this.lon,
      this.city});

  RomanticSpotGetRomanticSpotResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    dateTime = json['date_time'];
    addreess = json['addreess'];
    lat = json['lat'];
    lon = json['lon'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['addreess'] = addreess;
    data['lat'] = lat;
    data['lon'] = lon;
    data['city'] = city;
    return data;
  }
}
