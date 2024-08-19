class TemperatureHistoryModel {
  List<TemperatureHistoryData>? doctor;
  String? message;
  String? status;

  TemperatureHistoryModel({this.doctor, this.message, this.status});

  TemperatureHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['doctor'] != null) {
      doctor = <TemperatureHistoryData>[];
      json['doctor'].forEach((v) {
        doctor!.add(TemperatureHistoryData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (doctor != null) {
      data['doctor'] = doctor!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class TemperatureHistoryData {
  String? id;
  String? userId;
  String? temperature;
  String? dateTime;

  TemperatureHistoryData(
      {this.id, this.userId, this.temperature, this.dateTime});

  TemperatureHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    temperature = json['temperature'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['temperature'] = temperature;
    data['date_time'] = dateTime;
    return data;
  }
}
