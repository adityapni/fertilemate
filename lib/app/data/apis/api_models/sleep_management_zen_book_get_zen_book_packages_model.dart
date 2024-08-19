class SleepManagementZenBookGetZenBookPackagesModel {
  List<Result>? result;
  String? message;
  String? status;

  SleepManagementZenBookGetZenBookPackagesModel(
      {this.result, this.message, this.status});

  SleepManagementZenBookGetZenBookPackagesModel.fromJson(
      Map<String, dynamic> json) {
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
  String? zmzbpId;
  String? zmzbpName;
  String? zmzbpDescription;
  String? zmzbpImage;

  Result(
      {this.zmzbpId, this.zmzbpName, this.zmzbpDescription, this.zmzbpImage});

  Result.fromJson(Map<String, dynamic> json) {
    zmzbpId = json['zmzbp_id'];
    zmzbpName = json['zmzbp_name'];
    zmzbpDescription = json['zmzbp_description'];
    zmzbpImage = json['zmzbp_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['zmzbp_id'] = zmzbpId;
    data['zmzbp_name'] = zmzbpName;
    data['zmzbp_description'] = zmzbpDescription;
    data['zmzbp_image'] = zmzbpImage;
    return data;
  }
}
