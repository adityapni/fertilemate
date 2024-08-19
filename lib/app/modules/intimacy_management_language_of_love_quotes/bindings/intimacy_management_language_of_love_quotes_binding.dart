import 'package:get/get.dart';

import '../controllers/intimacy_management_language_of_love_quotes_controller.dart';

class IntimacyManagementLanguageOfLoveQuotesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IntimacyManagementLanguageOfLoveQuotesController>(
      () => IntimacyManagementLanguageOfLoveQuotesController(),
    );
  }
}
