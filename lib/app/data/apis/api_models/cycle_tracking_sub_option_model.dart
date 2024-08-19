class CycleTrackingSubOptionModel {
  List<Result>? result;
  String? title;
  String? message;
  String? status;

  CycleTrackingSubOptionModel(
      {this.result, this.title, this.message, this.status});

  CycleTrackingSubOptionModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Result>[];
      json['result'].forEach((v) {
        result!.add(Result.fromJson(v));
      });
    }
    title = json['title'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['title'] = title;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? cycleTrackingSubOptionId;
  String? name;

  Result({this.id, this.cycleTrackingSubOptionId, this.name});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cycleTrackingSubOptionId = json['cycle_tracking_sub_option_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['cycle_tracking_sub_option_id'] = cycleTrackingSubOptionId;
    data['name'] = name;
    return data;
  }
}
