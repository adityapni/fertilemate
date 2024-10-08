class GetFindCoachModel {
  List<Result>? result;
  String? message;
  String? status;

  GetFindCoachModel({this.result, this.message, this.status});

  GetFindCoachModel.fromJson(Map<String, dynamic> json) {
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
  String? findCoachId;
  String? name;
  String? image;
  String? status;
  String? dateTime;

  Result({this.findCoachId, this.name, this.image, this.status, this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    findCoachId = json['find_coach_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['find_coach_id'] = findCoachId;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
