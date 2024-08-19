import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/health_assessment_sub_category_controller.dart';

class HealthAssessmentSubCategoryView
    extends GetView<HealthAssessmentSubCategoryController> {
  const HealthAssessmentSubCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: controller.title),
          body: ListView(
            children: [
              if (controller.subCategoriesByCategoryIdModel != null &&
                  controller.subCategoriesByCategoryIdModel!.banner != null &&
                  controller.subCategoriesByCategoryIdModel!.banner!.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    children: [
                      SizedBox(height: 20.px),
                      CommonWidgets.imageView(
                          image: controller
                              .subCategoriesByCategoryIdModel!.banner
                              .toString(),
                          height: 200.px,
                          width: double.infinity,
                          radius: 20.px),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              (controller.result.isNotEmpty)
                  ? Align(
                      alignment: Alignment.center,
                      child: SingleChildScrollView(
                        child: Wrap(
                          children:
                              List.generate(controller.result.length, (index) {
                            final cellWidth = MediaQuery.of(Get.context!)
                                    .size
                                    .width /
                                2.2; // Every cell's `width` will be set to 1/2 of the screen width.
                            return SizedBox(
                              width: cellWidth,
                              height: 194.px,
                              child: GestureDetector(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                child: Padding(
                                  padding: EdgeInsets.all(4.px),
                                  child: Column(
                                    children: [
                                      CommonWidgets.imageView(
                                          image: controller.result[index].image
                                              .toString(),
                                          height: 100.px,
                                          radius: 10.px),
                                      if (controller.result[index].name !=
                                              null &&
                                          controller
                                              .result[index].name!.isNotEmpty)
                                        SizedBox(height: 8.px),
                                      if (controller.result[index].name !=
                                              null &&
                                          controller
                                              .result[index].name!.isNotEmpty)
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
                                      SizedBox(height: 8.px),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                      ),
                    )
                  : controller.subCategoriesByCategoryIdModel != null
                      ? Center(child: CommonWidgets.dataNotFound())
                      : const SizedBox(),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }
}
