import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_models/get_temperature_history_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/cycle_tracking_add_temperature_controller.dart';

class CycleTrackingAddTemperatureView
    extends GetView<CycleTrackingAddTemperatureController> {
  const CycleTrackingAddTemperatureView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBarView(title: 'Add Temperature Reading'),
        body: Obx(() {
          controller.count.value;
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.all(15.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
                  Text(
                    StringConstants.temperature,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  SizedBox(height: 15.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    hintText: '00.00  C',
                    controller: controller.temperatureController,
                    maxLines: 1,
                    isCard: true,
                    keyboardType: TextInputType.number,
                    borderRadius: 12,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px, color: Colors.black87),
                  ),
                  SizedBox(height: 25.px),
                  Text(
                    StringConstants.date,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 14.px),
                  ),
                  SizedBox(height: 15.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                      hintText: 'dd/mm/yyyy',
                      controller: controller.dateController,
                      keyboardType: TextInputType.datetime,
                      maxLines: 1,
                      isCard: true,
                      readOnly: true,
                      borderRadius: 12,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 14.px, color: Colors.black87),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          controller.clickOnDate();
                        },
                        child: Icon(
                          Icons.date_range,
                          size: 20.px,
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                  SizedBox(height: 80.px),
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
                                  ?.copyWith(
                                      fontSize: 16.px, color: Colors.white),
                            ))),
                  SizedBox(height: 80.px),
                  Text(
                    StringConstants.history,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 16.px),
                  ),
                  SizedBox(height: 10.px),
                  controller.presentTemperatureData.value
                      ? SizedBox(
                          height: 80.px,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ListView.builder(
                              physics: const ClampingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: controller.temperatureList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                TemperatureHistoryData item =
                                    controller.temperatureList[index];
                                return GestureDetector(
                                  onTap: () =>
                                      controller.showAlertDialog(index),
                                  child: Container(
                                    padding: EdgeInsets.all(5.px),
                                    margin: EdgeInsets.all(5.px),
                                    decoration: BoxDecoration(
                                      // color: Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(10.px),
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary
                                            .withOpacity(.4.px),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              item.temperature.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                      fontSize: 20.px,
                                                      color: Colors.teal),
                                            ),
                                            Text(
                                              ' C',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                  ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10.px),
                                        Text(
                                          item.dateTime.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium
                                              ?.copyWith(
                                                  fontSize: 10.px,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : SizedBox(
                          height: 150.px,
                          child: CommonWidgets.dataNotFound(),
                        ),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
          );
        }));
  }
}
