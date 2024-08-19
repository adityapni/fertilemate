import 'package:animated_rating_bar/widgets/animated_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/rate_us_controller.dart';

class RateUsView extends GetView<RateUsController> {
  const RateUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.rateUs),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.px),
                    Card(
                      child: Padding(
                        padding: EdgeInsets.all(20.px),
                        child: SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Text(
                                StringConstants.shareYourOpinion,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 18.px,
                                    ),
                              ),
                              SizedBox(height: 10.px),
                              Text(
                                StringConstants.yourRatingForThisProductGood,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(fontSize: 10.px),
                              ),
                              /*SizedBox(height: 20.px),
                            Image.asset(
                              ImageConstants.imageRateUs,
                              height: 44.px,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),*/
                              SizedBox(height: 20.px),
                              AnimatedRatingBar(
                                activeFillColor:
                                    Theme.of(context).colorScheme.onSecondary,
                                strokeColor: Theme.of(context).primaryColor,
                                initialRating: 0,
                                height: 60,
                                width: MediaQuery.of(context).size.width,
                                animationColor:
                                    Theme.of(context).colorScheme.onSecondary,
                                onRatingUpdate: (rating) => controller
                                    .clickOnRatting(ratingStatus: rating),
                              ),
                              SizedBox(height: 20.px),
                              Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 4.px, horizontal: 10.px),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.px),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(0.2), // Background color
                                ),
                                child: TextField(
                                  controller: controller.reviewController,
                                  maxLines: 7,
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          color: Theme.of(Get.context!)
                                              .primaryColor),
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: StringConstants.typeHere,
                                    hintStyle: Theme.of(Get.context!)
                                        .textTheme
                                        .titleMedium,
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.px),
                              CommonWidgets.commonElevatedButton(
                                onPressed: () => controller.clickOnSendButton(),
                                child: Text(
                                  StringConstants.send,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
