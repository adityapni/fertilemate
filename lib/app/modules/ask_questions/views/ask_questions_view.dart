import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/ask_questions_controller.dart';

class AskQuestionsView extends GetView<AskQuestionsController> {
  const AskQuestionsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.askQuestions),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.searchController,
                      borderRadius: 15.px,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2),
                      hintText: StringConstants.search,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconConstants.icSearch,
                            height: 24.px,
                            width: 24.px,
                          ),
                        ],
                      ),
                      /*suffixIcon: Image.asset(
                        IconConstants.icFilter,
                        height: 24.px,
                        width: 24.px,
                      ),*/
                    ),

                    SizedBox(height: 20.px),
                  ],
                ),
              ),
              if (controller.chat.isNotEmpty)
                ListView.builder(
                  itemCount: controller.chat.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    /*if (controller.chat[index].otherUserId !=
                        controller.userId)*/
                    {
                      return controller.chat[index].userData != null
                          ? ListTile(
                              onTap: () =>
                                  controller.clickOnListTile(index: index),
                              leading: CommonWidgets.imageView(
                                  image: controller.chat[index].userData!.image
                                      .toString(),
                                  height: 40.px,
                                  width: 40.px,
                                  radius: 20.px),
                              title: Text(
                                controller.chat[index].userData!.userName
                                    .toString(),
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 16.px),
                              ),
                              subtitle: Text(
                                controller.chat[index].latestMessage.toString(),
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 14.px),
                              ),
                              trailing: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    DateFormat.Hm().format(
                                      DateTime.parse(
                                        controller.chat[index].latestDate
                                            .toString(),
                                      ),
                                    ),
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                  /* Container(
                          height: 20.px,
                          width: 20.px,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.px),
                              color: Theme.of(context).primaryColor),
                          child: Center(
                            child: Text(
                              "2",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 10.px,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor),
                            ),
                          ),
                        ),*/
                                ],
                              ),
                            )
                          : const SizedBox();
                    }
                    // return null;
                  },
                ),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }
}
