class AvailableClinicsGetAvailableClinicsByIdModel {
  Category? category;
  String? message;
  String? status;

  AvailableClinicsGetAvailableClinicsByIdModel(
      {this.category, this.message, this.status});

  AvailableClinicsGetAvailableClinicsByIdModel.fromJson(
      Map<String, dynamic> json) {
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Category {
  String? clinicId;
  String? clinicName;
  String? clinicImage;
  String? clinicAddress;
  String? clinicMonday;
  String? clinicTuesday;
  String? clinicWednesday;
  String? clinicThursday;
  String? clinicFriday;
  String? clinicSaturday;
  String? clinicSunday;
  String? serviceAddress;
  String? spermConcentration;
  String? spermCount;
  String? consultan;
  String? status;
  List<Package>? package;

  Category(
      {this.clinicId,
      this.clinicName,
      this.clinicImage,
      this.clinicAddress,
      this.clinicMonday,
      this.clinicTuesday,
      this.clinicWednesday,
      this.clinicThursday,
      this.clinicFriday,
      this.clinicSaturday,
      this.clinicSunday,
      this.serviceAddress,
      this.spermConcentration,
      this.spermCount,
      this.consultan,
      this.status,
      this.package});

  Category.fromJson(Map<String, dynamic> json) {
    clinicId = json['clinic_id'];
    clinicName = json['clinic_name'];
    clinicImage = json['clinic_image'];
    clinicAddress = json['clinic_address'];
    clinicMonday = json['clinic_monday'];
    clinicTuesday = json['clinic_tuesday'];
    clinicWednesday = json['clinic_wednesday'];
    clinicThursday = json['clinic_thursday'];
    clinicFriday = json['clinic_friday'];
    clinicSaturday = json['clinic_saturday'];
    clinicSunday = json['clinic_sunday'];
    serviceAddress = json['service_address'];
    spermConcentration = json['sperm_concentration'];
    spermCount = json['sperm_count'];
    consultan = json['consultan'];
    status = json['status'];
    if (json['package'] != null) {
      package = <Package>[];
      json['package'].forEach((v) {
        package!.add(Package.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clinic_id'] = clinicId;
    data['clinic_name'] = clinicName;
    data['clinic_image'] = clinicImage;
    data['clinic_address'] = clinicAddress;
    data['clinic_monday'] = clinicMonday;
    data['clinic_tuesday'] = clinicTuesday;
    data['clinic_wednesday'] = clinicWednesday;
    data['clinic_thursday'] = clinicThursday;
    data['clinic_friday'] = clinicFriday;
    data['clinic_saturday'] = clinicSaturday;
    data['clinic_sunday'] = clinicSunday;
    data['service_address'] = serviceAddress;
    data['sperm_concentration'] = spermConcentration;
    data['sperm_count'] = spermCount;
    data['consultan'] = consultan;
    data['status'] = status;
    if (package != null) {
      data['package'] = package!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Package {
  String? testName;
  String? mrp;
  String? id;

  Package({this.testName, this.mrp, this.id});

  Package.fromJson(Map<String, dynamic> json) {
    testName = json['test_name'];
    mrp = json['mrp'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['test_name'] = testName;
    data['mrp'] = mrp;
    data['id'] = id;
    return data;
  }
}
