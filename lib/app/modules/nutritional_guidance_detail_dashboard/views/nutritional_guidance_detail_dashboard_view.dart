import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/nutritional_guidance_detail_dashboard_controller.dart';

class NutritionalGuidanceDetailDashboardView
    extends GetView<NutritionalGuidanceDetailDashboardController> {
  const NutritionalGuidanceDetailDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.inAsyncCall.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'Lunch Menu'),
          body: controller.result.isNotEmpty
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: controller.result.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.symmetric(vertical: 4.px),
                              child: GestureDetector(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary
                                          .withOpacity(.4.px),
                                    ),
                                    borderRadius: BorderRadius.circular(20.px),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (controller.result[index].gmImage !=
                                              null &&
                                          controller.result[index].gmImage!
                                              .isNotEmpty)
                                        CommonWidgets.imageView(
                                            image: controller
                                                .result[index].gmImage
                                                .toString(),
                                            radius: 20.px,
                                            height: 200.px),
                                      if (controller.result[index].gmImage !=
                                              null &&
                                          controller.result[index].gmImage!
                                              .isNotEmpty)
                                        SizedBox(height: 10.px),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.px, vertical: 10.px),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              controller
                                                      .result[index].gmTitle ??
                                                  '',
                                              maxLines: 1,
                                              textAlign: TextAlign.start,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(
                                                      fontSize: 14.px,
                                                      color: Theme.of(context)
                                                          .primaryColor),
                                            ),
                                            /*SizedBox(height: 6.px),
                                            Text(
                                              controller.result[index]
                                                      .gmDescription ??
                                                  '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(
                                                    fontSize: 12.px,
                                                  ),
                                            ),*/
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          /*SizedBox(height: 20.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () =>
                                controller.clickOnPurchaseHealthyMealButton(),
                            child: Text(
                              StringConstants.purchaseHealthyMeal,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),*/
                          SizedBox(height: 20.px),
                        ],
                      ),
                    ),
                  ],
                )
              : controller.guidesGetMenuByGuideIdModel == null
                  ? const SizedBox()
                  : Center(
                      child: CommonWidgets.dataNotFound(),
                    ),
        ),
      );
    });
  }
}
