import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/booking_by_calendar_controller.dart';

class BookingByCalendarView extends GetView<BookingByCalendarController> {
  const BookingByCalendarView({super.key});

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
              onPressed: () => controller.clickOnBookNow(),
              child: Text(
                "Book Now",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 18,
                    color: Theme.of(context).scaffoldBackgroundColor),
              ),
            ),
          ),
          appBar: CommonWidgets.appBarView(),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                (controller.bookingType == ApiKeyConstants.tvsScan ||
                        controller.bookingType == ApiKeyConstants.spermTest)
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 4.px),
                          if (controller.title.isNotEmpty)
                            Text(
                              StringConstants.location,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          if (controller.title.isNotEmpty)
                            SizedBox(height: 4.px),
                          if (controller.title.isNotEmpty)
                            Text(
                              controller.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 18.px,
                                  ),
                            ),
                          if (controller.subTitle.isNotEmpty)
                            SizedBox(height: 20.px),
                          Text(
                            controller.subTitle,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                          if (controller.description.isNotEmpty)
                            SizedBox(height: 4.px),
                          if (controller.description.isNotEmpty)
                            Text(
                              controller.description,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.title.isNotEmpty)
                            Text(
                              controller.title,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 18.px,
                                  ),
                            ),
                          if (controller.description.isNotEmpty)
                            SizedBox(height: 4.px),
                          if (controller.description.isNotEmpty)
                            Text(
                              controller.description,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                        ],
                      ),
                /*
                SizedBox(height: 20.px),
                if (controller.bookingType != "tvs_scan" &&
                    controller.bookingType != "sperm_test")
                  Text("Special instruction ${controller.bookingType}"),*/
                SizedBox(height: 14.px),
                if (controller.bookingType != "tvs_scan" &&
                    controller.bookingType != "sperm_test")
                  CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.specialInstructionController,
                      readOnly: true,
                      hintText: "Special instruction",
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.2),
                      borderRadius: 25.px,
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(14.px),
                                topLeft: Radius.circular(14.px),
                              ),
                            ),
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, setState) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) => Theme(
                                    data: ThemeData(),
                                    child: RadioListTile(
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      controlAffinity:
                                          ListTileControlAffinity.trailing,
                                      selected: index ==
                                          controller.selectedIndexValue.value,
                                      groupValue: controller
                                          .specialInstructionController.text,
                                      value: controller.listOfListTile[index]
                                          ['title'],
                                      onChanged: (value) async {
                                        if (value != null) {
                                          controller
                                                  .selectedRadioTrainersCategory =
                                              value;
                                          controller
                                                  .specialInstructionController
                                                  .text =
                                              controller
                                                  .selectedRadioTrainersCategory
                                                  .toString();
                                          controller.increment();
                                          setState(() {});
                                          Get.back();
                                        }
                                      },
                                      title: Text(
                                        controller.listOfListTile[index]
                                            ['title'],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 14.px),
                                      ),
                                    ),
                                  ),
                                  itemCount: controller.listOfListTile.length,
                                );
                              });
                            });
                      }),
                SizedBox(height: 15.px),
                Text(
                  "Select appointment date",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px,
                      ),
                ),
                SizedBox(height: 15.px),
                calenderView(),
                SizedBox(height: 25.px),
                Text(
                  "Select time",
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px,
                      ),
                ),
                SizedBox(height: 15.px),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0.px),
                  child: CommonWidgets.commonTextFieldForLoginSignUP(
                      borderRadius: 25.px,
                      validator: (value) =>
                          FormValidator.isEmptyValid(value: value),
                      controller: controller.timeController,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2.px),
                      hintText: 'Time',
                      onTap: () => controller.clickOnTime(),
                      readOnly: true),
                ),
                SizedBox(height: 15.px),
                if (controller.address.isNotEmpty)
                  headingText(title: StringConstants.address),
                if (controller.address.isNotEmpty) SizedBox(height: 10.px),
                if (controller.address.isNotEmpty)
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.px),
                    ),
                    child: Column(
                      children: [
                        if (controller.address.isNotEmpty)
                          SizedBox(
                            child: ListView.builder(
                              itemCount: controller.address.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Obx(() {
                                  return RadioListTile<String>(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.px),
                                    ),
                                    secondary: Image.asset(
                                        IconConstants.icLocation,
                                        height: 24.px,
                                        width: 24.px),
                                    controlAffinity:
                                        ListTileControlAffinity.trailing,
                                    activeColor: Theme.of(context).primaryColor,
                                    title: Text(
                                      '${controller.address[index].addressName} ${controller.address[index].addressStreetAddress} ${controller.address[index].addressCity} ${controller.address[index].addressState} ${controller.address[index].addressPostalCode}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontSize: 10.px,
                                          ),
                                    ),
                                    value: controller.address[index].addressId
                                        .toString(),
                                    groupValue:
                                        controller.selectedAddressId.value,
                                    onChanged: (value) {
                                      controller.selectedAddressId.value =
                                          value!;
                                      controller.selectedAddress.value =
                                          '${controller.address[index].addressName} ${controller.address[index].addressStreetAddress} ${controller.address[index].addressCity} ${controller.address[index].addressState} ${controller.address[index].addressPostalCode}';
                                    },
                                  );
                                });
                              },
                            ),
                          ),
                        InkWell(
                          onTap: () => controller.clickOnAddAddress(),
                          borderRadius: BorderRadius.circular(15.px),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10.px, horizontal: 14.px),
                            child: Row(
                              children: [
                                Image.asset(IconConstants.icAdd,
                                    height: 24.px, width: 24.px),
                                SizedBox(width: 10.px),
                                Text(
                                  StringConstants.addAddress,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 10.px,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }

  headingText({String title = '', double? fontSize}) {
    return Text(
      title,
      style: Theme.of(Get.context!)
          .textTheme
          .displayMedium
          ?.copyWith(fontSize: fontSize ?? 16.px),
    );
  }

  calenderView() {
    return EasyDateTimeLine(
      initialDate: DateTime.now(),
      onDateChange: (selectedDate) {
        controller.date = selectedDate;
      },
      disabledDates: getDisabledDates(),
      activeColor: Theme.of(Get.context!).primaryColor,
      headerProps: const EasyHeaderProps(
          // monthPickerType: MonthPickerType.switcher,
          selectedDateFormat: SelectedDateFormat.fullDateDayAsStrMY,
          showMonthPicker: true),
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
          dayStrStyle: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                fontSize: 12.px,
                fontWeight: FontWeight.w400,
              ),
          splashBorder: BorderRadius.circular(50.px),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Theme.of(Get.context!).colorScheme.onSecondary),
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

  List<DateTime> getDisabledDates() {
    DateTime currentDate = DateTime.now();
    List<DateTime> disabledDates = [];
    for (int i = 1; i < 31; i++) {
      // You can customize this range based on your needs
      disabledDates.add(currentDate.subtract(Duration(days: i)));
    }

    return disabledDates;
  }
}
