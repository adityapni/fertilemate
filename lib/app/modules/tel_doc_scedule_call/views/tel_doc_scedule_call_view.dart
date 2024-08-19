import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';
import '../controllers/tel_doc_scedule_call_controller.dart';

class TelDocSceduleCallView extends GetView<TelDocSceduleCallController> {
  const TelDocSceduleCallView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: "14–20 February"),
      body: Obx(() {
        controller.count.value;
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.px),
              SizedBox(
                height: 50.px,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.listOfTabs.length,
                  itemBuilder: (context, index) => tabBarText(
                      title: controller.listOfTabs[index], index: index),
                  scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 30.px),
              // Card(
              //
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(12.px),
              //   ),
              //   elevation: 0,
              //   color: Colors.white,
              //   child: SizedBox(
              //     width: double.infinity,
              //     height: 370.px,
              //     child: ScrollableCleanCalendar(
              //
              //
              //       // daySelectedBackgroundColorBetween: Color(0xff115571),
              //       dayBackgroundColor: Colors.amber,
              //       calendarController: controller.calendarController,
              //       daySelectedBackgroundColor:
              //       Theme.of(context).primaryColor,
              //       dayRadius: 20.px,
              //       // showWeekdays: false,
              //       layout: Layout.BEAUTY,
              //       /*dayBuilder: (context, values) {
              //                   return Text(
              //                     values.text,
              //                     style: Theme.of(context)
              //                         .textTheme
              //                         .displayMedium
              //                         ?.copyWith(fontSize: 14.px),
              //                   );
              //                 },*/
              //       dayTextStyle: Theme.of(context)
              //           .textTheme
              //           .titleSmall
              //           ?.copyWith(fontSize: 14.px),
              //       dayDisableColor:
              //       Theme.of(context).colorScheme.onSecondary,
              //       monthTextStyle: Theme.of(context)
              //           .textTheme
              //           .displayMedium
              //           ?.copyWith(fontSize: 14.px),
              //       weekdayTextStyle:
              //       Theme.of(context).textTheme.titleSmall,
              //       calendarCrossAxisSpacing: 0,
              //       spaceBetweenMonthAndCalendar: 0,
              //       spaceBetweenCalendars: 0,
              //       calendarMainAxisSpacing: 0,
              //
              //     ),
              //   ),
              // ),
              // SizedBox(height: 10.px),
              TableCalendar(
                weekNumbersVisible: false,
                calendarStyle: CalendarStyle(
                  rangeHighlightColor: Theme.of(context).primaryColor,
                  rangeEndDecoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(50)),
                  rangeStartDecoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(50)),

                  // selectedTextStyle: TextStyle(color: Colors.green)
                ),
                firstDay: controller.kFirstDay,
                lastDay: controller.kLastDay,
                focusedDay: controller.focusedDay,
                selectedDayPredicate: (day) =>
                    isSameDay(controller.selectedDay, day),
                rangeStartDay: controller.rangeStart,
                rangeEndDay: controller.rangeEnd,
                calendarFormat: CalendarFormat.month,
                rangeSelectionMode: RangeSelectionMode.enforced,
                onDaySelected: (selectedDay, focusedDay) {
                  if (!isSameDay(controller.selectedDay, selectedDay)) {
                    controller.selectedDay = selectedDay;
                    controller.focusedDay = focusedDay;
                    controller.rangeStart = null; // Important to clean those
                    controller.rangeEnd = null;
                    controller.increment();
                    // rangeSelectionMode = RangeSelectionMode.toggledOff;
                  }
                },
                onRangeSelected: (start, end, focusedDay) {
                  controller.selectedDay = null;
                  controller.focusedDay = focusedDay;
                  controller.rangeStart = start;
                  controller.rangeEnd = end;
                  controller.increment();
                  // controller.rangeSelectionMode = RangeSelectionMode.toggledOn;
                },
                onFormatChanged: (format) {
                  // if (controller.calendarFormat != format) {
                  //
                  //   controller.calendarFormat = format;
                  //
                  // }
                },
                onPageChanged: (focusedDay) {
                  controller.focusedDay = focusedDay;
                },
              ),
              SizedBox(height: 30.px),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(0.4))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              ImageConstants.imageStethoscope,
                              height: 45.px,
                              width: 50.px,
                            ),
                            Text("Mr. Smith"),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary
                                          .withOpacity(0.4))),
                              child: Text("12:00"),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary
                                          .withOpacity(0.4))),
                              child: Text(
                                "Aug 12",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.px,
                        ),
                        Text(
                          "Type of consultation : video call",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  tabBarText({required String title, required int index}) {
    return GestureDetector(
      onTap: () => controller.clickOnCard(index: index),
      child: Padding(
        padding: EdgeInsets.all(4.px),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            color: controller.selectedTab.value == index
                ? Theme.of(Get.context!).primaryColor
                : Colors.transparent,
            border: Border.all(
                color: Theme.of(Get.context!).colorScheme.onSecondary),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 20.px),
            child: Text(
              title,
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 16.px,
                  color: controller.selectedTab.value == index
                      ? Theme.of(Get.context!).scaffoldBackgroundColor
                      : Theme.of(Get.context!).textTheme.displayMedium?.color),
            ),
          ),
        ),
      ),
    );
  }
}
