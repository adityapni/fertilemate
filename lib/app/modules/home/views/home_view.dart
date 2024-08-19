import 'package:carousel_slider/carousel_slider.dart';
import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:fertility_boost/common/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return GestureDetector(
        onTap: () => CommonMethods.unFocsKeyBoard(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.px),
                      Text(
                        StringConstants.welcomeToFertileMate,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 18.px, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10.px),
                      if (controller.data.isNotEmpty)
                        CarouselSlider(
                          items: List.generate(
                            controller.data.length,
                            (index) => CommonWidgets.imageView(
                              image:
                                  controller.data[index].bannerImage.toString(),
                              radius: 20.px,
                              height: 148.px,
                            ),
                          ),
                          options: CarouselOptions(
                            height: 180.px,
                            viewportFraction: 0.99.px,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 3),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 800),
                            autoPlayCurve: Curves.easeInOut,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.3,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      if (controller.data.isNotEmpty) SizedBox(height: 10.px),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(12.px),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstants.boostYourFertilityToday,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 20.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                                SizedBox(height: 2.px),
                                Text(
                                  "Let's check your health status",
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                                SizedBox(height: 20.px),
                                CommonWidgets.commonElevatedButton(
                                  onPressed: () =>
                                      controller.clickOnGetStartedButton(),
                                  wantContentSizeButton: true,
                                  child: Text(
                                    StringConstants.getStarted,
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
                      SizedBox(height: 12.px),
                      if (controller.result.isNotEmpty)
                        Text(
                          StringConstants.yourReproductiveHealthJourney,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                              ),
                        ),
                      if (controller.result.isNotEmpty) SizedBox(height: 12.px),
                      /* if (controller.result.isNotEmpty)
                        ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => ListTile(
                                  onTap: () => controller.clickOnListTile(
                                      id: controller.result[index].id
                                          .toString()),
                                  leading: CommonWidgets.imageView(
                                      image: controller
                                          .result[index].categoryImage
                                          .toString(),
                                      height: 40.px,
                                      width: 40.px,
                                      radius: 20.px),
                                  title: Text(
                                    controller.result[index].name.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                        ),
                                  ),
                                ),
                            itemCount: controller.result.length),*/
                      if (controller.result.isNotEmpty)
                        Align(
                          alignment: Alignment.center,
                          child: SingleChildScrollView(
                            physics: const NeverScrollableScrollPhysics(),
                            child: Wrap(
                              children: List.generate(controller.result.length,
                                  (index) {
                                final cellWidth = MediaQuery.of(Get.context!)
                                        .size
                                        .width /
                                    2.4; // Every cell's `width` will be set to 1/2 of the
                                // screen width.
                                return SizedBox(
                                  width: cellWidth,
                                  height: 124.px,
                                  child: GestureDetector(
                                    onTap: () => controller.clickOnListTile(
                                        id: controller.result[index].id
                                            .toString()),
                                    child: Card(
                                      elevation: .4.px,
                                      child: Padding(
                                        padding: EdgeInsets.all(16.px),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            CommonWidgets.imageView(
                                                image: controller
                                                    .result[index].categoryImage
                                                    .toString(),
                                                height: 40.px,
                                                width: 40.px,
                                                radius: 20.px),
                                            SizedBox(height: 10.px),
                                            Text(
                                              controller.result[index].name
                                                  .toString(),
                                              maxLines: 2,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                    fontSize: 14.px,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      SizedBox(height: 12.px),
                      Text(
                        StringConstants.support,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                      SizedBox(height: 12.px),
                      Card(
                        child: SizedBox(
                          width: double.infinity,
                          height: 110.px,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Image.asset(
                                  ImageConstants.imageDr,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 10.px),
                                    Row(
                                      children: [
                                        Container(
                                          height: 16.px,
                                          width: 16.px,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.px),
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onError),
                                        ),
                                        SizedBox(width: 8.px),
                                        Text(
                                          StringConstants.availableNow,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(fontSize: 18.px),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8.px),
                                    Text(
                                      StringConstants
                                          .letChatWithOurNutritionist,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(fontSize: 12.px),
                                    ),
                                    SizedBox(height: 14.px),
                                    Stack(
                                      alignment: Alignment.topRight,
                                      children: [
                                        CommonWidgets.commonElevatedButton(
                                          wantContentSizeButton: true,
                                          height: 34.px,
                                          onPressed: () =>
                                              controller.clickOnChatNowButton(),
                                          child: Text(
                                            StringConstants.chatNow,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.w700),
                                          ),
                                        ),
                                        if (controller.totalMessage.value
                                                .isNotEmpty &&
                                            controller.totalMessage.value !=
                                                "0")
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 15.px),
                                            child: Container(
                                              height: 16.px,
                                              width: 16.px,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .error,
                                                borderRadius:
                                                    BorderRadius.circular(8.px),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  controller.totalMessage.value,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall
                                                      ?.copyWith(
                                                        fontSize: 10.px,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                ),
                                              ),
                                            ),
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 12.px),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
