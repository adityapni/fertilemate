class ChatsChatBetweenUserModel {
  List<Chat>? chat;
  String? userName;
  String? userImage;
  String? otherUserName;
  String? otherUserImage;
  String? message;
  String? status;
  String? chatSenderId;
  String? chatReceiverId;

  ChatsChatBetweenUserModel(
      {this.chat,
        this.userName,
        this.userImage,
        this.otherUserName,
        this.otherUserImage,
        this.message,
        this.status,
        this.chatSenderId,
        this.chatReceiverId,});

  ChatsChatBetweenUserModel.fromJson(Map<String, dynamic> json) {
    if (json['chat'] != null) {
      chat = <Chat>[];
      json['chat'].forEach((v) {
        chat!.add(Chat.fromJson(v));
      });
    }
    userName = json['user_name'];
    userImage = json['user_image'];
    otherUserName = json['other_user_name'];
    otherUserImage = json['other_user_image'];
    message = json['message'];
    status = json['status'];
    chatSenderId = json['chat_sender_id'];
    chatReceiverId = json['chat_receiver_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (chat != null) {
      data['chat'] = chat!.map((v) => v.toJson()).toList();
    }
    data['user_name'] = userName;
    data['user_image'] = userImage;
    data['other_user_name'] = otherUserName;
    data['other_user_image'] = otherUserImage;
    data['message'] = message;
    data['status'] = status;
    data['chat_sender_id'] = chatSenderId;
    data['chat_receiver_id'] = chatReceiverId;
    return data;
  }
}

class Chat {
  String? chatId;
  String? chatMessage;
  String? chatCreatedAt;
  String? sentBy;

  Chat(
      {this.chatId,
        this.chatMessage,
        this.chatCreatedAt,
        this.sentBy});

  Chat.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    chatMessage = json['chat_message'];
    chatCreatedAt = json['chat_created_at'];
    sentBy = json['sent_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chat_id'] = chatId;
    data['chat_message'] = chatMessage;
    data['chat_created_at'] = chatCreatedAt;
    data['sent_by'] = sentBy;
    return data;
  }
}
