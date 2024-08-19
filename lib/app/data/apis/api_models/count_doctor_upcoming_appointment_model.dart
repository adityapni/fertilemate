class CountDoctorUpcomingAppointmentModel {
   CountDoctorUpcomingAppointmentResult?  countDoctorUpcomingAppointmentResult;
  String? message;
  String? status;

  CountDoctorUpcomingAppointmentModel({this. countDoctorUpcomingAppointmentResult, this.message, this.status});

  CountDoctorUpcomingAppointmentModel.fromJson(Map<String, dynamic> json) {
     countDoctorUpcomingAppointmentResult = json['result'] != null ?  CountDoctorUpcomingAppointmentResult.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (countDoctorUpcomingAppointmentResult != null) {
      data['result'] = countDoctorUpcomingAppointmentResult!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class  CountDoctorUpcomingAppointmentResult {
  String? id;
  int? totalBooking;
  int? totalProgress;

   CountDoctorUpcomingAppointmentResult({this.id, this.totalBooking, this.totalProgress});

   CountDoctorUpcomingAppointmentResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    totalBooking = json['total_booking'];
    totalProgress = json['total_progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['total_booking'] = totalBooking;
    data['total_progress'] = totalProgress;
    return data;
  }
}
