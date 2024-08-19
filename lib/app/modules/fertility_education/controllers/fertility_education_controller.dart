import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:get/get.dart';

class FertilityEducationController extends GetxController {
  final count = 0.obs;

  List listOfCards = [
    StringConstants.blog,
    StringConstants.webinars,
    StringConstants.ebooks,
  ];

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

  clickOnCard({required int index}) {}
}
