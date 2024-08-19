class SleepManagementZenBookGetZenBookNearestProvidersModel {
  List<ResultData>? resultDate;
  String? message;
  String? status;

  SleepManagementZenBookGetZenBookNearestProvidersModel(
      {this.resultDate, this.message, this.status});

  SleepManagementZenBookGetZenBookNearestProvidersModel.fromJson(
      Map<String, dynamic> json) {
    if (json['result'] != null) {
      resultDate = <ResultData>[];
      json['result'].forEach((v) {
        resultDate!.add(ResultData.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (resultDate != null) {
      data['result'] = resultDate!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class ResultData {
  String? smzbpProvidersId;
  String? smzbpProvidersName;
  String? smzbpProvidersAddress1;
  String? smzbpProvidersAddress2;
  String? smzbpProvidersCity;
  String? smzbpProvidersState;
  String? smzbpProvidersCountry;
  String? smzbpProvidersImage;
  String? smzbpProvidersLatitude;
  String? smzbpProvidersLongitude;
  String? zenBookPackagesId;
  String? instructor;
  String? aboutUs;
  String? duration;
  String? price;
  String? status;
  String? dateTime;
  String? distance;

  ResultData(
      {this.smzbpProvidersId,
      this.smzbpProvidersName,
      this.smzbpProvidersAddress1,
      this.smzbpProvidersAddress2,
      this.smzbpProvidersCity,
      this.smzbpProvidersState,
      this.smzbpProvidersCountry,
      this.smzbpProvidersImage,
      this.smzbpProvidersLatitude,
      this.smzbpProvidersLongitude,
      this.zenBookPackagesId,
      this.instructor,
      this.aboutUs,
      this.duration,
      this.price,
      this.status,
      this.dateTime,
      this.distance});

  ResultData.fromJson(Map<String, dynamic> json) {
    smzbpProvidersId = json['smzbp_providers_id'];
    smzbpProvidersName = json['smzbp_providers_name'];
    smzbpProvidersAddress1 = json['smzbp_providers_address_1'];
    smzbpProvidersAddress2 = json['smzbp_providers_address_2'];
    smzbpProvidersCity = json['smzbp_providers_city'];
    smzbpProvidersState = json['smzbp_providers_state'];
    smzbpProvidersCountry = json['smzbp_providers_country'];
    smzbpProvidersImage = json['smzbp_providers_image'];
    smzbpProvidersLatitude = json['smzbp_providers_latitude'];
    smzbpProvidersLongitude = json['smzbp_providers_longitude'];
    zenBookPackagesId = json['zen_book_packages_id'];
    instructor = json['instructor'];
    aboutUs = json['about_us'];
    duration = json['duration'];
    price = json['price'];
    status = json['status'];
    dateTime = json['date_time'];
    distance = json['distance'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['smzbp_providers_id'] = smzbpProvidersId;
    data['smzbp_providers_name'] = smzbpProvidersName;
    data['smzbp_providers_address_1'] = smzbpProvidersAddress1;
    data['smzbp_providers_address_2'] = smzbpProvidersAddress2;
    data['smzbp_providers_city'] = smzbpProvidersCity;
    data['smzbp_providers_state'] = smzbpProvidersState;
    data['smzbp_providers_country'] = smzbpProvidersCountry;
    data['smzbp_providers_image'] = smzbpProvidersImage;
    data['smzbp_providers_latitude'] = smzbpProvidersLatitude;
    data['smzbp_providers_longitude'] = smzbpProvidersLongitude;
    data['zen_book_packages_id'] = zenBookPackagesId;
    data['instructor'] = instructor;
    data['about_us'] = aboutUs;
    data['duration'] = duration;
    data['price'] = price;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['distance'] = distance;
    return data;
  }
}
