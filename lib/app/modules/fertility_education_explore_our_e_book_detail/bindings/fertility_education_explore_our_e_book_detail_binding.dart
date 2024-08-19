import 'package:get/get.dart';

import '../controllers/fertility_education_explore_our_e_book_detail_controller.dart';

class FertilityEducationExploreOurEBookDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FertilityEducationExploreOurEBookDetailController>(
      () => FertilityEducationExploreOurEBookDetailController(),
    );
  }
}
