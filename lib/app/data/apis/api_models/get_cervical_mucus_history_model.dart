class GetCervicalMucusHistoryModel {
  List<GetCervicalMucusHistoryData>? data;
  String? message;
  String? status;

  GetCervicalMucusHistoryModel({this.data, this.message, this.status});

  GetCervicalMucusHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetCervicalMucusHistoryData>[];
      json['data'].forEach((v) {
        data!.add(GetCervicalMucusHistoryData.fromJson(v));
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

class GetCervicalMucusHistoryData {
  String? id;
  String? userId;
  String? conditionData;
  String? remark;
  String? date;

  GetCervicalMucusHistoryData(
      {this.id, this.userId, this.conditionData, this.remark, this.date});

  GetCervicalMucusHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    conditionData = json['condition_data'];
    remark = json['remark'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['condition_data'] = conditionData;
    data['remark'] = remark;
    data['date'] = date;
    return data;
  }
}
