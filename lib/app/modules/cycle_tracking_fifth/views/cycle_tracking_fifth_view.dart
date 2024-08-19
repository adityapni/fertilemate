import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/cycle_tracking_fifth_controller.dart';

class CycleTrackingFifthView extends GetView<CycleTrackingFifthController> {
  const CycleTrackingFifthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.px),
                    Text(
                      'My primary contraceptive method is',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                    SizedBox(height: 20.px),
                    SizedBox(
                      height: 24.px,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Obx(() => GestureDetector(
                                onTap: () =>
                                    controller.clickOnTab(index: index),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.px),
                                  child: Row(children: [
                                    Container(
                                      height: 14.px,
                                      width: 14.px,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(7.px),
                                          color: controller.selectedTab.value ==
                                                  index
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .primaryColor
                                                  .withOpacity(.6.px)),
                                    ),
                                    SizedBox(width: 8.px),
                                    Text(
                                      controller.data[index],
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(fontSize: 14.px),
                                    ),
                                  ]),
                                ),
                              ));
                        },
                        itemCount: 2,
                      ),
                    ),
                    SizedBox(height: 20.px),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.px),
                      ),
                      elevation: 0,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.6),
                      child: SizedBox(
                        width: double.infinity,
                        height: 370.px,
                        child: ScrollableCleanCalendar(
                          calendarController: controller.calendarController,
                          daySelectedBackgroundColor:
                              Theme.of(context).primaryColor,
                          dayRadius: 20.px,
                          // showWeekdays: false,
                          layout: Layout.BEAUTY,
                          /*dayBuilder: (context, values) {
                            return Text(
                              values.text,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 14.px),
                            );
                          },*/
                          dayTextStyle: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 14.px),
                          dayDisableColor:
                              Theme.of(context).colorScheme.onSecondary,
                          monthTextStyle: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                          weekdayTextStyle:
                              Theme.of(context).textTheme.titleSmall,
                          calendarCrossAxisSpacing: 0,
                          spaceBetweenMonthAndCalendar: 0,
                          spaceBetweenCalendars: 0,
                          calendarMainAxisSpacing: 0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnContinueButton(),
                      child: Text(
                        StringConstants.continueText,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
