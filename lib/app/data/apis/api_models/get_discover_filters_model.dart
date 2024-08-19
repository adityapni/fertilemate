class GetDiscoverFiltersModel {
  List<Result>? result;
  String? message;
  String? status;

  GetDiscoverFiltersModel({this.result, this.message, this.status});

  GetDiscoverFiltersModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? smcName;
  String? smcStatus;

  Result({this.id, this.smcName, this.smcStatus});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    smcName = json['smc_name'];
    smcStatus = json['smc_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['smc_name'] = smcName;
    data['smc_status'] = smcStatus;
    return data;
  }
}
