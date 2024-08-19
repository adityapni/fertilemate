class GetFertilityWebinarsBlogsByCategoryModel {
  List<Result>? result;
  String? message;
  String? status;

  GetFertilityWebinarsBlogsByCategoryModel(
      {this.result, this.message, this.status});

  GetFertilityWebinarsBlogsByCategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? fecId;
  String? name;
  String? title;
  String? dateTime;
  List<WebinarsDeatils>? webinarsDeatils;

  Result(
      {this.id,
        this.fecId,
        this.name,
        this.title,
        this.dateTime,
        this.webinarsDeatils});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fecId = json['fec_id'];
    name = json['name'];
    title = json['title'];
    dateTime = json['date_time'];
    if (json['webinars_deatils'] != null) {
      webinarsDeatils = <WebinarsDeatils>[];
      json['webinars_deatils'].forEach((v) {
        webinarsDeatils!.add(WebinarsDeatils.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fec_id'] = fecId;
    data['name'] = name;
    data['title'] = title;
    data['date_time'] = dateTime;
    if (webinarsDeatils != null) {
      data['webinars_deatils'] =
          webinarsDeatils!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class WebinarsDeatils {
  String? id;
  String? fecId;
  String? chapterId;
  String? title;
  String? image;
  String? video;
  String? duration;
  String? status;
  String? dateTime;

  WebinarsDeatils(
      {this.id,
        this.fecId,
        this.chapterId,
        this.title,
        this.image,
        this.video,
        this.duration,
        this.status,
        this.dateTime});

  WebinarsDeatils.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fecId = json['fec_id'];
    chapterId = json['chapter_id'];
    title = json['title'];
    image = json['image'];
    video = json['video'];
    duration = json['duration'];
    status = json['status'];
    dateTime = json['date_time'];
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
