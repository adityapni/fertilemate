class ChatsModel {
  List<Chat>? chat;
  String? message;
  String? status;

  ChatsModel({this.chat, this.message, this.status});

  ChatsModel.fromJson(Map<String, dynamic> json) {
    if (json['chat'] != null) {
      chat = <Chat>[];
      json['chat'].forEach((v) {
        chat!.add(Chat.fromJson(v));
      });
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chat != null) {
      data['chat'] = chat!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class Chat {
  String? otherUserId;
  String? latestDate;
  String? latestMessage;
  UserData? userData;

  Chat({this.otherUserId, this.latestDate, this.latestMessage, this.userData});

  Chat.fromJson(Map<String, dynamic> json) {
    otherUserId = json['other_user_id'];
    latestDate = json['latest_date'];
    latestMessage = json['latest_message'];
    userData =
        json['user_data'] != null ? UserData.fromJson(json['user_data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['other_user_id'] = otherUserId;
    data['latest_date'] = latestDate;
    data['latest_message'] = latestMessage;
    if (userData != null) {
      data['user_data'] = userData!.toJson();
    }
    return data;
  }
}

class UserData {
  String? id;
  String? userName;
  String? companyName;
  String? mobile;
  String? gender;
  String? dob;
  String? image;
  String? email;
  String? otp;
  String? password;
  String? createdAt;
  String? updatedAt;

  UserData(
      {this.id,
      this.userName,
      this.companyName,
      this.mobile,
      this.gender,
      this.dob,
      this.image,
      this.email,
      this.otp,
      this.password,
      this.createdAt,
      this.updatedAt});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    companyName = json['company_name'];
    mobile = json['mobile'];
    gender = json['gender'];
    dob = json['dob'];
    image = json['image'];
    email = json['email'];
    otp = json['otp'];
    password = json['password'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['company_name'] = companyName;
    data['mobile'] = mobile;
    data['gender'] = gender;
    data['dob'] = dob;
    data['image'] = image;
    data['email'] = email;
    data['otp'] = otp;
    data['password'] = password;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
