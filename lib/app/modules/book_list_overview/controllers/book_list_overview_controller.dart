import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/sleep_management_zen_book_get_zen_book_providers_by_id.dart';

class BookListOverviewController extends GetxController {
  final count = 0.obs;

  String smzbpProvidersId = '';
  Map<String, dynamic> parameters = Get.parameters;
  final inAsyncCall = false.obs;

  SleepManagementZenBookGetZenBookProvidersByIdModel?
      sleepManagementZenBookGetZenBookProvidersByIdModel;

  Result? result;

  Map<String, String> parameter = {};

  @override
  Future<void> onInit() async {
    smzbpProvidersId = parameters[ApiKeyConstants.smzbpProvidersId] ?? '';
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

  Future<void> onInitWork() async {
    await sleepManagementZenBookGetZenBookProvidersByIdApi();
  }

  clickOnSelectDateButton() {
     parameter = {
      ApiKeyConstants.trainerId: smzbpProvidersId ?? '',
      ApiKeyConstants.bookingType: ApiKeyConstants.zenBook,
      ApiKeyConstants.consultantfee: result?.price ?? '',
      ApiKeyConstants.title: StringConstants.bookYourClass,
      ApiKeyConstants.description: 'Zen Yoga',
    };
    Get.toNamed(Routes.BOOKING_BY_CALENDAR, parameters: parameter);
  }

  Future<void> sleepManagementZenBookGetZenBookProvidersByIdApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.smzbpProvidersId: smzbpProvidersId.toString(),
    };
    sleepManagementZenBookGetZenBookProvidersByIdModel =
        await ApiMethods.sleepManagementZenBookGetZenBookProvidersById(
            queryParameters: queryParameters);
    if (sleepManagementZenBookGetZenBookProvidersByIdModel != null &&
        sleepManagementZenBookGetZenBookProvidersByIdModel!.result != null) {
      result = sleepManagementZenBookGetZenBookProvidersByIdModel!.result!;
    }
  }
}
