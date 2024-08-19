class GetSupportivePeaceByIdModel {
  Result? result;
  String? message;
  String? status;

  GetSupportivePeaceByIdModel({this.result, this.message, this.status});

  GetSupportivePeaceByIdModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Result {
  String? id;
  String? peaceCategoryId;
  String? peaceSubCategoryId;
  String? title;
  String? image;
  String? description;
  String? status;
  String? dateTime;
  String? peaceCategoryName;
  String? peaceSubCategoryName;
  String? fees;
  String? address;
  String? monday;
  String? tuesday;
  String? wednesday;
  String? thursday;
  String? friday;
  String? saturday;
  String? sunday;

  Result({
    this.id,
    this.peaceCategoryId,
    this.peaceSubCategoryId,
    this.title,
    this.image,
    this.description,
    this.status,
    this.dateTime,
    this.peaceCategoryName,
    this.peaceSubCategoryName,
    this.fees,
    this.address,
    this.monday,
    this.tuesday,
    this.wednesday,
    this.thursday,
    this.friday,
    this.saturday,
    this.sunday,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    peaceCategoryId = json['peace_category_id'];
    peaceSubCategoryId = json['peace_sub_category_id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    dateTime = json['date_time'];
    peaceCategoryName = json['peace_category_name'];
    peaceSubCategoryName = json['peace_sub_category_name'];
    fees = json['fees'];
    address = json['address'];
    monday = json['monday'];
    tuesday = json['tuesday'];
    wednesday = json['wednesday'];
    thursday = json['thursday'];
    friday = json['friday'];
    saturday = json['saturday'];
    sunday = json['sunday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['peace_category_id'] = peaceCategoryId;
    data['peace_sub_category_id'] = peaceSubCategoryId;
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['peace_category_name'] = peaceCategoryName;
    data['peace_sub_category_name'] = peaceSubCategoryName;
    data['fees'] = fees;
    data['address'] = address;
    data['monday'] = monday;
    data['tuesday'] = tuesday;
    data['wednesday'] = wednesday;
    data['thursday'] = thursday;
    data['friday'] = friday;
    data['saturday'] = saturday;
    data['sunday'] = sunday;
    return data;
  }
}
