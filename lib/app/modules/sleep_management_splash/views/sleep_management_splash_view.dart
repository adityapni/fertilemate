import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sleep_management_splash_controller.dart';

class SleepManagementSplashView
    extends GetView<SleepManagementSplashController> {
  const SleepManagementSplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                children: [
                  SizedBox(height: 40.px),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.px),
                        child: AspectRatio(
                          aspectRatio: 1.px / 1.px,
                          child: Image.asset(ImageConstants.imageSleepSplash),
                        ),
                      ),
                      SizedBox(height: 40.px),
                      Text(
                        StringConstants.sleepTunes,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 24.px,
                                color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(height: 20.px),
                      Text(
                        StringConstants
                            .fallAsleepFasterWithSoothingSoundtracksAndSleepTips,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 16.px,
                            ),
                      ),
                      SizedBox(height: 40.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnStartNow(),
                        child: Text(
                          StringConstants.startNow,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 10.px),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
