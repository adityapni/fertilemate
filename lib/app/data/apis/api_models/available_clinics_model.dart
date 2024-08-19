class AvailableClinicsModel {
  List<AvailableTest>? availableTest;
  String? message;
  String? status;

  AvailableClinicsModel({this.availableTest, this.message, this.status});

  AvailableClinicsModel.fromJson(Map<String, dynamic> json) {
    if (json['available_test'] != null) {
      availableTest = <AvailableTest>[];
      json['available_test'].forEach((v) {
        availableTest!.add(AvailableTest.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (availableTest != null) {
      data['available_test'] = availableTest!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class AvailableTest {
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

  AvailableTest(
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

  AvailableTest.fromJson(Map<String, dynamic> json) {
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
