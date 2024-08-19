import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:get/get.dart';

class GetExpertController extends GetxController {
  final count = 0.obs;

  List listOfListTileTitlesImages = [
    {
      'title': StringConstants.findDoctors,
      'subTitle': StringConstants.bookAppointments,
      'icon': IconConstants.icFindDoctors
    },
    {
      'title': StringConstants.nutritionGuidance,
      'subTitle': StringConstants.getAPersonalizedDietPlan,
      'icon': IconConstants.icNutritionGuidance
    },
    {
      'title': StringConstants.personalTraining,
      'subTitle': StringConstants.stayFitAndHealthy,
      'icon': IconConstants.icPersonalTraining
    },
    {
      'title': StringConstants.mentalHealthConsultant,
      'subTitle': StringConstants.staySane,
      'icon': IconConstants.icMentalHealthConsultant
    }
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

  clickOnListTile({required int index}) {
    selectedCard.value = index;
  }

  clickOnGetStartedButton() {
    Map<String, String> parameters = {ApiKeyConstants.id: ''};
    Get.toNamed(Routes.FERTILITY_SPECIALIST, parameters: parameters);
    /*if (selectedCard.value == 0) {
      Get.toNamed(Routes.FERTILITY_SPECIALIST);
    } else {
      CommonWidgets.snackBarView(title: StringConstants.comingSoon);
    }*/
  }
}
