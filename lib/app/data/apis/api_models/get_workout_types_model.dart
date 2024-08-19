class GetWorkoutTypesModel {
  List<Data>? data;
  String? message;
  String? status;

  GetWorkoutTypesModel({this.data, this.message, this.status});

  GetWorkoutTypesModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? wtId;
  String? wtName;
  String? wtImage;

  Data({this.wtId, this.wtName, this.wtImage});

  Data.fromJson(Map<String, dynamic> json) {
    wtId = json['wt_id'];
    wtName = json['wt_name'];
    wtImage = json['wt_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wt_id'] = wtId;
    data['wt_name'] = wtName;
    data['wt_image'] = wtImage;
    return data;
  }
}
