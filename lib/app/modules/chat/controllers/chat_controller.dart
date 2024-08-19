import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_methods.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../common/common_widgets.dart';
import '../../../../common/image_pick_and_crop.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/chats_chat_between_user_model.dart';
import 'package:http/http.dart' as http;

import '../../../data/constants/icons_constant.dart';

class ChatController extends GetxController {
  final count = 0.obs;

  TextEditingController textController = TextEditingController();
  Map<String, String?> parameters = Get.parameters;
  String otherUserId = '';
  String userId = '';
  String userName = '';
  String lastMessage = '';

  final inAsyncCall = false.obs;
  final buttonValue = false.obs;

  ChatsChatBetweenUserModel? chatsChatBetweenUserModel;
  List<Chat> chat = [];
  Map<String, dynamic> bodyParams = {};

  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;
  final progress = 0.0.obs;

  var listMessages;

  ScrollController scrollController = ScrollController();
  final image = Rxn<File?>();
  final imageUrl = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ??'';
    otherUserId = parameters[ApiKeyConstants.otherUserId] ??'';
    userName = parameters[ApiKeyConstants.userName] ??'';
    super.onInit();
    inAsyncCall.value = true;
    // await onInitWork();
    inAsyncCall.value = false;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> onInitWork() async {
    await chatsChatBetweenUserApi();
  }

  Future<void> chatsChatBetweenUserApi() async {
    bodyParams = {
      ApiKeyConstants.otherUserId: otherUserId.toString(),
      ApiKeyConstants.userId: userId.toString(),
    };
    chatsChatBetweenUserModel = await ApiMethods.chatsChatBetweenUser(
        bodyParams: bodyParams, wantSnackBar: false);
    if (chatsChatBetweenUserModel != null &&
        chatsChatBetweenUserModel!.chat != null &&
        chatsChatBetweenUserModel!.chat!.isNotEmpty) {
      chat = chatsChatBetweenUserModel!.chat!;
      increment();
    }
  }

  clickOnSendButton() async {
    if (image.value == null && textController.text.trim().isNotEmpty) {
      chatsApi();
      // buttonValue.value = true;
      String valueController = textController.text.trim().toString();
      textController.clear();
      Map<String, dynamic> message = {
        StringConstants.chatId: userId.toString(),
        StringConstants.chatMessage: valueController.toString(),
        StringConstants.chatCreatedAt: FieldValue.serverTimestamp(),
        StringConstants.sentBy: userId.toString(),
        StringConstants.chatType: StringConstants.chatText,
        StringConstants.chatImage: '',
      };
      await firebaseFireStore
          .collection(StringConstants.chatRoom)
          .doc(getChatId(userId, otherUserId))
          .collection(StringConstants.chats)
          .add(message);
      jump();
      // buttonValue.value = false;
    } else if (image.value != null) {
      // await chatsApi();
      buttonValue.value = true;
      Reference reference = FirebaseStorage.instance
          .ref()
          .child(StringConstants.chatImage)
          .child("image${DateTime.timestamp()}.jpg");
      UploadTask uploadTask = reference.putFile(image.value ?? File(''));
      uploadTask.snapshotEvents.listen((event) {
        progress.value =
            event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
        progress.value = (progress.value * 100).toDouble();
      }).onError((error) {
        print("error::::::::::::::::::::$error");
      });
      await uploadTask.whenComplete(() async {
        print(
            " uploadTask.snapshot.ref.getDownloadURL() ${uploadTask.snapshot.ref.getDownloadURL()}");
        imageUrl.value = await uploadTask.snapshot.ref.getDownloadURL();
        String valueController = textController.text.trim().toString();
        textController.clear();
        Map<String, dynamic> message = {
          StringConstants.chatId: userId.toString(),
          StringConstants.chatMessage: valueController.toString(),
          StringConstants.chatCreatedAt: FieldValue.serverTimestamp(),
          StringConstants.sentBy: userId.toString(),
          StringConstants.chatType: StringConstants.chatText,
          StringConstants.chatImage: imageUrl.value,
        };
        await firebaseFireStore
            .collection(StringConstants.chatRoom)
            .doc(getChatId(userId, otherUserId))
            .collection(StringConstants.chats)
            .add(message);
        jump();
        imageUrl.value = '';
        image.value = null;
        valueController = '';
        Get.back();
      });

      buttonValue.value = false;
    } else {
      CommonWidgets.snackBarView(title: 'Nothing to send');
    }
  }

