class GetWorkoutBlogByWorkoutWeekIdModel {
  List<Result>? result;
  String? message;
  String? status;

  GetWorkoutBlogByWorkoutWeekIdModel({this.result, this.message, this.status});

  GetWorkoutBlogByWorkoutWeekIdModel.fromJson(Map<String, dynamic> json) {
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
  String? pwbId;
  String? pwbTitle;
  String? pwbDescription;
  String? pwbImage;
  String? pwbVideo;
  String? pwdWorkoutWeekId;

  Result({
    this.pwbId,
    this.pwbTitle,
    this.pwbDescription,
    this.pwbImage,
    this.pwbVideo,
    this.pwdWorkoutWeekId,
  });

  Result.fromJson(Map<String, dynamic> json) {
    pwbId = json['pwb_id'];
    pwbTitle = json['pwb_title'];
    pwbDescription = json['pwb_description'];
    pwbImage = json['pwb_image'];
    pwbVideo = json['pwb_video'];
    pwdWorkoutWeekId = json['pwd_workout_week_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pwb_id'] = pwbId;
    data['pwb_title'] = pwbTitle;
    data['pwb_description'] = pwbDescription;
    data['pwb_image'] = pwbImage;
    data['pwb_video'] = pwbVideo;
    data['pwd_workout_week_id'] = pwdWorkoutWeekId;
    return data;
  }
}
