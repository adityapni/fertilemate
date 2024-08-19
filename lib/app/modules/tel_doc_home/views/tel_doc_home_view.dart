import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../controllers/tel_doc_home_controller.dart';

class TelDocHomeView extends GetView<TelDocHomeController> {
  const TelDocHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return WillPopScope(
        onWillPop: () => controller.onWillPop(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            appBar: CommonWidgets.appBarView(
              title: StringConstants.appointments,
              actions: [
                Center(
                  child: CommonWidgets.imageView(
                    image: controller.userImage,
                    width: 40.px,
                    height: 40.px,
                    radius: 20.px,
                  ),
                ),
                SizedBox(width: 20.px),
              ],
              wantBackButton: false,
              leading: IconButton(
                onPressed: () => controller.ClickOnProfile(),
                icon: Icon(
                  Icons.dehaze_rounded,
                  size: 24.px,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            body: Obx(() {
              controller.count.value;
              return ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Text(
                                'My availability',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: Theme.of(context).primaryColor),
                              ),
                            ),
                            Flexible(
                              child: GestureDetector(
                                onTap: () =>
                                    controller.clickOnSetAvailability(),
                                child: Text(
                                  'Set availability',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.px),
                        if (controller.availabilityList.isNotEmpty)
                          showMyAvailability(context),
                        /*  TableCalendar(
                          weekNumbersVisible: false,
                          firstDay: DateTime.now(),
                          lastDay: DateTime(2050),
                          focusedDay: DateTime.now(),
                        ),*/
                        SizedBox(height: 30.px),
                        if (controller.result.isNotEmpty)
                          Text(
                            'Upcoming appointments',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),
                        if (controller.result.isNotEmpty)
                          SizedBox(height: 20.px),
                        if (controller.result.isNotEmpty)
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  GestureDetector(
                                    onTap: () =>
                                        controller.clickOnUpComingAppointment(
                                            index: index),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.px),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(0.4),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.px),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CommonWidgets.imageView(
                                                        image: controller
                                                            .result[index]
                                                            .userName
                                                            .toString(),
                                                        height: 50.px,
                                                        width: 50.px,
                                                        radius: 25.px),
                                                    SizedBox(width: 8.px),
                                                    Text(
                                                      controller.result[index]
                                                          .userName
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.start,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                              fontSize: 14.px),
                                                    ),
                                                  ],
                                                ),
                                                GestureDetector(
                                                  onTap: () => controller
                                                      .clickOnDateTime(
                                                          index: index),
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      border: Border.all(
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .onSecondary
                                                            .withOpacity(
                                                                0.4.px),
                                                      ),
                                                    ),
                                                    child: Text(
                                                      controller.result[index]
                                                          .datetime
                                                          .toString(),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 10.px),
                                            Text(
                                              "Type of consultation : ${controller.result[index].specialInstruction.toString()}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            SizedBox(height: 10.px),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.px),
                                ],
                              );
                            },
                            itemCount: controller.result.length,
                          )
                      ],
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
      );
    });
  }

  clickOnSetAvailability() {}
  Widget showMyAvailability(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.availabilityList.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 5.px, bottom: 5.px),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.px),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.4),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 1,
                            child: controller.availabilityList[index].day ==
                                    controller.currentDay
                                ? Icon(
                                    Icons.access_time,
                                    size: 25.px,
                                    color: Theme.of(context).primaryColor,
                                  )
                                : SizedBox(
                                    width: 25.px,
                                  ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(
                              controller.availabilityList[index].day ?? '',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(
                              controller.availabilityList[index].time ?? '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      color: Theme.of(context).primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          controller.changeStatus(index);
                        },
                        child: Icon(
                          controller.statusList[index]
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down_outlined,
                          size: 25.px,
                          color: Colors.black54,
                        ),
                      ),
                    )
                  ],
                ),
                controller.statusList[index]
                    ? Padding(
                        padding: EdgeInsets.only(left: 35.px),
                        child: Text(
                          controller.availabilityList[index].other ?? '',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      )
                    : SizedBox(
                        height: 1.px,
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
