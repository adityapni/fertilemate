import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../controllers/tel_doc_set_availability_controller.dart';

class TelDocSetAvailabilityView
    extends GetView<TelDocSetAvailabilityController> {
  const TelDocSetAvailabilityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: EdgeInsets.all(16.px),
            child: CommonWidgets.commonElevatedButton(
              onPressed: () {
                // controller.clickOnSetNow();
                controller.editDoctorAvailability();
              },
              child: Text(
                "Set Now",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 18.px,
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
          ),
          appBar: CommonWidgets.appBarView(title: 'Set My Availability'),
          body: Padding(
            padding: EdgeInsets.all(16.px),
            child: ListView(
              children: [
                SizedBox(height: 5.px),
                // calenderView(),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 50.px,
                    child: showMyAvailability(context),
                  ),
                ),
                SizedBox(height: 15.px),
                Text(
                    "Select time for ${controller.availabilityList[int.parse(controller.selectedDayId.value) - 1]['day']}"),
                SizedBox(height: 15.px),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.px),
                  child: CommonWidgets.commonTextFieldForLoginSignUP(
                      borderRadius: 25.px,
                      validator: (value) =>
                          FormValidator.isEmptyValid(value: value),
                      controller: controller.startTimeController,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2.px),
                      hintText: 'Start Time',
                      onTap: () => controller.clickOnTime(type: 'start'),
                      readOnly: true),
                ),
                SizedBox(height: 15.px),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.px),
                  child: CommonWidgets.commonTextFieldForLoginSignUP(
                      borderRadius: 25.px,
                      validator: (value) =>
                          FormValidator.isEmptyValid(value: value),
                      controller: controller.endTimeController,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2.px),
                      hintText: 'End Time',
                      onTap: () => controller.clickOnTime(type: ''),
                      readOnly: true),
                ),
                SizedBox(height: 15.px),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.px),
                  child: CommonWidgets.commonTextFieldForLoginSignUP(
                    borderRadius: 25.px,
                    validator: (value) =>
                        FormValidator.isEmptyValid(value: value),
                    controller: controller.otherController,
                    fillColor: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(.2.px),
                    hintText: 'Other',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  calenderView() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        controller.date = selectedDate;
      },
      activeColor: Theme.of(Get.context!).primaryColor,
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        selectedDateFormat: SelectedDateFormat.fullDateMonthAsStrDY,
      ),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        width: 50.px,
        height: 80.px,
        todayStyle: DayStyle(
          dayNumStyle: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                fontSize: 18.px,
              ),
          dayStrStyle: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 12.px, fontWeight: FontWeight.w400),
          splashBorder: BorderRadius.circular(50.px),
          borderRadius: 50.px,
        ),
        activeDayStyle: DayStyle(
          dayNumStyle: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
              fontSize: 18.px,
              color: Theme.of(Get.context!).scaffoldBackgroundColor),
          dayStrStyle: Theme.of(Get.context!).textTheme.titleSmall?.copyWith(
              fontSize: 12.px,
              color: Theme.of(Get.context!).scaffoldBackgroundColor),
          splashBorder: BorderRadius.circular(50.px),
          borderRadius: 50.px,
        ),
        disabledDayStyle: DayStyle(
          dayNumStyle: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                fontSize: 18.px,
              ),
          dayStrStyle: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 12.px, fontWeight: FontWeight.w400),
          splashBorder: BorderRadius.circular(50.px),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Theme.of(Get.context!).scaffoldBackgroundColor),
          borderRadius: 50.px,
        ),
        inactiveDayStyle: DayStyle(
          dayNumStyle: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                fontSize: 18.px,
              ),
          dayStrStyle: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 12.px, fontWeight: FontWeight.w400),
          splashBorder: BorderRadius.circular(50.px),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Theme.of(Get.context!)
                  .colorScheme
                  .onSecondary
                  .withOpacity(.4)),
          borderRadius: 50.px,
        ),
      ),
    );
  }

  Widget showMyAvailability(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: controller.availabilityList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.selectedDayId.value =
                controller.availabilityList[index]['id'] ?? '1';
            controller.increment();
          },
          child: Container(
            width: 100.px,
            height: 40.px,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 5.px, left: 5.px),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.px),
              border: Border.all(
                width: 1.5.px,
                color: controller.selectedDayId.value ==
                        controller.availabilityList[index]['id']
                    ? Theme.of(context).primaryColor
                    : Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(0.4),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(6.px),
              child: Text(
                controller.availabilityList[index]['day'] ?? '',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor),
              ),
            ),
          ),
        );
      },
    );
  }
}
