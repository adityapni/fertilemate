class GetClinicNotificationDetailsModel {
  Result? result;
  String? message;
  String? status;

  GetClinicNotificationDetailsModel({this.result, this.message, this.status});

  GetClinicNotificationDetailsModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
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
  String? viewStatus;
  String? dateTime;
  String? userName;
  String? userEmail;
  String? userImage;
  List<NotificationSteps>? notificationSteps;

  Result(
      {this.id,
        this.userId,
        this.userLat,
        this.userLon,
        this.clinicId,
        this.bookingId,
        this.notification,
        this.status,
        this.viewStatus,
        this.dateTime,
        this.userName,
        this.userEmail,
        this.userImage,
        this.notificationSteps});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    userLat = json['user_lat'];
    userLon = json['user_lon'];
    clinicId = json['clinic_id'];
    bookingId = json['booking_id'];
    notification = json['notification'];
    status = json['status'];
    viewStatus = json['view_status'];
    dateTime = json['date_time'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userImage = json['user_image'];
    if (json['notification_steps'] != null) {
      notificationSteps = <NotificationSteps>[];
      json['notification_steps'].forEach((v) {
        notificationSteps!.add(NotificationSteps.fromJson(v));
      });
    }
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
    data['view_status'] = viewStatus;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_image'] = userImage;
    if (notificationSteps != null) {
      data['notification_steps'] =
          notificationSteps!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationSteps {
  String? id;
  String? clinicNotificationsId;
  String? userId;
  String? userLat;
  String? userLon;
  String? clinicId;
  String? bookingId;
  String? notification;
  String? status;
  String? dateTime;

  NotificationSteps(
      {this.id,
        this.clinicNotificationsId,
        this.userId,
        this.userLat,
        this.userLon,
        this.clinicId,
        this.bookingId,
        this.notification,
        this.status,
        this.dateTime});

  NotificationSteps.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicNotificationsId = json['clinic_notifications_id'];
    userId = json['user_id'];
    userLat = json['user_lat'];
    userLon = json['user_lon'];
    clinicId = json['clinic_id'];
    bookingId = json['booking_id'];
    notification = json['notification'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clinic_notifications_id'] = clinicNotificationsId;
    data['user_id'] = userId;
    data['user_lat'] = userLat;
    data['user_lon'] = userLon;
    data['clinic_id'] = clinicId;
    data['booking_id'] = bookingId;
    data['notification'] = notification;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
