class GetWorkoutWeekModel {
  List<Result>? result;
  String? message;
  String? status;

  GetWorkoutWeekModel({this.result, this.message, this.status});

  GetWorkoutWeekModel.fromJson(Map<String, dynamic> json) {
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
  String? week;
  String? dateTime;

  Result({this.id, this.week, this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    week = json['week'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['week'] = week;
    data['date_time'] = dateTime;
    return data;
  }
}
