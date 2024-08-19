import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:scrollable_clean_calendar/scrollable_clean_calendar.dart';
import 'package:scrollable_clean_calendar/utils/enums.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/personal_trainer_training_session_controller.dart';

class PersonalTrainerTrainingSessionView
    extends GetView<PersonalTrainerTrainingSessionController> {
  const PersonalTrainerTrainingSessionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(),
        body: ListView(
          children: [
            SizedBox(height: 20.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.bookYourPersonalTrainingSession,
                    maxLines: 2,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 24.px,
                    ),
                  ),
                  SizedBox(height: 10.px),
                  Text('Certified trainers',
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium),
                ],
              ),
            ),
            SizedBox(height: 20.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.px),
                ),
                elevation: 0,
                color: Theme.of(context)
                    .colorScheme
                    .onSecondary
                    .withOpacity(.2),
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
            ),
            SizedBox(height: 20.px),
            Container(
              margin: EdgeInsets.all(20.px),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.px),
                border: Border.all(
                  color: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.2.px),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Time',
                      maxLines: 1,
                      style:
                      Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px,
                      ),
                    ),
                    SizedBox(height: 20.px),
                    Wrap(
                      children: List.generate(
                        controller.listOfTime.length,
                            (index) => tabBarText(index: index),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnConfirmButton(),
                child: Text(
                  StringConstants.confirmBooking,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: 20.px),
          ],
        ),
      );
    });
  }

  tabBarText({required int index}) {
    return GestureDetector(
      onTap: () => controller.clickOnCard(index: index),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.px, horizontal: 1.px),
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
              controller.listOfTime[index],
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 10.px,
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
