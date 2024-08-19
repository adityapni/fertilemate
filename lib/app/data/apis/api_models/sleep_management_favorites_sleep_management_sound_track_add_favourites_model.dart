class SleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel {
  List<String>? result;
  String? message;
  String? status;

  SleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel(
      {this.result, this.message, this.status});

  SleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel.fromJson(
      Map<String, dynamic> json) {
/*    if (json['result'] != null) {
      result = <Null>[];
      json['result'].forEach((v) {
        result!.add(new Null.fromJson(v));
      });
    }*/
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
/*    if (this.result != null) {
      data['result'] = this.result!.map((v) => v.toJson()).toList();
    }*/
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
