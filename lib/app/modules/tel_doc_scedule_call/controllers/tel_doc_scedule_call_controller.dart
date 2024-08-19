import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';
import 'package:table_calendar/table_calendar.dart';

class TelDocSceduleCallController extends GetxController {

  final count = 0.obs;
  final selectedTab = 0.obs;
  final inAsyncCall = false.obs;
  List listOfTabs = ['Appointments', 'Patients', 'Reports', ];

  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    onRangeSelected: (firstDate, secondDate) {
      print("firstDate -----${firstDate}\nsecondDate---------${secondDate}");
    },
    onDayTapped: (date) {},
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    // initialFocusDate: DateTime(2023, 5),
    // initialDateSelected: DateTime(2022, 3, 15),
    // endDateSelected: DateTime(2022, 3, 20),
  );



  CalendarFormat _calendarFormat = CalendarFormat.month;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOn; // Can be toggled on/off by longpressing a date
  DateTime focusedDay = DateTime.now();
  DateTime? selectedDay;
  DateTime? rangeStart;
  DateTime? rangeEnd;
  final kToday = DateTime.now();
  final kFirstDay = DateTime(DateTime.now().year, DateTime.now().month - 3, DateTime.now().day);
  final kLastDay = DateTime(DateTime.now().year, DateTime.now().month + 3, DateTime.now().day);


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

  clickOnCard({required int index}) {
    selectedTab.value = index;
    increment();
  }
}
