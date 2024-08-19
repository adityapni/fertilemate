import 'package:fertility_boost/app/data/apis/api_models/sleep_management_intimacy_management_get_intimacy_management_categories_blogs_model.dart';

class GetRecommendationBlogsModel {
  List<Result>? getRecommendationBlogsResult;
  String? message;
  String? status;

  GetRecommendationBlogsModel(
      {this.getRecommendationBlogsResult, this.message, this.status});

  GetRecommendationBlogsModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      getRecommendationBlogsResult = <Result>[];
      json['result'].forEach((v) {
        getRecommendationBlogsResult!.add(Result.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getRecommendationBlogsResult != null) {
      data['result'] =
          getRecommendationBlogsResult!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
