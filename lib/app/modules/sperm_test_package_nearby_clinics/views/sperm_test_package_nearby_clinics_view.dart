import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sperm_test_package_nearby_clinics_controller.dart';

class SpermTestPackageNearbyClinicsView
    extends GetView<SpermTestPackageNearbyClinicsController> {
  const SpermTestPackageNearbyClinicsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar:
              CommonWidgets.appBarView(title: StringConstants.nearbyClinics),
          body: controller.availableTest.isNotEmpty
              ? ListView(
                  children: [
                    SizedBox(height: 20.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.availableTest.isNotEmpty)
                            SizedBox(height: 10.px),
                          if (controller.availableTest.isNotEmpty)
                            Text(
                              '${controller.availableTest.length} clinics found',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          if (controller.availableTest.isNotEmpty)
                            SizedBox(height: 10.px),
                          if (controller.availableTest.isNotEmpty)
                            Text(
                              StringConstants.recommended,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          if (controller.availableTest.isNotEmpty)
                            SizedBox(height: 20.px),
                          if (controller.availableTest.isNotEmpty)
                            ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 8.px),
                                    decoration: BoxDecoration(
                                      // color: Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadius.circular(20.px),
                                      border: Border.all(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary
                                            .withOpacity(.4.px),
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                controller.availableTest[index]
                                                        .clinicName ??
                                                    '',
                                                maxLines: 2,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                      fontSize: 18.px,
                                                    ),
                                              ),
                                              SizedBox(height: 4.px),
                                              Text(
                                                '${CommonWidgets.cur}150',
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall,
                                              ),
                                              SizedBox(height: 4.px),
                                              CommonWidgets
                                                  .commonElevatedButton(
                                                wantContentSizeButton: true,
                                                onPressed: () => controller
                                                    .clickOnProceedButton(
                                                        controller
                                                                .availableTest[
                                                                    index]
                                                                .clinicId ??
                                                            ""),
                                                child: Text(
                                                  StringConstants.proceed,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .headlineSmall
                                                      ?.copyWith(
                                                          fontWeight:
                                                              FontWeight.w700),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 14.px),
                                        Expanded(
                                          flex: 1,
                                          child: CommonWidgets.imageView(
                                              image: controller
                                                  .availableTest[index]
                                                  .clinicImage
                                                  .toString(),
                                              height: 140.px,
                                              fit: BoxFit.cover,
                                              radius: 20.px),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 8.px),
                                ],
                              ),
                              itemCount: controller.availableTest.length,
                            ),
                          SizedBox(height: 20.px),
                        ],
                      ),
                    ),
                  ],
                )
              : controller.availableClinicsModel == null
                  ? const SizedBox()
                  : Center(
                      child: CommonWidgets.dataNotFound(),
                    ),
        ),
      );
    });
  }
}
