class AvailableTestsModel {
  List<AvailableTest>? availableTest;
  String? message;
  String? status;

  AvailableTestsModel({this.availableTest, this.message, this.status});

  AvailableTestsModel.fromJson(Map<String, dynamic> json) {
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
      data['available_test'] =
          availableTest!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class AvailableTest {
  String? testId;
  String? testName;
  String? testImage;
  String? testStatus;
  String? testTags;

  AvailableTest(
      {this.testId,
        this.testName,
        this.testImage,
        this.testStatus,
        this.testTags});

  AvailableTest.fromJson(Map<String, dynamic> json) {
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
