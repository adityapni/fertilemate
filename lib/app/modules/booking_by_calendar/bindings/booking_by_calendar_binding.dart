import 'package:get/get.dart';

import '../controllers/booking_by_calendar_controller.dart';

class BookingByCalendarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookingByCalendarController>(
      () => BookingByCalendarController(),
    );
  }
}
