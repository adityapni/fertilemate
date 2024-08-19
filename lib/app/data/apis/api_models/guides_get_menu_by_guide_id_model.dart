class GuidesGetMenuByGuideIdModel {
  List<Result>? result;
  String? message;
  String? status;

  GuidesGetMenuByGuideIdModel({this.result, this.message, this.status});

  GuidesGetMenuByGuideIdModel.fromJson(Map<String, dynamic> json) {
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
  String? gmId;
  String? gmTitle;
  String? gmDescription;
  String? gmGuideId;
  String? gmUserId;
  String? gmImage;

  Result(
      {this.gmId,
        this.gmTitle,
        this.gmDescription,
        this.gmGuideId,
        this.gmUserId,
        this.gmImage});

  Result.fromJson(Map<String, dynamic> json) {
    gmId = json['gm_id'];
    gmTitle = json['gm_title'];
    gmDescription = json['gm_description'];
    gmGuideId = json['gm_guide_id'];
    gmUserId = json['gm_user_id'];
    gmImage = json['gm_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['gm_id'] = gmId;
    data['gm_title'] = gmTitle;
    data['gm_description'] = gmDescription;
    data['gm_guide_id'] = gmGuideId;
    data['gm_user_id'] = gmUserId;
    data['gm_image'] = gmImage;
    return data;
  }
}
