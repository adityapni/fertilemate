class GetSonographyUltrasoundsModel {
  String? status;
  String? message;
  List<Data>? data;

  GetSonographyUltrasoundsModel({this.status, this.message, this.data});

  GetSonographyUltrasoundsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? suId;
  String? suUserId;
  String? suImage;
  String? suTitle;
  String? suDescription;

  Data(
      {this.suId,
      this.suUserId,
      this.suImage,
      this.suTitle,
      this.suDescription});

  Data.fromJson(Map<String, dynamic> json) {
    suId = json['su_id'];
    suUserId = json['su_user_id'];
    suImage = json['su_image'];
    suTitle = json['su_title'];
    suDescription = json['su_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['su_id'] = suId;
    data['su_user_id'] = suUserId;
    data['su_image'] = suImage;
    data['su_title'] = suTitle;
    data['su_description'] = suDescription;
    return data;
  }
}
