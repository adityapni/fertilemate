class GetRecommendedSoundtracksModel {
  List<GetRecommendedSoundtracksResult>? getRecommendedSoundtracksResult;
  String? message;
  String? status;

  GetRecommendedSoundtracksModel(
      {this.getRecommendedSoundtracksResult, this.message, this.status});

  GetRecommendedSoundtracksModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      getRecommendedSoundtracksResult = <GetRecommendedSoundtracksResult>[];
      json['result'].forEach((v) {
        getRecommendedSoundtracksResult!
            .add(GetRecommendedSoundtracksResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getRecommendedSoundtracksResult != null) {
      data['result'] =
          getRecommendedSoundtracksResult!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetRecommendedSoundtracksResult {
  String? id;
  String? title;
  String? description;
  String? image;
  String? status;
  String? rating;
  String? audio;

  GetRecommendedSoundtracksResult(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.status,
      this.rating,
      this.audio});

  GetRecommendedSoundtracksResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    rating = json['rating'];
    audio = json['audio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['rating'] = rating;
    data['audio'] = audio;
    return data;
  }
}
