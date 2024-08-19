import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/constants/string_constants.dart';

class PersonalTrainerFillOutYourDetailsController extends GetxController {
  final count = 0.obs;

  final selectedTabs = [].obs;

  List listOfTime = [
    'Physical',
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();


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

  clickOnPayNowButton() {
    Map<String, String> parameter = {
      ApiKeyConstants.clinicId: '',
      ApiKeyConstants.testId: '',
      ApiKeyConstants.doctorId: "",
      ApiKeyConstants.bookingType: "zen_book",
      ApiKeyConstants.consultantfee: '',
      ApiKeyConstants.title: 'Book your personal training session',
      ApiKeyConstants.subTitle: 'Certified trainers',
      ApiKeyConstants.description: ''
    };
    Get.toNamed(Routes.BOOKING_BY_CALENDAR, parameters: parameter);
  }

  clickOnCard({required int index}) {
    if (selectedTabs.contains(listOfTime[index])) {
      selectedTabs.remove(listOfTime[index]);
    } else {
      selectedTabs.add(listOfTime[index]);
    }
    increment();
  }
}
