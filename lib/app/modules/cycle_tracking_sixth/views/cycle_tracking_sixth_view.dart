import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/cycle_tracking_sixth_controller.dart';

class CycleTrackingSixthView extends GetView<CycleTrackingSixthController> {
  const CycleTrackingSixthView({Key? key}) : super(key: key);

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
                      'I usually take my pill at',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                    SizedBox(height: 20.px),
                    GestureDetector(
                      onTap: () => controller.clickOnTime(),
                      child: Text(
                        controller.selectedTime.value,
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 18.px,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.4.px),
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
