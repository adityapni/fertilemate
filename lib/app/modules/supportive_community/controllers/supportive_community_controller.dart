import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SupportiveCommunityController extends GetxController {
  final count = 0.obs;

  List listOfCardTitle = [
    {'title': StringConstants.forum, 'icon': IconConstants.icAskQuestion},
    {'title': StringConstants.learnFrom, 'icon': IconConstants.icLearnForm},
    // {'title': StringConstants.getExpert, 'icon': IconConstants.icGetExpert},
    {'title': StringConstants.findPeace, 'icon': IconConstants.icFindOPeaceAnd},
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
    selectedCard.value = index;
    switch (index) {
      case 0:
        Get.toNamed(Routes.FORUM_TOPICS);
      case 1:
        Get.toNamed(Routes.LEARN_FROM);
      /*case 2:
        Get.toNamed(Routes.GET_EXPERT);*/
      case 2:
        Get.toNamed(Routes.FIND_PEACE);
    }
  }

  clickOnJoinNowButton() {
    Get.toNamed(Routes.FORUM_TOPICS);
  }
}
