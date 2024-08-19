import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_assessment_controller.dart';

class FertilityAssessmentView extends GetView<FertilityAssessmentController> {
  const FertilityAssessmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.fertilityAssessment),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              children: [
                SizedBox(height: 20.px),
                (controller.result.isNotEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) => Card(
                              elevation: .4.px,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.px)),
                              child: InkWell(
                                borderRadius: BorderRadius.circular(10.px),
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                child: Row(
                                  children: [
                                    CommonWidgets.imageView(
                                        image: controller.result[index].image
                                            .toString(),
                                        height: 84.px,
                                        width: 84.px,
                                        radius: 10.px),
                                    SizedBox(width: 10.px),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller.result[index].name
                                                .toString(),
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 20.px,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                          ),
                                          Text(
                                            controller.result[index].description
                                                .toString(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  fontSize: 12.px,
                                                ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                        itemCount: controller.result.length)
                    : controller.subCategoriesByCategoryIdModel == null
                        ? const SizedBox()
                        : Center(
                            child: CommonWidgets.dataNotFound(),
                          ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
