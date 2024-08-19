class GetCycleTrackingDataModel {
  List<GetCycleTrackingList>? data;
  String? message;
  String? status;

  GetCycleTrackingDataModel({this.data, this.message, this.status});

  GetCycleTrackingDataModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetCycleTrackingList>[];
      json['data'].forEach((v) {
        data!.add(GetCycleTrackingList.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetCycleTrackingList {
  String? id;
  String? userId;
  String? startDate;
  String? periodDuration;
  String? notePeriod;
  String? ovulationDate;
  String? noteOvulation;
  String? intimateDate;

  GetCycleTrackingList(
      {this.id,
      this.userId,
      this.startDate,
      this.periodDuration,
      this.notePeriod,
      this.ovulationDate,
      this.noteOvulation,
      this.intimateDate});

  GetCycleTrackingList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    startDate = json['start_date'];
    periodDuration = json['period_duration'];
    notePeriod = json['note_period'];
    ovulationDate = json['ovulation_date'];
    noteOvulation = json['note_ovulation'];
    intimateDate = json['intimate_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['start_date'] = startDate;
    data['period_duration'] = periodDuration;
    data['note_period'] = notePeriod;
    data['ovulation_date'] = ovulationDate;
    data['note_ovulation'] = noteOvulation;
    data['intimate_date'] = intimateDate;
    return data;
  }
}
