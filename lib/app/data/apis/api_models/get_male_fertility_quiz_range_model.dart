class GetMaleFertilityQuizRangeModel {
  List<GetMaleFertilityQuizRangeData>? data;
  String? message;
  String? status;

  GetMaleFertilityQuizRangeModel({this.data, this.message, this.status});

  GetMaleFertilityQuizRangeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetMaleFertilityQuizRangeData>[];
      json['data'].forEach((v) {
        data!.add(GetMaleFertilityQuizRangeData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetMaleFertilityQuizRangeData {
  String? id;
  String? name;
  String? range;
  String? rangeTo;
  String? status;

  GetMaleFertilityQuizRangeData(
      {this.id, this.name, this.range, this.rangeTo, this.status});

  GetMaleFertilityQuizRangeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    range = json['range'];
    rangeTo = json['range_to'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['range'] = range;
    data['range_to'] = rangeTo;
    data['status'] = status;
    return data;
  }
}

/*
class GetMaleFertilityQuizRangeModel {
  List<GetMaleFertilityQuizRangeData>? data;
  String? message;
  String? status;

  GetMaleFertilityQuizRangeModel({this.data, this.message, this.status});

  GetMaleFertilityQuizRangeModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetMaleFertilityQuizRangeData>[];
      json['data'].forEach((v) {
        data!.add(GetMaleFertilityQuizRangeData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetMaleFertilityQuizRangeData {
  String? id;
  String? name;
  String? range;
  String? status;

  GetMaleFertilityQuizRangeData({this.id, this.name, this.range, this.status});

  GetMaleFertilityQuizRangeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    range = json['range'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['range'] = range;
    data['status'] = status;
    return data;
  }
}
*/
