import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sperm_test_package_booking_is_confirmed_controller.dart';

class SpermTestPackageBookingIsConfirmedView
    extends GetView<SpermTestPackageBookingIsConfirmedController> {
  const SpermTestPackageBookingIsConfirmedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(),
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
                          child:
                              Image.asset(ImageConstants.imageConfirmBooking),
                        ),
                      ),
                      SizedBox(height: 40.px),
                      Text(
                        StringConstants.congratulationsYourBookingIsConfirmed,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 24.px,
                                color: Theme.of(context).primaryColor),
                      ),
                      SizedBox(height: 20.px),
                      Text(
                        'Booking ID: ${controller.bookingId}',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 16.px,
                            ),
                      ),
                      SizedBox(height: 40.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnViewBookingDetails(),
                        child: Text(
                          "Go to Dashboard",
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
