/// data : [{"feb_id":"1","feb_title":"Understanding Fertility Basics","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image1.jpg","feb_description":"Learn the fundamentals of fertility and reproductive health.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video1.mp4","feb_average_rating":"4.5","feb_reading_time":"10","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"},{"feb_id":"2","feb_title":"Optimizing Your Fertility Journey","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image2.jpg","feb_description":"Discover tips and strategies to enhance your fertility journey.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video2.mp4","feb_average_rating":"4.2","feb_reading_time":"15","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"},{"feb_id":"3","feb_title":"Fertility Myths Debunked","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image3.jpg","feb_description":"Unravel common misconceptions about fertility and conception.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video3.mp4","feb_average_rating":"4.8","feb_reading_time":"12","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"},{"feb_id":"4","feb_title":"Nutrition for Fertility","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image4.jpg","feb_description":"Explore the impact of nutrition on fertility and preconception health.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video4.mp4","feb_average_rating":"4.0","feb_reading_time":"20","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"},{"feb_id":"5","feb_title":"Exercise and Fertility","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image5.jpg","feb_description":"Learn about the role of physical activity in promoting fertility.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video5.mp4","feb_average_rating":"4.7","feb_reading_time":"18","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"},{"feb_id":"6","feb_title":"Stress Management for Fertility","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image6.jpg","feb_description":"Discover stress-reducing techniques to support your fertility journey.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video6.mp4","feb_average_rating":"4.3","feb_reading_time":"14","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"},{"feb_id":"7","feb_title":"Common Fertility Issues","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image7.jpg","feb_description":"Explore common challenges and solutions in the fertility process.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video7.mp4","feb_average_rating":"4.6","feb_reading_time":"16","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"},{"feb_id":"8","feb_title":"Fertility Treatments Overview","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image8.jpg","feb_description":"An overview of common fertility treatments and assisted reproductive technologies.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video8.mp4","feb_average_rating":"4.1","feb_reading_time":"22","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"},{"feb_id":"9","feb_title":"Male Fertility Factors","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image9.jpg","feb_description":"Understand the factors influencing male fertility and ways to address them.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video9.mp4","feb_average_rating":"4.9","feb_reading_time":"13","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"},{"feb_id":"10","feb_title":"Family Planning and Fertility","feb_image":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image10.jpg","feb_description":"Explore the intersection of family planning and fertility awareness.","feb_video":"https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video10.mp4","feb_average_rating":"4.4","feb_reading_time":"17","feb_type":"BLOG","feb_doctors_id":"1","feb_trainers_id":"0","feb_telehealths_id":"0","feb_labs_id":"0","feb_fec_category_id":"1"}]
/// message : "Blogs List Successfully"
/// status : "1"

class BlogByCategoryModel {
  BlogByCategory({
    List<Data>? data,
    String? message,
    String? status,
  }) {
    _data = data;
    _message = message;
    _status = status;
  }

  BlogByCategoryModel.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
    _message = json['message'];
    _status = json['status'];
  }
  List<Data>? _data;
  String? _message;
  String? _status;
  BlogByCategoryModel copyWith({
    List<Data>? data,
    String? message,
    String? status,
  }) =>
      BlogByCategory(
        data: data ?? _data,
        message: message ?? _message,
        status: status ?? _status,
      );
  List<Data>? get data => _data;
  String? get message => _message;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['message'] = _message;
    map['status'] = _status;
    return map;
  }
}

/// feb_id : "1"
/// feb_title : "Understanding Fertility Basics"
/// feb_image : "https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/image1.jpg"
/// feb_description : "Learn the fundamentals of fertility and reproductive health."
/// feb_video : "https://server-php-8-2.technorizen.com/nuru/public/uploads/fertility_educations/video1.mp4"
/// feb_average_rating : "4.5"
/// feb_reading_time : "10"
/// feb_type : "BLOG"
/// feb_doctors_id : "1"
/// feb_trainers_id : "0"
/// feb_telehealths_id : "0"
/// feb_labs_id : "0"
/// feb_fec_category_id : "1"

