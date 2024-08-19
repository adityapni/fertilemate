import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_education_controller.dart';

class FertilityEducationView extends GetView<FertilityEducationController> {
  const FertilityEducationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 40.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.intimacyManagement,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: Theme.of(context).primaryColor),
                  ),
                  Text(
                    'Hi Sam Smith!',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 24.px,
                        ),
                  ),
                  SizedBox(height: 10.px),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.px),
                    child: Image.asset(
                        height: 200.px, 'assets/faltu/Rectangle 41933.png'),
                  ),
                  SizedBox(height: 10.px),
                  Text(
                    StringConstants.categories,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                  SizedBox(height: 10.px),
                  SizedBox(
                    height: 100.px,
                    width: double.infinity,
                    child: Obx(() {
                      controller.count.value;
                      return Center(
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.listOfCards.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => controller.clickOnCard(index: index),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.px),
                                child: cards(
                                  textString: controller.listOfCards[index],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 40.px),
                  Text(
                    StringConstants.mostPopularContent,
                    maxLines: 1,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                  SizedBox(height: 10.px),
                  Container(
                    width: double.infinity,
                    height: 180.px,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20.px),
                    ),
                    child: Stack(
                      children: [
                        Image.asset(
                          height: double.infinity,
                          width: double.infinity,
                          ImageConstants.imageConfirmBooking,
                          fit: BoxFit.cover,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.px),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius:
                                          BorderRadius.circular(20.px),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.px),
                                      child: Center(
                                        child: Text(
                                          StringConstants.premium,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 14.px,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius:
                                          BorderRadius.circular(20.px),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(8.px),
                                      child: Center(
                                        child: Text(
                                          '4.9',
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 14.px,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 70.px,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(20.px),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(14.px),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "You've listened to 7 soothing",
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 20.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    SizedBox(height: 4.px),
                                    Text(
                                      '80% of your weekly sleep goel is completed',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(fontSize: 10.px),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.px),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget cards({
    required String textString,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*SizedBox(
          height: 64.px,
          width: 64.px,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.px),
            child: Image.network(
              bgImageString,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(ImageConstants.defaultNetworkImage);
              },
            ),
          ),
        ),*/
        Image.asset(ImageConstants.imageSleepWell, width: 64.px, height: 64.px),
        SizedBox(height: 4.px),
        Text(
          textString,
          style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
              fontSize: 12.px, color: Theme.of(Get.context!).primaryColor),
        ),
      ],
    );
  }
}
