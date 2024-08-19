import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/forum_topics_list_controller.dart';

class ForumTopicsListView extends GetView<ForumTopicsListController> {
  const ForumTopicsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          /* floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () => controller.clickOnAddQuestion(),
            child: Icon(
              Icons.chat_outlined,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),*/
          appBar: CommonWidgets.appBarView(
            title: controller.title,
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              children: [
                SizedBox(height: 20.px),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    StringConstants.askAQuestions,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
                SizedBox(height: 20.px),
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
                        hintText: 'Type your question here',
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
                SizedBox(height: 20.px),
                if (controller.data.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringConstants.trendingQuestions,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                              ),
                    ),
                  ),
                if (controller.data.isNotEmpty) SizedBox(height: 20.px),
                controller.data.isNotEmpty
                    ? Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(bottom: 8.px),
                            child: ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12.px),
                                side: BorderSide(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(0.2.px),
                                ),
                              ),
                              /*leading: CommonWidgets.imageView(
                                height: 50.px,
                                width: 50.px,
                                image: ImageConstants.defaultNetworkImage,
                                borderRadius: BorderRadius.circular(25.px),
                              ),*/
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 4.px),
                              trailing: (controller.data[index].userId
                                          .toString() ==
                                      controller.userId)
                                  ? GestureDetector(
                                      onTap: () => controller
                                          .clickOnDeleteButton(index: index),
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.px),
                                              border: Border.all(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.px),
                                              child: Icon(
                                                Icons.delete_outline_outlined,
                                                color: Theme.of(context)
                                                    .primaryColor,
                                                size: 20.px,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  : null,
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(controller.data[index].question ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(fontSize: 14.px)),
                                  SizedBox(height: 4.px),
                                  Text(
                                      "Posted by: ${controller.data[index].userName ?? ''}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium)
                                ],
                              ),
                              subtitle: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Answers: ${controller.data[index].count ?? ''}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium),
                                  CommonWidgets.commonElevatedButton(
                                    wantContentSizeButton: true,
                                    onPressed: () =>
                                        controller.clickOnView(index: index),
                                    child: Text(
                                      StringConstants.view,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: controller.data.length,
                        ),
                      )
                    : controller.getForumDiscussionModel == null
                        ? const SizedBox()
                        : Center(
                            child: CommonWidgets.dataNotFound(),
                          )
              ],
            ),
          ),
        ),
      );
    });
  }
}
