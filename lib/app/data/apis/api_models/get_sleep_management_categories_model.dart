class SleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel {
  List<Result>? result;
  String? message;
  String? status;

  SleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel(
      {this.result, this.message, this.status});

  SleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel.fromJson(
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
  String? imcId;
  String? imcName;
  String? imcImage;

  Result({this.imcId, this.imcName, this.imcImage});

  Result.fromJson(Map<String, dynamic> json) {
    imcId = json['imc_id'];
    imcName = json['imc_name'];
    imcImage = json['imc_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imc_id'] = imcId;
    data['imc_name'] = imcName;
    data['imc_image'] = imcImage;
    return data;
  }
}
