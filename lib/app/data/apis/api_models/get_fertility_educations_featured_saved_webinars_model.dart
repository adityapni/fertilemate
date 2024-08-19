class GetFertilityEducationsFeaturedSavedWebinarsModel {
  List<GetFertilityEducationsFeaturedSavedWebinarsData>? data;
  String? message;
  String? status;

  GetFertilityEducationsFeaturedSavedWebinarsModel(
      {this.data, this.message, this.status});

  GetFertilityEducationsFeaturedSavedWebinarsModel.fromJson(
      Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetFertilityEducationsFeaturedSavedWebinarsData>[];
      json['data'].forEach((v) {
        data!.add(GetFertilityEducationsFeaturedSavedWebinarsData.fromJson(v));
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

class GetFertilityEducationsFeaturedSavedWebinarsData {
  String? id;
  String? fecId;
  String? chapterId;
  String? title;
  String? image;
  String? video;
  String? duration;
  String? status;
  String? description;
  String? averageRating;
  String? dateTime;
  bool? saveStatus;

  GetFertilityEducationsFeaturedSavedWebinarsData(
      {this.id,
      this.fecId,
      this.chapterId,
      this.title,
      this.image,
      this.video,
      this.duration,
      this.status,
      this.description,
      this.averageRating,
      this.dateTime,
      this.saveStatus});

  GetFertilityEducationsFeaturedSavedWebinarsData.fromJson(
      Map<String, dynamic> json) {
    id = json['id'];
    fecId = json['fec_id'];
    chapterId = json['chapter_id'];
    title = json['title'];
    image = json['image'];
    video = json['video'];
    duration = json['duration'];
    status = json['status'];
    description = json['description'];
    averageRating = json['average_rating'];
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
    data['description'] = description;
    data['average_rating'] = averageRating;
    data['date_time'] = dateTime;
    data['save_status'] = saveStatus;
    return data;
  }
}
