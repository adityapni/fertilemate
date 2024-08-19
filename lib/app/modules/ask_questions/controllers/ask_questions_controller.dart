import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/chats_model.dart';

class AskQuestionsController extends GetxController {
  final count = 0.obs;

  final selectedCard = 0.obs;
  final inAsyncCall = false.obs;
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String title = '';

  ChatsModel? chatsModel;
  List<Chat> chat = [];

  TextEditingController searchController = TextEditingController();

  String userId = '';

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId)!;
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
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

  clickOnCard() {}

  clickOnFilterButton() {}

  clickOnListTile({required int index}) async {
    Map<String, String> parameter = {
      ApiKeyConstants.otherUserId: chat[index].otherUserId.toString(),
      ApiKeyConstants.userName: chat[index].userData != null
          ? chat[index].userData!.userName.toString()
          : ''
    };
    await Get.toNamed(Routes.CHAT, parameters: parameter);
    await onInit();
  }

  Future<void> onInitWork() async {
    await chatsApi();
  }

  Future<void> chatsApi() async {
    chatsModel = await ApiMethods.chats();
    if (chatsModel != null &&
        chatsModel!.chat != null &&
        chatsModel!.chat!.isNotEmpty) {
      chat = chatsModel!.chat!;
    }
  }
}
