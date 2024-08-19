import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';

class BloodReportController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  String? document;

  @override
  Future<void> onInit() async {
    document = parameters[ApiKeyConstants.document] ?? '';
    super.onInit();
    print('document::::::${document}');
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

  clickOnDownloadButton() {}

}
