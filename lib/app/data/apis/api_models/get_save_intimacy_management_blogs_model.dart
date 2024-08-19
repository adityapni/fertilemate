import 'package:fertility_boost/app/data/apis/api_models/sleep_management_intimacy_management_get_intimacy_management_categories_blogs_model.dart';

class GetSaveIntimacyManagementBlogsModel {
  List<Result>? getSaveIntimacyManagementBlogsResult;
  String? message;
  String? status;

  GetSaveIntimacyManagementBlogsModel(
      {this.getSaveIntimacyManagementBlogsResult, this.message, this.status});

  GetSaveIntimacyManagementBlogsModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      getSaveIntimacyManagementBlogsResult = <Result>[];
      json['result'].forEach((v) {
        getSaveIntimacyManagementBlogsResult!.add(Result.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getSaveIntimacyManagementBlogsResult != null) {
      data['result'] =
          getSaveIntimacyManagementBlogsResult!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
