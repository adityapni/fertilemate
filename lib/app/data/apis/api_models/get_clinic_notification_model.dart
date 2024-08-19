class GetClinicNotificationModel {
  List<Result>? result;
  String? message;
  String? status;

  GetClinicNotificationModel({this.result, this.message, this.status});

  GetClinicNotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
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

class Result {
  String? id;
  String? userId;
  String? userLat;
  String? userLon;
  String? clinicId;
  String? bookingId;
  String? notification;
  String? status;
  String? dateTime;
  String? userName;
  String? userEmail;
  String? userImage;

  Result(
      {this.id,
        this.userId,
        this.userLat,
        this.userLon,
        this.clinicId,
        this.bookingId,
        this.notification,
        this.status,
        this.dateTime,
        this.userName,
        this.userEmail,
        this.userImage});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userLat = json['user_lat'];
    userLon = json['user_lon'];
    clinicId = json['clinic_id'];
    bookingId = json['booking_id'];
    notification = json['notification'];
    status = json['status'];
    dateTime = json['date_time'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['user_lat'] = userLat;
    data['user_lon'] = userLon;
    data['clinic_id'] = clinicId;
    data['booking_id'] = bookingId;
    data['notification'] = notification;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_image'] = userImage;
    return data;
  }
}
