import 'package:get/get.dart';

import '../controllers/tel_doc_client_detail_controller.dart';

class TelDocClientDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TelDocClientDetailController>(
      () => TelDocClientDetailController(),
    );
  }
}
