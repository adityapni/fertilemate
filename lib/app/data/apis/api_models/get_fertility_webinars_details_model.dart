class GetFertilityWebinarsDetailsModel {
  Result? result;
  String? message;
  String? status;

  GetFertilityWebinarsDetailsModel({this.result, this.message, this.status});

  GetFertilityWebinarsDetailsModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? fecId;
  String? chapterId;
  String? title;
  String? image;
  String? video;
  String? duration;
  String? status;
  String? dateTime;
  bool? saveStatus;

  Result({
    this.id,
    this.fecId,
    this.chapterId,
    this.title,
    this.image,
    this.video,
    this.duration,
    this.status,
    this.dateTime,
    this.saveStatus,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fecId = json['fec_id'];
    chapterId = json['chapter_id'];
    title = json['title'];
    image = json['image'];
    video = json['video'];
    duration = json['duration'];
    status = json['status'];
    dateTime = json['date_time'];
    saveStatus = json['save_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fec_id'] = fecId;
    data['chapter_id'] = chapterId;
    data['title'] = title;
    data['image'] = image;
    data['video'] = video;
    data['duration'] = duration;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
