class GetWorkoutModel {
  List<Result>? result;
  String? message;
  String? status;

  GetWorkoutModel({this.result, this.message, this.status});

  GetWorkoutModel.fromJson(Map<String, dynamic> json) {
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
  String? workoutTypesId;
  String? bodyPartsId;
  String? description;
  String? image;
  String? dateTime;

  Result(
      {this.id,
      this.workoutTypesId,
      this.bodyPartsId,
      this.description,
      this.image,
      this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    workoutTypesId = json['workout_types_id'];
    bodyPartsId = json['body_parts_id'];
    description = json['description'];
    image = json['image'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['workout_types_id'] = workoutTypesId;
    data['body_parts_id'] = bodyPartsId;
    data['description'] = description;
    data['image'] = image;
    data['date_time'] = dateTime;
    return data;
  }
}
