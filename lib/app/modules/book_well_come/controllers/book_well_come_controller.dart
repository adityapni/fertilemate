import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/sleep_management_zen_book_get_zen_book_packages_model.dart';
import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';

class BookWellComeController extends GetxController {
  final count = 0.obs;

  // List listOfCards = [
  //   {
  //     'title': StringConstants.yogaAndMindfulness,
  //     'subtitle': StringConstants.findBalanceAndInnerPeace,
  //     'icon': IconConstants.icYogaAndMindfulness,
  //   },
  //   {
  //     'title': StringConstants.zumbaAndDance,
  //     'subtitle': StringConstants.haveFunAndGetEnergized,
  //     'icon': IconConstants.icZumbaDance,
  //   },
  //   {
  //     'title': StringConstants.pilatesAndStrength,
  //     'subtitle': StringConstants.strengthenYourCoreAndImprove,
  //     'icon': IconConstants.icPilatesStrength,
  //   },
  //   {
  //     'title': StringConstants.spaPackage,
  //     'subtitle': StringConstants.relaxingYourBodyAndMind,
  //     'icon': IconConstants.icPilatesStrength,
  //   },
  // ];

  SleepManagementZenBookGetZenBookPackagesModel?
      sleepManagementZenBookGetZenBookPackagesModel;
  List<Result> result = [];

  final inAsyncCall = false.obs;

  final selectedValue = 1000.obs;

  String zmzbpId = '';

  @override
  Future<void> onInit() async {
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

  clickOnCard({required int index}) {
    selectedValue.value = index;
    zmzbpId = result[index].zmzbpId.toString();
    increment();
  }

  clickOnGetStartButton() {
    Map<String, String> parameters = {ApiKeyConstants.id: zmzbpId};
    Get.toNamed(Routes.BOOK_DASHBOARD, parameters: parameters);
  }

  Future<void> onInitWork() async {
    await sleepManagementZenBookGetZenBookPackagesApi();
  }

  Future<void> sleepManagementZenBookGetZenBookPackagesApi() async {
    sleepManagementZenBookGetZenBookPackagesModel =
        await ApiMethods.sleepManagementZenBookGetZenBookPackages();
    if (sleepManagementZenBookGetZenBookPackagesModel != null &&
        sleepManagementZenBookGetZenBookPackagesModel!.result != null &&
        sleepManagementZenBookGetZenBookPackagesModel!.result!.isNotEmpty) {
      result = sleepManagementZenBookGetZenBookPackagesModel!.result!;
    }
  }
}
