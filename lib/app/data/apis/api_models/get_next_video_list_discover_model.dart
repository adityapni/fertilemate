class GetNextVideoListDiscoverModel {
  List<GetNextVideoListDiscoverResult>? getNextVideoListDiscoverResult;
  String? message;
  String? status;

  GetNextVideoListDiscoverModel({this.getNextVideoListDiscoverResult, this.message, this.status});

  GetNextVideoListDiscoverModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      getNextVideoListDiscoverResult = <GetNextVideoListDiscoverResult>[];
      json['result'].forEach((v) {
        getNextVideoListDiscoverResult!.add(GetNextVideoListDiscoverResult.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (getNextVideoListDiscoverResult != null) {
      data['result'] = getNextVideoListDiscoverResult!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetNextVideoListDiscoverResult {
  String? id;
  String? filterId;
  String? name;
  String? image;
  String? video;
  String? status;
  String? type;

  GetNextVideoListDiscoverResult(
      {this.id, this.filterId, this.name, this.image, this.video, this.status, this.type});

  GetNextVideoListDiscoverResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filterId = json['filter_id'];
    name = json['name'];
    image = json['image'];
    video = json['video'];
    status = json['status'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filter_id'] = filterId;
    data['name'] = name;
    data['image'] = image;
    data['video'] = video;
    data['status'] = status;
    data['type'] = type;
    return data;
  }
}
