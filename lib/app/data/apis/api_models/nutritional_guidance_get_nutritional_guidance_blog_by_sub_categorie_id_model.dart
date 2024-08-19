class GuidanceGetNutritionalGuidanceBlogBySubCategorieIdModel {
  List<Result>? result;
  String? message;
  String? status;

  GuidanceGetNutritionalGuidanceBlogBySubCategorieIdModel(
      {this.result, this.message, this.status});

  GuidanceGetNutritionalGuidanceBlogBySubCategorieIdModel.fromJson(
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
  String? ngbId;
  String? ngbTitle;
  String? ngbDescription;
  String? ngbImage;
  String? ngbSubCategoryId;

  Result(
      {this.ngbId,
        this.ngbTitle,
        this.ngbDescription,
        this.ngbImage,
        this.ngbSubCategoryId});

  Result.fromJson(Map<String, dynamic> json) {
    ngbId = json['ngb_id'];
    ngbTitle = json['ngb_title'];
    ngbDescription = json['ngb_description'];
    ngbImage = json['ngb_image'];
    ngbSubCategoryId = json['ngb_sub_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ngb_id'] = ngbId;
    data['ngb_title'] = ngbTitle;
    data['ngb_description'] = ngbDescription;
    data['ngb_image'] = ngbImage;
    data['ngb_sub_category_id'] = ngbSubCategoryId;
    return data;
  }
}
