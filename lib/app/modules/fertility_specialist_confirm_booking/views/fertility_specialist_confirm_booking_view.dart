import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_specialist_confirm_booking_controller.dart';

class FertilitySpecialistConfirmBookingView
    extends GetView<FertilitySpecialistConfirmBookingController> {
  const FertilitySpecialistConfirmBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(
            title: StringConstants.confirmBooking),
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
                          aspectRatio: 8 / 10,
                          child: Image.asset(
                            ImageConstants.imageConfirmBooking,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.px),
                      Text(
                        'Not data',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.px,
                            ),
                      ),
                      SizedBox(height: 40.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnDoneButton(),
                        child: Text(
                          StringConstants.done,
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
