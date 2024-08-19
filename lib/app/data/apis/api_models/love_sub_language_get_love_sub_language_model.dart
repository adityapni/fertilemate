class LoveSubLanguageGetLoveSubLanguageModel {
  List<LoveSubLanguageGetLoveSubLanguageResult>? result;
  String? message;
  String? status;

  LoveSubLanguageGetLoveSubLanguageModel(
      {this.result, this.message, this.status});

  LoveSubLanguageGetLoveSubLanguageModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <LoveSubLanguageGetLoveSubLanguageResult>[];
      json['result'].forEach((v) {
        result!.add(LoveSubLanguageGetLoveSubLanguageResult.fromJson(v));
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

class LoveSubLanguageGetLoveSubLanguageResult {
  String? id;
  String? loveLanguageId;
  String? name;
  String? description;
  String? image;
  String? status;
  String? dateTime;

  LoveSubLanguageGetLoveSubLanguageResult(
      {this.id,
      this.loveLanguageId,
      this.name,
      this.description,
      this.image,
      this.status,
      this.dateTime});

  LoveSubLanguageGetLoveSubLanguageResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    loveLanguageId = json['love_language_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['love_language_id'] = loveLanguageId;
    data['name'] = name;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