class Data {
  Data({
    String? febId,
    String? febTitle,
    String? febImage,
    String? febDescription,
    String? febShorDescription,
    String? febVideo,
    String? febAverageRating,
    String? febReadingTime,
    String? febType,
    String? febDoctorsId,
    String? febTrainersId,
    String? febTelehealthsId,
    String? febLabsId,
    String? febFecCategoryId,
  }) {
    _febId = febId;
    _febTitle = febTitle;
    _febImage = febImage;
    _febDescription = febDescription;
    _febShorDescription = febShorDescription;
    _febVideo = febVideo;
    _febAverageRating = febAverageRating;
    _febReadingTime = febReadingTime;
    _febType = febType;
    _febDoctorsId = febDoctorsId;
    _febTrainersId = febTrainersId;
    _febTelehealthsId = febTelehealthsId;
    _febLabsId = febLabsId;
    _febFecCategoryId = febFecCategoryId;
  }

  Data.fromJson(dynamic json) {
    _febId = json['feb_id'];
    _febTitle = json['feb_title'];
    _febImage = json['feb_image'];
    _febDescription = json['feb_description'];
    _febShorDescription = json['feb_shor_description'];
    _febVideo = json['feb_video'];
    _febAverageRating = json['feb_average_rating'];
    _febReadingTime = json['feb_reading_time'];
    _febType = json['feb_type'];
    _febDoctorsId = json['feb_doctors_id'];
    _febTrainersId = json['feb_trainers_id'];
    _febTelehealthsId = json['feb_telehealths_id'];
    _febLabsId = json['feb_labs_id'];
    _febFecCategoryId = json['feb_fec_category_id'];
  }
  String? _febId;
  String? _febTitle;
  String? _febImage;
  String? _febDescription;
  String? _febShorDescription;
  String? _febVideo;
  String? _febAverageRating;
  String? _febReadingTime;
  String? _febType;
  String? _febDoctorsId;
  String? _febTrainersId;
  String? _febTelehealthsId;
  String? _febLabsId;
  String? _febFecCategoryId;
  Data copyWith({
    String? febId,
    String? febTitle,
    String? febImage,
    String? febDescription,
    String? febShorDescription,
    String? febVideo,
    String? febAverageRating,
    String? febReadingTime,
    String? febType,
    String? febDoctorsId,
    String? febTrainersId,
    String? febTelehealthsId,
    String? febLabsId,
    String? febFecCategoryId,
  }) =>
      Data(
        febId: febId ?? _febId,
        febTitle: febTitle ?? _febTitle,
        febImage: febImage ?? _febImage,
        febDescription: febDescription ?? _febDescription,
        febShorDescription: febShorDescription ?? _febShorDescription,
        febVideo: febVideo ?? _febVideo,
        febAverageRating: febAverageRating ?? _febAverageRating,
        febReadingTime: febReadingTime ?? _febReadingTime,
        febType: febType ?? _febType,
        febDoctorsId: febDoctorsId ?? _febDoctorsId,
        febTrainersId: febTrainersId ?? _febTrainersId,
        febTelehealthsId: febTelehealthsId ?? _febTelehealthsId,
        febLabsId: febLabsId ?? _febLabsId,
        febFecCategoryId: febFecCategoryId ?? _febFecCategoryId,
      );
  String? get febId => _febId;
  String? get febTitle => _febTitle;
  String? get febImage => _febImage;
  String? get febDescription => _febDescription;
  String? get febShorDescription => _febShorDescription;
  String? get febVideo => _febVideo;
  String? get febAverageRating => _febAverageRating;
  String? get febReadingTime => _febReadingTime;
  String? get febType => _febType;
  String? get febDoctorsId => _febDoctorsId;
  String? get febTrainersId => _febTrainersId;
  String? get febTelehealthsId => _febTelehealthsId;
  String? get febLabsId => _febLabsId;
  String? get febFecCategoryId => _febFecCategoryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['feb_id'] = _febId;
    map['feb_title'] = _febTitle;
    map['feb_image'] = _febImage;
    map['feb_description'] = _febDescription;
    map['feb_shor_description'] = _febShorDescription;
    map['feb_video'] = _febVideo;
    map['feb_average_rating'] = _febAverageRating;
    map['feb_reading_time'] = _febReadingTime;
    map['feb_type'] = _febType;
    map['feb_doctors_id'] = _febDoctorsId;
    map['feb_trainers_id'] = _febTrainersId;
    map['feb_telehealths_id'] = _febTelehealthsId;
    map['feb_labs_id'] = _febLabsId;
    map['feb_fec_category_id'] = _febFecCategoryId;
    return map;
  }
}
