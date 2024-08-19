class SleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel {
  List<Result>? result;
  String? message;
  String? status;

  SleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel(
      {this.result, this.message, this.status});

  SleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel.fromJson(
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
  String? imbId;
  String? imbTitle;
  String? imbDescription;
  String? imbImage;
  String? imbIntimacyManagementCategoriesId;
  String? saved;

  Result(
      {this.imbId,
      this.imbTitle,
      this.imbDescription,
      this.imbImage,
      this.imbIntimacyManagementCategoriesId,
      this.saved,
      });

  Result.fromJson(Map<String, dynamic> json) {
    imbId = json['imb_id'];
    imbTitle = json['imb_title'];
    imbDescription = json['imb_description'];
    imbImage = json['imb_image'];
    imbIntimacyManagementCategoriesId =
        json['imb_intimacy_management_categories_id'];
    saved =
        json['saved'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imb_id'] = imbId;
    data['imb_title'] = imbTitle;
    data['imb_description'] = imbDescription;
    data['imb_image'] = imbImage;
    data['imb_intimacy_management_categories_id'] =
        imbIntimacyManagementCategoriesId;
    data['saved'] =
        saved;
    return data;
  }
}
