class IntimacyGameGetIntimacyGameModel {
  List<GameModelResult>? result;
  String? message;
  String? status;

  IntimacyGameGetIntimacyGameModel({this.result, this.message, this.status});

  IntimacyGameGetIntimacyGameModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GameModelResult>[];
      json['result'].forEach((v) {
        result!.add(GameModelResult.fromJson(v));
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


class GameModelResult {
  String? id;
  String? userId;
  String? intimacyGameCategoryId;
  String? name;
  String? image;
  String? location;
  String? lat;
  String? lon;
  String? duretion;
  String? status;
  String? dateTime;
  String? userName;
  String? userImage;

  GameModelResult(
      {this.id,
        this.userId,
        this.intimacyGameCategoryId,
        this.name,
        this.image,
        this.location,
        this.lat,
        this.lon,
        this.duretion,
        this.status,
        this.dateTime,
        this.userName,
        this.userImage});

  GameModelResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    intimacyGameCategoryId = json['intimacy_game_category_id'];
    name = json['name'];
    image = json['image'];
    location = json['location'];
    lat = json['lat'];
    lon = json['lon'];
    duretion = json['duretion'];
    status = json['status'];
    dateTime = json['date_time'];
    userName = json['user_name'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['intimacy_game_category_id'] = intimacyGameCategoryId;
    data['name'] = name;
    data['image'] = image;
    data['location'] = location;
    data['lat'] = lat;
    data['lon'] = lon;
    data['duretion'] = duretion;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    data['user_image'] = userImage;
    return data;
  }
}

