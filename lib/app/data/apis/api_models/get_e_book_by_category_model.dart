class GetEBookByCategoryModel {
  List<Result>? result;
  String? message;
  String? status;

  GetEBookByCategoryModel({this.result, this.message, this.status});

  GetEBookByCategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? ebookCategoryId;
  String? title;
  String? author;
  String? description;
  String? thumbnailImage;
  String? bookPdf;
  String? status;
  String? dateTime;
  String? categoryName;

  Result(
      {this.id,
        this.ebookCategoryId,
        this.title,
        this.author,
        this.description,
        this.thumbnailImage,
        this.bookPdf,
        this.status,
        this.dateTime,
        this.categoryName});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ebookCategoryId = json['ebook_category_id'];
    title = json['title'];
    author = json['author'];
    description = json['description'];
    thumbnailImage = json['thumbnail_image'];
    bookPdf = json['book_pdf'];
    status = json['status'];
    dateTime = json['date_time'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ebook_category_id'] = ebookCategoryId;
    data['title'] = title;
    data['author'] = author;
    data['description'] = description;
    data['thumbnail_image'] = thumbnailImage;
    data['book_pdf'] = bookPdf;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['category_name'] = categoryName;
    return data;
  }
}