  uploadImage() async {
    Reference reference = FirebaseStorage.instance
        .ref()
        .child(StringConstants.chatImage)
        .child("image${DateTime.timestamp()}.jpg");
    UploadTask uploadTask = reference.putFile(image.value ?? File(''));
    uploadTask.snapshotEvents.listen((event) {
      progress.value =
          event.bytesTransferred.toDouble() / event.totalBytes.toDouble();
      progress.value = (progress.value * 100).toDouble();
    }).onError((error) {
      print("error::::::::::::::::::::$error");
    });
    await uploadTask.whenComplete(() async {
      print(
          " uploadTask.snapshot.ref.getDownloadURL() ${uploadTask.snapshot.ref.getDownloadURL()}");
      imageUrl.value = await uploadTask.snapshot.ref.getDownloadURL();
    });
  }

  String getChatId(String senderId, String userId) {
    if (int.parse(senderId) == int.parse(userId)) {
      return userId;
    } else if (int.parse(senderId) > int.parse(userId)) {
      return "${userId}_to_$senderId";
    } else {
      return "${senderId}_to_$userId";
    }
  }

  Future<void> chatsApi() async {
    bodyParams = {
      ApiKeyConstants.senderId: userId.toString(),
      ApiKeyConstants.receiverId: otherUserId.toString(),
      ApiKeyConstants.message: textController.text.trim().toString(),
    };
    http.Response? response = await ApiMethods.insertChats(
        bodyParams: bodyParams, wantSnackBar: false);
    if (response != null && response.statusCode == 200) {
      // await onInitWork();
    }
  }

  String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }
    if (dayNum >= 10) {
      return '$dayNum';
    } else {
      return '0$dayNum';
    }
  }

  String getMonthOfYearSuffix(int monthNum) {
    if (!(monthNum >= 1 && monthNum <= 12)) {
      throw Exception('Invalid month of Year');
    }

    if (monthNum >= 10) {
      return '$monthNum';
    }

    switch (monthNum % 10) {
      case 1:
        return '0$monthNum';
      case 2:
        return '0$monthNum';
      case 3:
        return '0$monthNum';
      default:
        return '0$monthNum';
    }
  }

  clickOnBackButton() async {
    //chatsApi();
    Get.back();
  }

  jump() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
  }

  clickOnAttachmentButton() {
    pickGallery();
  }

  Future<void> pickGallery() async {
    CommonMethods.unFocsKeyBoard();
    image.value = await ImagePickerAndCropper.pickImage(
        context: Get.context!,
        wantCropper: true,
        color: Theme.of(Get.context!).primaryColor,
        pickImageFromGallery: true);
    if (image.value != null) {
      showModalBottomSheet(
        isDismissible: false,
        isScrollControlled: true,
        context: Get.context!,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(14.px),
            topLeft: Radius.circular(14.px),
          ),
        ),
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.all(16.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Image View',
                            style: Theme.of(Get.context!)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(Get.context!).primaryColor),
                          ),
                          GestureDetector(
                            onTap: () {
                              imageUrl.value = '';
                              image.value = null;
                              textController.clear;
                              Get.back();
                            },
                            child: Icon(
                              Icons.close,
                              color: Theme.of(Get.context!).primaryColor,
                              size: 24.px,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.px),
                      Container(
                        height: 100.px,
                        width: 100.px,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(10.px),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.px),
                          child: Image.file(image.value ?? File(''),
                              height: 80.px, fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: textController,
                        // onFieldSubmitted: (value) => controller.clickOnSendButton(),
                        borderRadius: 30.px,
                        // onTap: () => controller.jump(),
                        fillColor: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.2),
                        hintText: StringConstants.typeHere,
                        suffixIcon: Padding(
                          padding: EdgeInsets.all(8.px),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              /* GestureDetector(
                                onTap: () => clickOnAttachmentButton(),
                                child: Image.asset(
                                  IconConstants.icAttachment,
                                  height: 34.px,
                                  width: 34.px,
                                ),
                              ),*/
                              Obx(() {
                                count.value;
                                return buttonValue.value
                                    ? SizedBox(
                                        height: 24.px,
                                        width: 24.px,
                                        child:
                                            const CircularProgressIndicator())
                                    : InkWell(
                                        borderRadius:
                                            BorderRadius.circular(18.px),
                                        onTap: () => clickOnSendButton(),
                                        child: Image.asset(
                                          IconConstants.icSend,
                                          height: 34.px,
                                          width: 34.px,
                                        ),
                                      );
                              })
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ).whenComplete(() {
        imageUrl.value = '';
        image.value = null;
        textController.clear;
      });
    }
    increment();
  }
}
