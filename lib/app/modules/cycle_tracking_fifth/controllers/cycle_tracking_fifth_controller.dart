import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

class CycleTrackingFifthController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;
  final selectedTab = 0.obs;

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

  List data = ['Start Date', 'Pill Taken'];

  @override
  void onInit() {
    super.onInit();
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

  clickOnContinueButton() {
    Get.toNamed(Routes.CYCLE_TRACKING_SIXTH);
  }

  clickOnTab({required int index}) {
    selectedTab.value = index;
  }
}
