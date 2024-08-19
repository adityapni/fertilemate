import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/cycle_tracking_add_cycle_data_controller.dart';

class CycleTrackingAddCycleDataView
    extends GetView<CycleTrackingAddCycleDataController> {
  const CycleTrackingAddCycleDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: 'Add Cycle Data'),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(15.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.px),
              Text(
                StringConstants.periodStartDate,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px),
              ),
              SizedBox(height: 15.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                  hintText: 'dd/mm/yyyy',
                  controller: controller.startDateController,
                  maxLines: 1,
                  isCard: true,
                  keyboardType: TextInputType.datetime,
                  borderRadius: 12,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px, color: Colors.black87),
                  readOnly: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.clickOnDate(0);
                    },
                    child: Icon(
                      Icons.date_range,
                      color: Colors.teal,
                      size: 20.px,
                    ),
                  )),
              SizedBox(height: 5.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                hintText: StringConstants.periodDuration,
                controller: controller.periodDurationController,
                maxLines: 1,
                isCard: true,
                keyboardType: TextInputType.text,
                borderRadius: 12,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px, color: Colors.black87),
              ),
              SizedBox(height: 5.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                hintText: 'Notes about your period',
                controller: controller.note1Controller,
                maxLines: 3,
                isCard: true,
                keyboardType: TextInputType.text,
                borderRadius: 12,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px, color: Colors.black87),
              ),
              SizedBox(height: 25.px),
              Text(
                StringConstants.ovulationDate,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px),
              ),
              SizedBox(height: 15.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                  hintText: 'dd/mm/yyyy',
                  controller: controller.ovulationDateController,
                  maxLines: 1,
                  isCard: true,
                  keyboardType: TextInputType.datetime,
                  borderRadius: 12,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px, color: Colors.black87),
                  readOnly: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.clickOnDate(1);
                    },
                    child: Icon(
                      Icons.date_range,
                      color: Colors.teal,
                      size: 20.px,
                    ),
                  )),
              SizedBox(height: 5.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                hintText: 'Notes about your ovulation',
                controller: controller.note2Controller,
                maxLines: 3,
                isCard: true,
                keyboardType: TextInputType.text,
                borderRadius: 12,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px, color: Colors.black87),
              ),
              SizedBox(height: 25.px),
              Text(
                StringConstants.intimateDate,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(fontSize: 14.px),
              ),
              SizedBox(height: 15.px),
              CommonWidgets.commonTextFieldForLoginSignUP(
                  hintText: 'dd/mm/yyyy',
                  controller: controller.endDateController,
                  maxLines: 1,
                  isCard: true,
                  keyboardType: TextInputType.datetime,
                  borderRadius: 12,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 14.px, color: Colors.black87),
                  readOnly: true,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      controller.clickOnDate(2);
                    },
                    child: Icon(
                      Icons.date_range,
                      color: Colors.teal,
                      size: 20.px,
                    ),
                  )),
              SizedBox(height: 40.px),
              CommonWidgets.commonElevatedButton(
                  onPressed: () {
                    controller.clickOnSaveButton();
                  },
                  child: Obx(() => controller.btnLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: Colors.white,
                        ))
                      : Text(
                          "Save",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 16.px, color: Colors.white),
                        ))),
            ],
          ),
        ),
      ),
    );
  }
}
