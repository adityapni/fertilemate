import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PersonalTrainerChatController extends GetxController {

  final count = 0.obs;

  TextEditingController textController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
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
}
