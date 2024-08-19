class PeriodSymtomsHistoryModel {
  List<PeriodSymtomsHistoryDoctor>? doctor;
  String? message;
  String? status;

  PeriodSymtomsHistoryModel({this.doctor, this.message, this.status});

  PeriodSymtomsHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['doctor'] != null) {
      doctor = <PeriodSymtomsHistoryDoctor>[];
      json['doctor'].forEach((v) {
        doctor!.add(PeriodSymtomsHistoryDoctor.fromJson(v));
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

class PeriodSymtomsHistoryDoctor {
  String? id;
  String? userId;
  String? tracker;
  String? mood;
  String? date;

  PeriodSymtomsHistoryDoctor(
      {this.id, this.userId, this.tracker, this.mood, this.date});

  PeriodSymtomsHistoryDoctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tracker = json['tracker'];
    mood = json['mood'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['tracker'] = tracker;
    data['mood'] = mood;
    data['date'] = date;
    return data;
  }
}
