import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/health_assessment_controller.dart';

class HealthAssessmentView extends GetView<HealthAssessmentController> {
  const HealthAssessmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar:
              CommonWidgets.appBarView(title: StringConstants.healthAssessment),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              children: [
                SizedBox(height: 20.px),
                if (controller.data.isNotEmpty)
                  Expanded(
                    child: ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Obx(() {
                              controller.count.value;
                              return Card(
                                elevation: .4.px,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.px)),
                                color: controller.selectedCard.value == index
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(10.px),
                                  onTap: () =>
                                      controller.clickOnCard(index: index),
                                  child: Padding(
                                    padding: EdgeInsets.all(20.px),
                                    child: Text(
                                      controller.data[index].categoryName
                                          .toString(),
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 16.px,
                                            color: controller
                                                        .selectedCard.value !=
                                                    index
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                          ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                        itemCount: controller.data.length),
                  ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
