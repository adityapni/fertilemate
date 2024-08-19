class GetHealthRecordModel {
  String? message;
  List<Data>? data;
  String? status;

  GetHealthRecordModel({this.message, this.data, this.status});

  GetHealthRecordModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['status'] = status;
    return data;
  }
}

class Data {
  String? id;
  String? userId;
  String? bloodName;
  String? reportDate;
  String? blood;
  String? dateTime;
  String? type;
  String? document;

  Data(
      {this.id,
        this.userId,
        this.bloodName,
        this.reportDate,
        this.blood,
        this.dateTime,
        this.type,
        this.document});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    bloodName = json['blood_name'];
    reportDate = json['report_date'];
    blood = json['blood'];
    dateTime = json['date_time'];
    type = json['type'];
    document = json['document'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['blood_name'] = bloodName;
    data['report_date'] = reportDate;
    data['blood'] = blood;
    data['date_time'] = dateTime;
    data['type'] = type;
    data['document'] = document;
    return data;
  }
}
