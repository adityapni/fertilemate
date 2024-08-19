import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/intimacy_management_communication_tips_controller.dart';

class IntimacyManagementCommunicationTipsView
    extends GetView<IntimacyManagementCommunicationTipsController> {
  const IntimacyManagementCommunicationTipsView({super.key});

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
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                  onChanged: (value) => controller.searchMethod(value: value),
                  controller: controller.searchController,
                  borderRadius: 15.px,
                  fillColor: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.2.px),
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
              ),
              SizedBox(height: 20.px),
              if (controller.result.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: controller.searchResult.isNotEmpty ||
                          controller.searchController.text.isNotEmpty
                      ? ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.px),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.4.px),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () => controller.clickOnCard(
                                    result: controller.searchResult[index]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*  if (controller.result[index].imbImage != null &&
                                  controller.result[index].imbImage!.isNotEmpty)
                                CommonWidgets.imageView(
                                  image: controller.result[index].imbImage
                                      .toString(),
                                  radius: 20.px,
                                  height: 140.px,
                                  width: double.infinity,
                                ),*/
                                    Stack(
                                      children: [
                                        CommonWidgets.imageView(
                                          image: controller
                                              .searchResult[index].imbImage
                                              .toString(),
                                          height: 140.px,
                                          width: double.infinity,
                                          radius: 20.px,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: () =>
                                                controller.clickOnSaveButton(
                                                    index: index),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.px),
                                              child: Container(
                                                height: 34.px,
                                                width: 34.px,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.px),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    color: /*controller.saveValue.value*/
                                                        'No' ==
                                                                controller
                                                                    .searchResult[
                                                                        index]
                                                                    .saved
                                                                    .toString()
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .onSecondary
                                                                .withOpacity(
                                                                    .8.px)
                                                            : Theme.of(context)
                                                                .primaryColor,
                                                    IconConstants.icSaveGrey,
                                                    height: 18.px,
                                                    width: 18.px,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (controller
                                                .searchResult[index].imbTitle !=
                                            null &&
                                        controller.searchResult[index].imbTitle!
                                            .isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.all(10.px),
                                        child: Text(
                                          controller
                                              .searchResult[index].imbTitle
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          itemCount: controller.searchResult.length,
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.px),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.px),
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.4.px),
                                ),
                              ),
                              child: GestureDetector(
                                onTap: () => controller.clickOnCard(
                                    result: controller.result[index]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /*  if (controller.result[index].imbImage != null &&
                                  controller.result[index].imbImage!.isNotEmpty)
                                CommonWidgets.imageView(
                                  image: controller.result[index].imbImage
                                      .toString(),
                                  radius: 20.px,
                                  height: 140.px,
                                  width: double.infinity,
                                ),*/
                                    Stack(
                                      children: [
                                        CommonWidgets.imageView(
                                          image: controller
                                              .result[index].imbImage
                                              .toString(),
                                          height: 140.px,
                                          width: double.infinity,
                                          radius: 20.px,
                                          fit: BoxFit.cover,
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: GestureDetector(
                                            onTap: () =>
                                                controller.clickOnSaveButton(
                                                    index: index),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.px),
                                              child: Container(
                                                height: 34.px,
                                                width: 34.px,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.px),
                                                ),
                                                child: Center(
                                                  child: Image.asset(
                                                    color: /*controller.saveValue.value*/
                                                        'No' ==
                                                                controller
                                                                    .result[
                                                                        index]
                                                                    .saved
                                                                    .toString()
                                                            ? Theme.of(context)
                                                                .colorScheme
                                                                .onSecondary
                                                                .withOpacity(
                                                                    .8.px)
                                                            : Theme.of(context)
                                                                .primaryColor,
                                                    IconConstants.icSaveGrey,
                                                    height: 18.px,
                                                    width: 18.px,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    if (controller.result[index].imbTitle !=
                                            null &&
                                        controller
                                            .result[index].imbTitle!.isNotEmpty)
                                      Padding(
                                        padding: EdgeInsets.all(10.px),
                                        child: Text(
                                          controller.result[index].imbTitle
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          itemCount: controller.result.length,
                        ),
                ),
              if (controller.getRecommendationBlogsResult.isNotEmpty)
                SizedBox(height: 10.px),
              if (controller.getRecommendationBlogsResult.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Text(
                    StringConstants.yourPersonalizedRecommendations,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
              if (controller.getRecommendationBlogsResult.isNotEmpty)
                SizedBox(height: 10.px),
              if (controller.getRecommendationBlogsResult.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: SizedBox(
                    height: 200.px,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(left: 8.px),
                        child: GestureDetector(
                          onTap: () => controller.clickOnCard(
                              result: controller
                                  .getRecommendationBlogsResult[index]),
                          child: Container(
                            width: MediaQuery.of(context).size.width / 2.4.px,
                            height: 180.px,
                            decoration: BoxDecoration(
                              // color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20.px),
                            ),
                            child: Stack(
                              children: [
                                CommonWidgets.imageView(
                                  image: controller
                                      .getRecommendationBlogsResult[index]
                                      .imbImage
                                      .toString(),
                                  height: double.infinity,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  radius: 20.px,
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    width: double.infinity,
                                    height: 60.px,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                      borderRadius:
                                          BorderRadius.circular(20.px),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(10.px),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            controller
                                                .getRecommendationBlogsResult[
                                                    index]
                                                .imbTitle
                                                .toString(),
                                            maxLines: 2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 16.px,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: controller.getRecommendationBlogsResult.length,
                    ),
                  ),
                ),
              SizedBox(height: 10.px),
            ],
          ),
        ),
      );
    });
  }
}
