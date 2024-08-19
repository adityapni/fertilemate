class GetAdminMsgCountModel {
  String? message;
  String? totalMessage;
  String? status;

  GetAdminMsgCountModel({this.message, this.totalMessage, this.status});

  GetAdminMsgCountModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    totalMessage = json['total_message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['total_message'] = totalMessage;
    data['status'] = status;
    return data;
  }
}
