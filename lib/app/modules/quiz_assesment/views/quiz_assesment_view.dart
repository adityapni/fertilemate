import 'package:fertility_boost/common/common_widgets.dart';
import 'package:fertility_boost/common/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/apis/api_models/get_pcos_assessment_question_model.dart';
import '../controllers/quiz_assesment_controller.dart';

class QuizAssesmentView extends GetView<QuizAssesmentController> {
  const QuizAssesmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
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
                          onPressed: () => controller.submitQuiz(),
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
                    // Specify the background color of the container
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
                          return QuizCard(
                            question: controller
                                    .getPcosAssessmentQuestionData[index]
                                    .questionEn ??
                                '',
                            options: List.generate(
                                controller.getPcosAssessmentQuestionData[index]
                                    .option!.length,
                                (indexAns) => controller
                                    .getPcosAssessmentQuestionData[index]
                                    .option![indexAns]),
                            index: index,
                          );
                        },
                      )
                    : Center(child: CommonWidgets.dataNotFound()),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class QuizCard extends GetView<QuizAssesmentController> {
  final String question;
  final int index;
  List<GetPcosAssessmentQuestionOption> options = [];

  QuizCard(
      {super.key,
      required this.question,
      required this.options,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: Theme.of(Get.context!)
                .textTheme
                .displayMedium
                ?.copyWith(fontSize: 20.px),
          ),
          SizedBox(height: 8.px),
          Expanded(
            child: ListView(
              children: options.map((option) {
                return Theme(
                  data: ThemeData(),
                  child: RadioListTile<String>(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.px),
                    ),
                    contentPadding: EdgeInsets.zero,
                    activeColor: Theme.of(context).primaryColor,
                    title: Text(
                      option.option ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                    value: option.option ?? '',
                    groupValue: controller.answerList[index]['answer'],
                    onChanged: (value) {
                      //controller.selectedValue.value = value ?? '';
                      controller.changeAnswer(value, index);
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
/*
return Obx(() {
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: controller.title),
          body: controller.questions.isNotEmpty
              ? ListView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Column(
                        children: [
                          SizedBox(height: 20.px),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                if (controller.questions[index].options !=
                                        null &&
                                    controller
                                        .questions[index].options!.isNotEmpty) {
                                  controller.options =
                                      controller.questions[index].options ?? [];
                                }
                                if (controller.questions[index].options !=
                                        null &&
                                    controller
                                        .questions[index].options!.isNotEmpty) {
                                  controller.obj.add({
                                    controller.questions[index].questionId
                                            .toString():
                                        controller.questions[index].options
                                  });
                                }
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (controller.questions[index]
                                                .questionQuestion !=
                                            null &&
                                        controller.questions[index]
                                            .questionQuestion!.isNotEmpty)
                                      Text(
                                        controller
                                            .questions[index].questionQuestion
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 14.px,
                                            ),
                                      ),
                                    if (controller.questions[index]
                                                .questionQuestion !=
                                            null &&
                                        controller.questions[index]
                                            .questionQuestion!.isNotEmpty)
                                      SizedBox(height: 8.px),
                                    if (controller.options.isNotEmpty)
                                      SingleChildScrollView(
                                        child: Wrap(
                                          children: List.generate(
                                              controller.options.length,
                                              (indexAn) {
                                            return Padding(
                                              padding: EdgeInsets.all(4.px),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  if (controller
                                                          .questions[index]
                                                          .questionType
                                                          .toString() ==
                                                      ApiKeyConstants.radio)
                                                    Obx(() {
                                                      controller.count.value;
                                                      return Radio(
                                                        activeColor:
                                                            Theme.of(context)
                                                                .primaryColor,
                                                        groupValue: controller
                                                                .obj[index]
                                                            ['qOptionId'],
                                                        value: controller
                                                            .obj[index][
                                                                controller
                                                                    .questions[
                                                                        index]
                                                                    .questionId
                                                                    .toString()]
                                                                [indexAn]
                                                            .qOptionId,
                                                        onChanged: (newValue) {
                                                          controller.obj[index][
                                                                  'qOptionId'] =
                                                              controller
                                                                  .obj[index][
                                                                      controller
                                                                          .questions[
                                                                              index]
                                                                          .questionId
                                                                          .toString()]
                                                                      [indexAn]
                                                                  .qOptionId;
                                                          controller
                                                              .objectOfQuiz
                                                              .add({
                                                            controller
                                                                    .questions[
                                                                        index]
                                                                    .questionId
                                                                    .toString():
                                                                controller
                                                                    .obj[index][
                                                                        controller
                                                                            .questions[
                                                                                index]
                                                                            .questionId
                                                                            .toString()]
                                                                        [
                                                                        indexAn]
                                                                    .qOptionId
                                                          });
                                                          controller
                                                              .increment();
                                                        },
                                                      );
                                                    }),
                                                  if (controller
                                                          .questions[index]
                                                          .questionType
                                                          .toString() ==
                                                      ApiKeyConstants.checkBox)
                                                    Obx(() {
                                                      controller.count.value;
                                                      return Checkbox(
                                                        value: controller
                                                            .selectedIndexes
                                                            .contains(controller
                                                                .questions[
                                                                    index]
                                                                .options?[
                                                                    indexAn]
                                                                .qOptionId),
                                                        onChanged: (val) {
                                                          if (controller
                                                              .selectedIndexes
                                                              .contains(controller
                                                                  .questions[
                                                                      index]
                                                                  .options?[
                                                                      indexAn]
                                                                  .qOptionId)) {
                                                            controller
                                                                .selectedIndexes
                                                                .remove(controller
                                                                    .questions[
                                                                        index]
                                                                    .options?[
                                                                        indexAn]
                                                                    .qOptionId); // unselect
                                                          } else {
                                                            controller
                                                                .selectedIndexes
                                                                .add(controller
                                                                    .questions[
                                                                        index]
                                                                    .options?[
                                                                        indexAn]
                                                                    .qOptionId); // select
                                                          }
                                                          /*controller
                                                      .objectOfQuizCheckBox
                                                      .add({
                                                    controller.questions[index]
                                                        .questionId
                                                        .toString(): controller
                                                            .selectedIndexes[indexAn]
                                                  });*/
                                                          controller
                                                              .increment();
                                                        },
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.px),
                                                        ),
                                                        activeColor:
                                                            Theme.of(context)
                                                                .primaryColor,
                                                      );
                                                    }),
                                                  /*Obx(() {
                                              controller.count.value;
                                              return Checkbox(
                                                value: controller.objectOfQuizCheckBox.containsValue({
                                                  controller.questions[index]
                                                      .questionId
                                                      .toString():
                                                  controller
                                                      .questions[index]
                                                      .options?[indexAn]
                                                      .qOptionId
                                                }),
                                                onChanged: (val) {
                                                  controller.objectOfQuizCheckBox.forEach((key, value) {
                                                    print(key);
                                                    print(value);
                                                  });
                                                  print(controller.objectOfQuizCheckBox.containsKey({
                                                    controller.questions[index]
                                                        .questionId
                                                        .toString():
                                                    controller
                                                        .questions[index]
                                                        .options?[indexAn]
                                                        .qOptionId.toString()
                                                  }),);
                                                  if (controller.objectOfQuizCheckBox.containsValue({
                                                    controller.questions[index]
                                                        .questionId
                                                        .toString():
                                                    controller
                                                        .questions[index]
                                                        .options?[indexAn]
                                                        .qOptionId.toString()
                                                  })) {
                                                    controller
                                                        .objectOfQuizCheckBox
                                                        .remove({
                                                      controller
                                                              .questions[index]
                                                              .questionId
                                                              .toString():
                                                          controller
                                                              .questions[index]
                                                              .options?[indexAn]
                                                              .qOptionId.toString()
                                                    });
                                                  } else {
                                                    controller
                                                        .objectOfQuizCheckBox
                                                        .addAll({
                                                      controller
                                                              .questions[index]
                                                              .questionId
                                                              .toString():
                                                          controller
                                                              .questions[index]
                                                              .options?[indexAn]
                                                              .qOptionId.toString()
                                                    });
                                                  }
                                                  controller.increment();
                                                },
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.px),
                                                ),
                                                activeColor: Theme.of(context)
                                                    .primaryColor,
                                              );
                                            }),*/
                                                  Text(
                                                    controller.options[indexAn]
                                                        .qOptionName
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                          fontSize: 14.px,
                                                        ),
                                                  )
                                                ],
                                              ),
                                            );
                                          }),
                                        ),
                                      ),
                                    SizedBox(height: 8.px),
                                  ],
                                );
                              },
                              itemCount: controller.questions.length),
                          if (controller.questionsModel != null)
                            SizedBox(height: 20.px),
                          if (controller.questionsModel != null)
                            CommonWidgets.commonElevatedButton(
                              onPressed: () => controller.clickOnSubmitButton(),
                              child: Text(
                                StringConstants.submit,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          SizedBox(height: 20.px),
                        ],
                      ),
                    ),
                  ],
                )
              : controller.questionsModel == null
                  ? const SizedBox()
                  : Center(
                      child: CommonWidgets.dataNotFound(),
                    ),
        ),
      );
    });*/
