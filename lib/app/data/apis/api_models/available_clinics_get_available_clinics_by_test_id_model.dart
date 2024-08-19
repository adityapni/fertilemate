class AvailableClinicsGetAvailableClinicsByTestIdModel {
  List<Category>? category;
  String? message;
  String? status;

  AvailableClinicsGetAvailableClinicsByTestIdModel(
      {this.category, this.message, this.status});

  AvailableClinicsGetAvailableClinicsByTestIdModel.fromJson(
      Map<String, dynamic> json) {
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(Category.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Category {
  String? ctId;
  String? ctClinicId;
  String? ctTestId;
  ClinicData? clinicData;
  ClinicTest? clinicTest;

  Category(
      {this.ctId,
      this.ctClinicId,
      this.ctTestId,
      this.clinicData,
      this.clinicTest});

  Category.fromJson(Map<String, dynamic> json) {
    ctId = json['ct_id'];
    ctClinicId = json['ct_clinic_id'];
    ctTestId = json['ct_test_id'];
    clinicData = json['clinic_data'] != null
        ? ClinicData.fromJson(json['clinic_data'])
        : null;
    clinicTest = json['clinic_test'] != null
        ? ClinicTest.fromJson(json['clinic_test'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ct_id'] = ctId;
    data['ct_clinic_id'] = ctClinicId;
    data['ct_test_id'] = ctTestId;
    if (clinicData != null) {
      data['clinic_data'] = clinicData!.toJson();
    }
    if (clinicTest != null) {
      data['clinic_test'] = clinicTest!.toJson();
    }
    return data;
  }
}

class ClinicData {
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

  ClinicData(
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
      this.clinicSunday});

  ClinicData.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class ClinicTest {
  String? testId;
  String? testName;
  String? testImage;
  String? testStatus;
  String? testTags;

  ClinicTest(
      {this.testId,
      this.testName,
      this.testImage,
      this.testStatus,
      this.testTags});

  ClinicTest.fromJson(Map<String, dynamic> json) {
    testId = json['test_id'];
    testName = json['test_name'];
    testImage = json['test_image'];
    testStatus = json['test_status'];
    testTags = json['test_tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['test_id'] = testId;
    data['test_name'] = testName;
    data['test_image'] = testImage;
    data['test_status'] = testStatus;
    data['test_tags'] = testTags;
    return data;
  }
}
