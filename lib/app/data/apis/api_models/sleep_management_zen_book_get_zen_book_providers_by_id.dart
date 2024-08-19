class SleepManagementZenBookGetZenBookProvidersByIdModel {
  Result? result;
  String? message;
  String? status;

  SleepManagementZenBookGetZenBookProvidersByIdModel(
      {this.result, this.message, this.status});

  SleepManagementZenBookGetZenBookProvidersByIdModel.fromJson(
      Map<String, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
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
  List<Dates>? dates;
  String? rating;

  Result(
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
        this.dates,
        this.rating});

  Result.fromJson(Map<String, dynamic> json) {
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
    if (json['dates'] != null) {
      dates = <Dates>[];
      json['dates'].forEach((v) {
        dates!.add(new Dates.fromJson(v));
      });
    }
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smzbp_providers_id'] = this.smzbpProvidersId;
    data['smzbp_providers_name'] = this.smzbpProvidersName;
    data['smzbp_providers_address_1'] = this.smzbpProvidersAddress1;
    data['smzbp_providers_address_2'] = this.smzbpProvidersAddress2;
    data['smzbp_providers_city'] = this.smzbpProvidersCity;
    data['smzbp_providers_state'] = this.smzbpProvidersState;
    data['smzbp_providers_country'] = this.smzbpProvidersCountry;
    data['smzbp_providers_image'] = this.smzbpProvidersImage;
    data['smzbp_providers_latitude'] = this.smzbpProvidersLatitude;
    data['smzbp_providers_longitude'] = this.smzbpProvidersLongitude;
    data['zen_book_packages_id'] = this.zenBookPackagesId;
    data['instructor'] = this.instructor;
    data['about_us'] = this.aboutUs;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['status'] = this.status;
    data['date_time'] = this.dateTime;
    if (this.dates != null) {
      data['dates'] = this.dates!.map((v) => v.toJson()).toList();
    }
    data['rating'] = this.rating;
    return data;
  }
}

class Dates {
  String? smzbpdDateId;
  String? smzbpdDateSmzbpProviderId;
  String? smzbpdDateAvailableDates;
  List<DatesTimes>? datesTimes;

  Dates(
      {this.smzbpdDateId,
        this.smzbpdDateSmzbpProviderId,
        this.smzbpdDateAvailableDates,
        this.datesTimes});

  Dates.fromJson(Map<String, dynamic> json) {
    smzbpdDateId = json['smzbpd_date_id'];
    smzbpdDateSmzbpProviderId = json['smzbpd_date_smzbp_provider_id'];
    smzbpdDateAvailableDates = json['smzbpd_date_available_dates'];
    if (json['dates_times'] != null) {
      datesTimes = <DatesTimes>[];
      json['dates_times'].forEach((v) {
        datesTimes!.add(new DatesTimes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smzbpd_date_id'] = this.smzbpdDateId;
    data['smzbpd_date_smzbp_provider_id'] = this.smzbpdDateSmzbpProviderId;
    data['smzbpd_date_available_dates'] = this.smzbpdDateAvailableDates;
    if (this.datesTimes != null) {
      data['dates_times'] = this.datesTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DatesTimes {
  String? smzbpdtId;
  String? smzbpdtSmpzbpdDateId;
  String? smzbpdtTime;

  DatesTimes({this.smzbpdtId, this.smzbpdtSmpzbpdDateId, this.smzbpdtTime});

  DatesTimes.fromJson(Map<String, dynamic> json) {
    smzbpdtId = json['smzbpdt_id'];
    smzbpdtSmpzbpdDateId = json['smzbpdt_smpzbpd_date_id'];
    smzbpdtTime = json['smzbpdt_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smzbpdt_id'] = this.smzbpdtId;
    data['smzbpdt_smpzbpd_date_id'] = this.smzbpdtSmpzbpdDateId;
    data['smzbpdt_time'] = this.smzbpdtTime;
    return data;
  }
}