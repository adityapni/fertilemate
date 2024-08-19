import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/sleep_management_zen_book_get_zen_book_providers_by_id.dart';
import '../../../routes/app_pages.dart';
import 'package:http/http.dart' as http;

class BookYourClassController extends GetxController {
  final count = 0.obs;

  final selectedTab = 0.obs;

  List listOfTime = [
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
  ];

  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    onRangeSelected: (firstDate, secondDate) {},
    onDayTapped: (date) {},
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    // initialFocusDate: DateTime(2023, 5),
    // initialDateSelected: DateTime(2022, 3, 15),
    // endDateSelected: DateTime(2022, 3, 20),
  );

  String smzbbUsersId = '';
  String smzbbSleepManagementZenBookPackagesId = '';
  String smzbbScheduleStartDate = '';
  String smzbbScheduleEndDate = '';
  String smzbbSleepManagementZenBookProvidersId = '';
  String smzbbBookingsPriceWhenPurchase = '';
  String smzbbTime = '';
  Map<String, dynamic> parameters = Get.parameters;
  final inAsyncCall = false.obs;
  SleepManagementZenBookGetZenBookProvidersByIdModel?
      sleepManagementZenBookGetZenBookProvidersByIdModel;

  Result? result;

  @override
  Future<void> onInit() async {
    smzbbUsersId = parameters[ApiKeyConstants.smzbbUsersId] ?? '';
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

  clickOnCard({required int index}) {
    selectedTab.value = index;
    increment();
  }

  clickOnBookNowButton() {
    // Get.toNamed(Routes.BOOK_CART);
    sleepManagementZenBookGetZenBookProvidersByIdApi();
  }

  Future<void> sleepManagementZenBookGetZenBookProvidersByIdApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.smzbbUsersId: smzbbUsersId.toString(),
      ApiKeyConstants.smzbbSleepManagementZenBookPackagesId:
          smzbbSleepManagementZenBookPackagesId.toString(),
      ApiKeyConstants.smzbbScheduleStartDate: smzbbScheduleStartDate.toString(),
      ApiKeyConstants.smzbbScheduleEndDate: smzbbScheduleEndDate.toString(),
      ApiKeyConstants.smzbbSleepManagementZenBookProvidersId:
          smzbbSleepManagementZenBookProvidersId.toString(),
      ApiKeyConstants.smzbbBookingsPriceWhenPurchase:
          smzbbBookingsPriceWhenPurchase.toString(),
      ApiKeyConstants.smzbbTime: smzbbTime.toString(),
    };
    http.Response? response =
        await ApiMethods.sleepManagementZenBookGetZenBookAddBookings(
            queryParameters: queryParameters);
    if (response != null) {}
  }
}
