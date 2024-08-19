class QuizResultModel {
  int? one;
  int? two;
  int? three;
  int? four;
  String? message;
  String? status;

  QuizResultModel(
      {this.one, this.two, this.three, this.four, this.message, this.status});

  QuizResultModel.fromJson(Map<String, dynamic> json) {
    one = json['one'];
    two = json['two'];
    three = json['three'];
    four = json['four'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['one'] = one;
    data['two'] = two;
    data['three'] = three;
    data['four'] = four;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
