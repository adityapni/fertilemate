import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

class PersonalTrainerFindController extends GetxController {
  final count = 0.obs;

  final selectedTab = 0.obs;

  List listOfTime = [
    'Morning',
    'Afternoon',
    'Evening',
    'Night',
    'Duration',
    '30 mins',
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
  SharedPreferences? sharedPreferences;

  final expertConsultation = ''.obs;

  String date = '';

  @override
  Future<void> onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    expertConsultation.value =
        sharedPreferences?.getString(StringConstants.expertConsultation) ?? '';
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

  clickOnCard({required int index}) {
    selectedTab.value = index;
    increment();
  }

  clickOnSearchButton() {
    Get.toNamed(Routes.PERSONAL_TRAINER_BOOK);
  }
}
