import 'package:fertility_boost/common/common_widgets.dart';
import 'package:fertility_boost/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../controllers/pcos_quiz_assessment_controller.dart';

class PcosQuizAssessmentView extends GetView<PcosQuizAssessmentController> {
  const PcosQuizAssessmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: controller.title),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (controller.currentPageIndex.value != 0)
                    FloatingActionButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50.px),
                      ),
                      onPressed: () => controller.previousPage(),
                      child:
                          Icon(Icons.arrow_back_ios_new_rounded, size: 24.px),
                    ),
                  (controller.currentPageIndex.value !=
                          controller.getPcosAssessmentQuestionData.length - 1)
                      ? FloatingActionButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.px),
                          ),
                          onPressed: () => controller.nextPage(),
                          child: Icon(Icons.arrow_forward_ios_rounded,
                              size: 24.px),
                        )
                      : FloatingActionButton(
                          backgroundColor: Theme.of(context).primaryColor,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.px),
                          ),
                          onPressed: () => controller.donePage(),
                          child: Icon(Icons.done, size: 24.px),
                        ),
                ]),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(0.5.px), // Color of the shadow
                        spreadRadius: 5.px, // Spread radius
                        blurRadius: 7.px, // Blur radius
                        offset: Offset(0.px, 3.px), // Offset of the shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20.px),
                    border: Border.all(color: Theme.of(context).primaryColor)),
                child: controller.getPcosAssessmentQuestionData.isNotEmpty
                    ? PageView.builder(
                        onPageChanged: (value) {
                          controller.currentPageIndex.value = value;
                        },
                        controller: controller.pageController,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount:
                            controller.getPcosAssessmentQuestionData.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.all(20.px),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller
                                          .getPcosAssessmentQuestionData[index]
                                          .questionEn ??
                                      '',
                                  style: Theme.of(Get.context!)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 20.px),
                                ),
                                SizedBox(height: 8.px),
                                Expanded(
                                  child: ListView(
                                    children: List.generate(
                                        controller
                                            .getPcosAssessmentQuestionData[
                                                index]
                                            .option!
                                            .length,
                                        (indexAns) => controller
                                            .getPcosAssessmentQuestionData[
                                                index]
                                            .option![indexAns]).map((option) {
                                      return Obx(() {
                                        controller.count.value;
                                        return Theme(
                                          data: ThemeData(),
                                          child: RadioListTile<String>(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.px),
                                            ),
                                            contentPadding: EdgeInsets.zero,
                                            activeColor:
                                                Theme.of(context).primaryColor,
                                            title: Text(
                                              option.option ?? '',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineMedium
                                                  ?.copyWith(fontSize: 18.px),
                                            ),
                                            value: option.id ?? '',
                                            groupValue: controller
                                                .getPcosAssessmentQuestionData[
                                                    index]
                                                .optionId,
                                            onChanged: (value) {
                                              controller
                                                  .getPcosAssessmentQuestionData[
                                                      index]
                                                  .optionId = value;
                                              if (controller
                                                      .getPcosAssessmentQuestionData[
                                                          index]
                                                      .answer ==
                                                  option.option) {
                                                controller
                                                    .getPcosAssessmentQuestionData[
                                                        index]
                                                    .answerLocal = "true";
                                              } else {
                                                controller
                                                    .getPcosAssessmentQuestionData[
                                                        index]
                                                    .answerLocal = "false";
                                              }

                                              controller
                                                  .getPcosAssessmentQuestionData[
                                                      index]
                                                  .optionName = option.option;
                                              controller.increment();
                                            },
                                          ),
                                        );
                                      });
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Center(
                        child: CommonWidgets.dataNotFound(),
                      ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
