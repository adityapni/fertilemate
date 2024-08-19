class GetInsightsModel {
  List<Data>? data;
  String? message;
  String? status;

  GetInsightsModel({this.data, this.message, this.status});

  GetInsightsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  String? inId;
  String? inName;

  Data({this.inId, this.inName});

  Data.fromJson(Map<String, dynamic> json) {
    inId = json['in_id'];
    inName = json['in_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['in_id'] = inId;
    data['in_name'] = inName;
    return data;
  }
}
