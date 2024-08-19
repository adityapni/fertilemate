import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_supportive_peace_by_id_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class FindPeaceDetailTwoController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  GetSupportivePeaceByIdModel? getSupportivePeaceByIdModel;
  String id = '';
  String title = '';

  Map<String, String> parameters = {};

  Result? result;

  @override
  Future<void> onInit() async {
    id = Get.parameters[ApiKeyConstants.id] ?? '';
    title = Get.parameters[ApiKeyConstants.title] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getClinicDetail();
    inAsyncCall.value = false;
  }

  getClinicDetail() async {
    getSupportivePeaceByIdModel =
        await ApiMethods.getSupportivePeaceById(queryParameters: {
      ApiKeyConstants.id: Get.parameters[ApiKeyConstants.id],
      ApiKeyConstants.peaceSubCategoryId:
          Get.parameters[ApiKeyConstants.peaceSubCategoryId],
    });
    if (getSupportivePeaceByIdModel != null &&
        getSupportivePeaceByIdModel!.result != null) {
      result = getSupportivePeaceByIdModel!.result!;
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

  clickOnMakeReservation() {
    parameters = {
      ApiKeyConstants.bookingType: ApiKeyConstants.tvsScan,
      ApiKeyConstants.id: id,
      ApiKeyConstants.title: title,
      ApiKeyConstants.subTitle: StringConstants.packagePremium,
      ApiKeyConstants.description: result?.address ?? '',
      ApiKeyConstants.consultantfee: result?.fees ?? '',
    };
    Get.toNamed(Routes.BOOKING_BY_CALENDAR, parameters: parameters);
  }

  clickOnBackIcon() {
    Get.back();
  }
}
