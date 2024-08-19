class PayexPaymentModel {
  Result? result;
  int? status;
  String? message;

  PayexPaymentModel({this.result, this.status, this.message});

  PayexPaymentModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null ? Result.fromJson(json['result']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Result {
  String? requestId;
  String? status;
  List<ResultList>? resultList;
  String? message;

  Result({this.requestId, this.status, this.resultList, this.message});

  Result.fromJson(Map<String, dynamic> json) {
    requestId = json['request_id'];
    status = json['status'];
    if (json['result'] != null) {
      resultList = <ResultList>[];
      json['result'].forEach((v) {
        resultList!.add(ResultList.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['request_id'] = requestId;
    data['status'] = status;
    if (resultList != null) {
      data['result'] = resultList!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class ResultList {
  String? status;
  String? key;
  String? url;
  String? error;

  ResultList({this.status, this.key, this.url, this.error});

  ResultList.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    key = json['key'];
    url = json['url'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['key'] = key;
    data['url'] = url;
    data['error'] = error;
    return data;
  }
}
