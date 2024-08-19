import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';

class CycleTrackingDashboardController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  String userId = '';
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

  @override
  void onInit() async {
    super.onInit();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
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

  clickOnListTile({required String id}) {
    Map<String, String> paramData = {ApiKeyConstants.userId: userId};
    switch (id) {
      case "1":
        Get.toNamed(Routes.CYCLE_TRACKING_ADD_TEMPERATURE,
            parameters: paramData);
        break;
      case "2":
        Get.toNamed(Routes.CYCLE_TRACKING_CERVICAL_MUCUS_EGG,
            parameters: paramData);
        break;
      case '3':
        // Get.toNamed(Routes.ECOMMERCE_CATEGORY,);
        break;
      case '4':
        /*Get.toNamed(Routes.CYCLE_TRACKING_ULTRASOUNDIMAGE,
            parameters: paramData);*/
        Get.toNamed(Routes.CYCLE_TRACKING_ULTRASOUND_EDIT,
            parameters: paramData);

        break;
      case '5':
        Get.toNamed(Routes.CYCLE_TRACKING_SYMTOPM_TRACKER_HISTORY,
            parameters: paramData);
        break;
    }
  }

  clickOnCalendar() {
    Map<String, String> paramData = {ApiKeyConstants.userId: userId};
    Get.toNamed(Routes.CYCLE_TRACKING_CALENDAR_DETAIL, parameters: paramData);
  }
}
