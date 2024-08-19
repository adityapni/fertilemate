class GetBodyPartsModel {
  List<GetBodyPartsData>? data;
  String? message;
  String? status;

  GetBodyPartsModel({this.data, this.message, this.status});

  GetBodyPartsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <GetBodyPartsData>[];
      json['data'].forEach((v) {
        data!.add(GetBodyPartsData.fromJson(v));
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

class GetBodyPartsData {
  String? bpId;
  String? bpName;
  String? bpImage;

  GetBodyPartsData({this.bpId, this.bpName, this.bpImage});

  GetBodyPartsData.fromJson(Map<String, dynamic> json) {
    bpId = json['bp_id'];
    bpName = json['bp_name'];
    bpImage = json['bp_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bp_id'] = bpId;
    data['bp_name'] = bpName;
    data['bp_image'] = bpImage;
    return data;
  }
}
