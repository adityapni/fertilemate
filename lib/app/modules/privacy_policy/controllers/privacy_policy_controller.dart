import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/privacy_policy_model.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_url_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class PrivacyPolicyController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  final title = ''.obs;
  Data? data;

  PrivacyPolicyModel? privacyPolicyModel;

  Map<String, String?> parameters = Get.parameters;

  @override
  Future<void> onInit() async {
    title.value = parameters[ApiKeyConstants.title] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await privacyPolicyApi();
    inAsyncCall.value = false;
  }

  Future<void> privacyPolicyApi() async {
    privacyPolicyModel = await ApiMethods.privacyPolicy(
        endPoint: ApiKeyConstants.privacyPolicy == title.value
            ? ApiUrlConstants.endPointOfPrivacyPolicy
            : ApiUrlConstants.endPointOfTermsAndConditions);
    if (privacyPolicyModel != null && privacyPolicyModel!.data != null) {
      data = privacyPolicyModel!.data!;
    }
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
}
