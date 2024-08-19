class GetSoundtrackCategoriesModel {
  List<GetSoundtrackCategoriesResult>? getSoundtrackCategoriesResult;
  String? message;
  String? status;

  GetSoundtrackCategoriesModel({this.getSoundtrackCategoriesResult, this.message, this.status});

  GetSoundtrackCategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      getSoundtrackCategoriesResult = <GetSoundtrackCategoriesResult>[];
      json['result'].forEach((v) {
        getSoundtrackCategoriesResult!.add(GetSoundtrackCategoriesResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getSoundtrackCategoriesResult != null) {
      data['result'] = getSoundtrackCategoriesResult!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetSoundtrackCategoriesResult {
  String? id;
  String? smstName;
  String? smstImage;

  GetSoundtrackCategoriesResult({this.id, this.smstName, this.smstImage});

  GetSoundtrackCategoriesResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    smstName = json['smst_name'];
    smstImage = json['smst_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['smst_name'] = smstName;
    data['smst_image'] = smstImage;
    return data;
  }
}
