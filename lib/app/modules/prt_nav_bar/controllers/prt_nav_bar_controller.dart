import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PrtNavBarController extends GetxController {
  final count = 0.obs;

  List listOfCardTitle = [
    {'title': 'Doctor And Mental Doctor', 'image': ImageConstants.imageDoctors},
    {'title': 'Trainer And Nutrition', 'image': ImageConstants.imageTrainer},
    {'title': 'Laboratories', 'image': ImageConstants.imageLaboratories},
  ];

  final selectedCard = 0.obs;

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

  clickOnCard({required int index}) {
    Get.toNamed(Routes.PRT_LOGIN,
        parameters: {ApiKeyConstants.type: getType(index: index)});
  }

  getType({required index}) {
    switch (index) {
      case 0:
        return ApiKeyConstants.doctor;
      case 1:
        return ApiKeyConstants.trainer;
      default:
        return ApiKeyConstants.lab;
    }
  }
}
