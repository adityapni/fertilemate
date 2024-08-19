import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:time_slot/model/time_slot_Interval.dart';
import 'package:time_slot/time_slot_from_interval.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sperm_test_package_hospital_serdang_controller.dart';

class SpermTestPackageHospitalSerdangView
    extends GetView<SpermTestPackageHospitalSerdangController> {
  const SpermTestPackageHospitalSerdangView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                Text(
                  StringConstants.location,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                SizedBox(height: 4.px),
                Text(
                  StringConstants.hospitalSerdang,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 22.px),
                ),
                SizedBox(height: 4.px),
                Text(
                  StringConstants.package,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px),
                ),
                SizedBox(height: 4.px),
                Text(
                  'Address: 4.3, Jalan Furw, 34500, Kuala Lumpur, MalaysiaSperm ConcentrationSpem CountConsultan',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                SizedBox(height: 20.px),
                Text(
                  StringConstants.selectAppointmentDate,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px),
                ),
                SizedBox(height: 20.px),
                _changeHeaderAppearanceExample(),
                SizedBox(height: 20.px),
                Text(
                  StringConstants.time,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px),
                ),
                SizedBox(height: 20.px),
                SizedBox(
                  height: 40.px,
                  child: ListView.builder(
                    itemCount: controller.listOfTime.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) => tabBarText(index: index),
                  ),
                ),
                SizedBox(height: 40.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnBookNowButton(),
                  child: Text(
                    StringConstants.bookNow,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 10.px),
              ],
            ),
          ),
          SizedBox(height: 20.px),
        ],
      ),
    );
  }

  _changeHeaderAppearanceExample() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {},
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

  _changeHeaderAppearanceExampleTime() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {},
      activeColor: Theme.of(Get.context!).primaryColor,
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        selectedDateFormat: SelectedDateFormat.fullDateMonthAsStrDY,
      ),
      dayProps: EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        width: 50.px,
        height: 80.px,
        landScapeMode: true,
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

  Widget time() {
    return Obx(() {
      controller.count.value;
      return TimesSlotGridViewFromInterval(
        locale: "en",
        initTime: controller.selectTime,
        // crossAxisCount: 4,
        selectedColor: Colors.red,
        unSelectedColor: Colors.green,
        timeSlotInterval: const TimeSlotInterval(
          start: TimeOfDay(hour: 10, minute: 00),
          end: TimeOfDay(hour: 22, minute: 0),
          interval: Duration(hours: 1, minutes: 0),
        ),
        onChange: (value) {
          controller.selectTime = value;
          controller.increment();
        },
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
