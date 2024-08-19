import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/cycle_tracking_third_controller.dart';

class CycleTrackingThirdView extends GetView<CycleTrackingThirdController> {
  const CycleTrackingThirdView({Key? key}) : super(key: key);

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
                    if (controller.cycleTrackingOptionModel != null &&
                        controller.cycleTrackingOptionModel!.title != null &&
                        controller
                            .cycleTrackingOptionModel!.title!.isNotEmpty &&
                        controller.result.isNotEmpty)
                      Text(
                        controller.cycleTrackingOptionModel!.title!.toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 18.px),
                      ),
                    if (controller.cycleTrackingOptionModel != null &&
                        controller.cycleTrackingOptionModel!.title != null &&
                        controller
                            .cycleTrackingOptionModel!.title!.isNotEmpty &&
                        controller.result.isNotEmpty)
                      SizedBox(height: 20.px),
                    (controller.result.isNotEmpty)
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(vertical: 4.px),
                                  child: Obx(
                                    () => ListTile(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.px),
                                      ),
                                      tileColor: (index !=
                                              controller.selectedCard.value)
                                          ? Theme.of(context)
                                              .scaffoldBackgroundColor
                                          : Theme.of(context).primaryColor,
                                      onTap: () => controller.clickOnListTile(
                                          index: index),
                                      title: Text(
                                        controller.result[index].name
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 14.px,
                                                color: (index !=
                                                        controller
                                                            .selectedCard.value)
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : Theme.of(context)
                                                        .scaffoldBackgroundColor),
                                      ),
                                    ),
                                  ),
                                ),
                            itemCount: controller.result.length)
                        : controller.cycleTrackingOptionModel != null
                            ? CommonWidgets.dataNotFound()
                            : const SizedBox(),
                    if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                    if (controller.result.isNotEmpty)
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
