import 'package:carousel_slider/carousel_slider.dart';
import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sperm_test_package_controller.dart';

class SpermTestPackageView extends GetView<SpermTestPackageController> {
  const SpermTestPackageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(actions: [
            GestureDetector(
              onTap: () => controller.clickOnAppointment(),
              child: Image.asset(IconConstants.icappointment,
                  width: 28.px, height: 28.px),
            ),
            SizedBox(width: 16.px)
          ]),
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.banner.isNotEmpty)
                      Text(
                        StringConstants.spermTestPackage,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 24.px,
                                color: Theme.of(context).primaryColor),
                      ),
                    SizedBox(height: 10.px),
                    if (controller.banner.isNotEmpty)
                      CarouselSlider(
                        items: List.generate(
                          controller.banner.length,
                          (index) => CommonWidgets.imageView(
                            image:
                                controller.banner[index].bannerImage.toString(),
                            radius: 20.px,
                            height: 200.px,
                          ),
                        ),
                        options: CarouselOptions(
                          aspectRatio: 16.px / 9.px,
                          viewportFraction: 0.8.px,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    SizedBox(height: 10.px),
                    if (controller.spermAssessmentList.isNotEmpty)
                      Text(
                        StringConstants.servicesAvailable,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    SizedBox(height: 20.px),
                    if (controller.spermAssessmentList.isNotEmpty)
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Container(
                          padding: EdgeInsets.all(10.px),
                          decoration: BoxDecoration(
                            // color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(20.px),
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.4.px),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sperm Assessment',
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 14.px),
                              ),
                              SizedBox(height: 4.px),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: CommonWidgets.imageView(
                                      image: controller
                                          .spermAssessmentList[index].image
                                          .toString(),
                                      height: 134,
                                      fit: BoxFit.cover,
                                      radius: 20.px,
                                    ),
                                  ),
                                  SizedBox(width: 14.px),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.spermAssessmentList[index]
                                              .spermCount
                                              .toString(),
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        SizedBox(height: 4.px),
                                        Text(
                                          controller.spermAssessmentList[index]
                                              .spermConcentration
                                              .toString(),
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        SizedBox(height: 4.px),
                                        Text(
                                          controller.spermAssessmentList[index]
                                              .consultation!,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        SizedBox(height: 4.px),
                                        CommonWidgets.commonElevatedButton(
                                          wantContentSizeButton: true,
                                          onPressed: () => controller
                                              .clickOnProceedButton(controller
                                                  .spermAssessmentList![index]
                                                  .id
                                                  .toString()),
                                          child: Text(
                                            StringConstants.proceed,
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        itemCount: controller.spermAssessmentList.length,
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
