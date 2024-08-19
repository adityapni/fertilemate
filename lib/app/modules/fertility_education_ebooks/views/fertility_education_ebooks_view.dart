import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_education_ebooks_controller.dart';

class FertilityEducationEbooksView
    extends GetView<FertilityEducationEbooksController> {
  const FertilityEducationEbooksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.fertilityEducation),
          body: ListView(
            children: [
              if (controller.data != null)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CommonWidgets.imageView(
                          image: controller.data!.febImage.toString(),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 1.75.px,
                        ),
                        GestureDetector(
                          onTap: () => controller.clickOnBookmarkIcon(),
                          child: Container(
                            width: 50.px,
                            height: 50.px,
                            margin: EdgeInsets.all(20.px),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(25.px),
                            ),
                            child: Icon(
                                controller.data?.saveStatus == true
                                    ? Icons.bookmark
                                    : Icons.bookmark_border,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                          ),
                        )
                        /* Container(
                          margin: EdgeInsets.all(24.px),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(20.px),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(14.px),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "5 essential facts about fertility",
                                  maxLines: 1,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 20.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                                SizedBox(height: 4.px),
                                Divider(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(.4.px),
                                    thickness: 1),
                                SizedBox(height: 8.px),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CommonWidgets.commonElevatedButton(
                                      wantContentSizeButton: true,
                                      onPressed: () =>
                                          controller.clickOnLearnButton(),
                                      child: Text(
                                        StringConstants.learn,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                    CommonWidgets.commonElevatedButton(
                                      wantContentSizeButton: true,
                                      onPressed: () =>
                                          controller.clickOnResourcesButton(),
                                      child: Text(
                                        StringConstants.resources,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.px),
                                Text(
                                  '5 min read',
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(fontSize: 10.px),
                                ),
                              ],
                            ),
                          ),
                        ),*/
                      ],
                    ),
                    if (controller.data!.febShorDescription != null &&
                        controller.data!.febShorDescription!.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.all(20.px),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(.2.px),
                            borderRadius: BorderRadius.circular(20.px),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.px),
                            child: Html(
                              data: controller.data!.febShorDescription
                                  .toString(),
                            ),
                          ),
                        ),
                      ),
                    SizedBox(height: 10.px),
                    if (controller.data!.febDescription != null &&
                        controller.data!.febDescription!.isNotEmpty)
                      Html(
                        data: controller.data!.febDescription.toString(),
                      ),
                    SizedBox(height: 10.px),
                  ],
                ),
            ],
          ),
        ),
      );
    });
  }
}
