import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/cycle_tracking_eighth_controller.dart';

class CycleTrackingEighthView extends GetView<CycleTrackingEighthController> {
  const CycleTrackingEighthView({Key? key}) : super(key: key);
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
                      'When did your last period start?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                    SizedBox(height: 20.px),
                    Text(
                      'We can then predict your next period',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14.px),
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
