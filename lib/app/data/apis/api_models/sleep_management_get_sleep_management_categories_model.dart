class SleepManagementGetSleepManagementCategoriesModel {
  List<Result>? result;
  String? message;
  String? status;

  SleepManagementGetSleepManagementCategoriesModel(
      {this.result, this.message, this.status});

  SleepManagementGetSleepManagementCategoriesModel.fromJson(
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
  String? smcId;
  String? smcName;
  String? smcStatus;

  Result({this.smcId, this.smcName, this.smcStatus});

  Result.fromJson(Map<String, dynamic> json) {
    smcId = json['smc_id'];
    smcName = json['smc_name'];
    smcStatus = json['smc_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['smc_id'] = smcId;
    data['smc_name'] = smcName;
    data['smc_status'] = smcStatus;
    return data;
  }
}
