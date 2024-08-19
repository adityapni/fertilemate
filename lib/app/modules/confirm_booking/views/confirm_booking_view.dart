import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/confirm_booking_controller.dart';

class ConfirmBookingView extends GetView<ConfirmBookingController> {
  const ConfirmBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              Column(
                children: [
                  Image.asset(
                    ImageConstants.imageBookingConfirm,
                    width: 200.px,
                    height: 200.px,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 20.px),
                  Text(
                    'Congratulations!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 24.px,
                        ),
                  ),
                  SizedBox(height: 20.px),
                  Text(
                    'Appointment successfully booked You will receive a notification and the doctor you selected will contact you',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnContinueButton(),
                child: Text(
                  textAlign: TextAlign.center,
                  StringConstants.continueText,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
