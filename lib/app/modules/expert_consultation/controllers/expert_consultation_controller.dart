import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/expert_consultation_get_expert_consultation_categories_model.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';

class ExpertConsultationController extends GetxController {
  final count = 0.obs;

  final selectedCard = 0.obs;

  ExpertConsultationGetExpertConsultationCategoriesModel?
      expertConsultationGetExpertConsultationCategoriesModel;
  List<Result> result = [];

  final inAsyncCall = false.obs;
  SharedPreferences? sharedPreferences;

  @override
  Future<void> onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
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
    selectedCard.value = index;
  }

  clickOnNextButton() async {
    await sharedPreferences?.setString(StringConstants.expertConsultation,
        result[selectedCard.value].expertConsultationCategoriesName.toString());
    await sharedPreferences?.setString(
        ApiKeyConstants.expertConsultationCategoriesId,
        result[selectedCard.value].expertConsultationCategoriesId.toString());
    switch (selectedCard.value) {
      case 0 || 1:
        Get.toNamed(Routes.EXPERT_CONSULTATION_WELL_COME);
      case 2 || 3:
        Get.toNamed(Routes.PERSONAL_TRAINER);
    }
  }

  Future<void> onInitWork() async {
    await expertConsultationGetExpertConsultationCategoriesApi();
  }

  Future<void> expertConsultationGetExpertConsultationCategoriesApi() async {
    expertConsultationGetExpertConsultationCategoriesModel =
        await ApiMethods.expertConsultationGetExpertConsultationCategories();
    if (expertConsultationGetExpertConsultationCategoriesModel != null &&
        expertConsultationGetExpertConsultationCategoriesModel!.result !=
            null &&
        expertConsultationGetExpertConsultationCategoriesModel!
            .result!.isNotEmpty) {
      result = expertConsultationGetExpertConsultationCategoriesModel!.result!;
    }
  }
}
