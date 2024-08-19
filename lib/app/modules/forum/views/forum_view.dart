import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/forum_controller.dart';

class ForumView extends GetView<ForumController> {
  const ForumView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: ListView(
              children: [
                SizedBox(height: 20.px),
                Text(
                  StringConstants.questions,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 18.px,
                      ),
                ),
                SizedBox(height: 20.px),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(15.px),
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.2.px),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            controller.getForumQuestionAnswerModel?.question ??
                                '',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px)),
                        SizedBox(height: 4.px),
                        Text(
                            "Posted by: ${controller.getForumQuestionAnswerModel?.userName ?? ''}",
                            style: Theme.of(context).textTheme.titleMedium)
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20.px),
                if (controller.data.isNotEmpty)
                  Text(
                    StringConstants.answers,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 18.px),
                  ),
                if (controller.data.isNotEmpty) SizedBox(height: 20.px),
                if (controller.data.isNotEmpty)
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, dataIndex) => Padding(
                      padding: EdgeInsets.only(bottom: 8.px),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(15.px),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(0.2.px),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(10.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.data[dataIndex].userName.toString(),
                                maxLines: 2,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 16.px),
                              ),
                              SizedBox(height: 4.px),
                              Text(
                                controller.data[dataIndex].answer.toString(),
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 14.px),
                              ),
                              SizedBox(height: 4.px),
                            ],
                          ),
                        ),
                      ),
                    ),
                    itemCount: controller.data.length,
                  ),
                SizedBox(height: 10.px),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.px),
                    border: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.2.px),
                    ),
                  ),
                  padding: EdgeInsets.all(4.px),
                  child: Column(
                    children: [
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        controller: controller.textControllers,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.2.px),
                        hintText: 'Type your answer here',
                      ),
                      SizedBox(height: 14.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnPostButton(),
                        child: Text(
                          StringConstants.post,
                          style: Theme.of(Get.context!)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 12.px,
                                fontWeight: FontWeight.w600,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.px),
              ],
            ),
          ),
        ),
      );
    });
  }
}
