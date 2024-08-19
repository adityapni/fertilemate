import 'package:fertility_boost/common/custom_graph.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/cycle_tracking_calendar_detail_controller.dart';

class CycleTrackingCalendarDetailView
    extends GetView<CycleTrackingCalendarDetailController> {
  const CycleTrackingCalendarDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
              appBar:
                  CommonWidgets.appBarView(title: 'Cycle Tracking Calendar'),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TableCalendar(
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
                        // selectedDayPredicate: (day) =>
                        //     isSameDay(controller.selectedDay, day),
                        rangeStartDay: controller.rangeStart,
                        rangeEndDay: controller.rangeEnd,
                        calendarFormat: CalendarFormat.month,
                        rangeSelectionMode: RangeSelectionMode.toggledOff,
                        onDaySelected: (selectedDay, focusedDay) {
                          controller.clickOnCalendar();
                          /* if (!isSameDay(controller.selectedDay, selectedDay)) {
                            controller.selectedDay = selectedDay;
                            controller.focusedDay = focusedDay;
                            controller.rangeStart =
                                selectedDay; // Important to clean those
                            controller.rangeEnd = selectedDay;
                            controller.increment();
                            // rangeSelectionMode = RangeSelectionMode.toggledOff;
                          } */
                        },
                        onRangeSelected: (start, end, focusedDay) {
                          controller.selectedDay = null;
                          controller.focusedDay = focusedDay;
                          controller.rangeStart = start;
                          controller.rangeEnd = end;
                          controller.increment();
                          // controller.rangeSelectionMode = RangeSelectionMode.toggledOn;
                        },

                        calendarBuilders: CalendarBuilders(
                          defaultBuilder: (context, day, focusedDay) {
                            for (DateTime d in controller.highlightedDates) {
                              if (day.day == d.day &&
                                  day.month == d.month &&
                                  day.year == d.year) {
                                return Container(
                                  margin: EdgeInsets.only(
                                      left: 5.px,
                                      right: 5.px,
                                      top: 8.px,
                                      bottom: 8.px),
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.px),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${day.day}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ),
                                );
                              }
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.px,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.redAccent),
                              ),
                              SizedBox(
                                width: 5.px,
                              ),
                              const Text("Period"),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.lightGreen),
                              ),
                              SizedBox(
                                width: 5.px,
                              ),
                              const Text("Ovalution"),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.orangeAccent),
                              ),
                              SizedBox(
                                width: 5.px,
                              ),
                              Text("Intimate"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.px,
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.px),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 5.px),
                          Text(
                            'Track your basal body Temperature',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 10.px),
                          Align(
                              alignment: Alignment.center,
                              child: CommonWidgets.commonElevatedButton(
                                  onPressed: () {
                                    controller.clickOnAddReadingButton();
                                  },
                                  wantContentSizeButton: true,
                                  borderRadius: 10,
                                  child: Text(
                                    "Add Reading",
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 10.px,
                                            color: Colors.white),
                                  ))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.px,
                    ),
                    Obx(
                      () => Visibility(
                          visible: controller.presentTemperatureData.value,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(20.px)),
                            height: 300.px,
                            //width: 350.px,
                            child: TemperatureChart(
                              temperatureList: controller.temperatureList,
                            ),
                          )),
                    ),
                    /*   horizontalChartGross(
                      barColor: appColorCost,
                      bardata: controller.bardatax,
                      interval: controller.average / 3,
                    ),*/
                    SizedBox(
                      height: 20.px,
                    ),
                  ],
                ),
              )));
    });
  }
}
