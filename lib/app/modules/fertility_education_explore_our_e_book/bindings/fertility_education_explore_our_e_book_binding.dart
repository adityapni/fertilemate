import 'package:get/get.dart';

import '../controllers/fertility_education_explore_our_e_book_controller.dart';

class FertilityEducationExploreOurEBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationExploreOurEBookController>(
      () => FertilityEducationExploreOurEBookController(),
    );
  }
}
