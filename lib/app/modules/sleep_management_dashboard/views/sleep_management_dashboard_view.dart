import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/sleep_management_dashboard_controller.dart';

class SleepManagementDashboardView
    extends GetView<SleepManagementDashboardController> {
  const SleepManagementDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'Sleep Soundtracks'),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10.px),
                    /*
                    Container(
                      padding: EdgeInsets.all(20.px),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.4.px),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          */ /*Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30.px),
                                child: Image.asset(
                                  ImageConstants.imageGirl,
                                  height: 60.px,
                                  width: 60.px,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 14.px),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      StringConstants.sleepWell,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 20.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    SizedBox(height: 8.px),
                                    Text(
                                      'Not data',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 14.px,
                                          ),
                                    ),
                                    SizedBox(height: 20.px),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 24.px),*/ /*
                          Text(
                            "You've listened to 7 soothing",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 16.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(height: 10.px),
                          Text(
                            '80% of your weekly sleep goal is completed',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 10.px),
                          ),
                          SizedBox(height: 20.px),
                          LinearProgressIndicator(
                            color: Theme.of(context).primaryColor,
                            value: .5,
                            minHeight: 8.px,
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.4.px),
                            borderRadius: BorderRadius.circular(10.px),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24.px),*/
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      onChanged: (value) =>
                          controller.searchMethod(value: value),
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
                      /* suffixIcon: Image.asset(
                        IconConstants.icFilter,
                        height: 24.px,
                        width: 24.px,
                      ),*/
                    ),
                    if (controller.getRecommendedSoundtracksResult.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.getRecommendedSoundtracksResult.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              StringConstants.recommendedSoundtracks,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          ),
                          /*Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  controller.clickOnPreviousIconInList(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 18.px,
                              ),
                              splashRadius: 18.px,
                            ),
                            IconButton(
                              onPressed: () =>
                                  controller.clickOnNextIconInList(),
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.px,
                              ),
                              splashRadius: 18.px,
                            ),
                          ],
                        )*/
                        ],
                      ),
                    if (controller.getRecommendedSoundtracksResult.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.getRecommendedSoundtracksResult.isNotEmpty)
                      SizedBox(
                        height: 180,
                        width: double.infinity,
                        child: controller.searchResult.isNotEmpty ||
                                controller.searchController.text.isNotEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.searchResult.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () => controller
                                      .clickOnSearchResultCard(index: index),
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8.px),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.4.px,
                                      height: 180.px,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20.px),
                                      ),
                                      child: Stack(
                                        children: [
                                          CommonWidgets.imageView(
                                              image: controller
                                                  .searchResult[index].image
                                                  .toString(),
                                              height: double.infinity,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.4.px,
                                              fit: BoxFit.cover,
                                              radius: 20.px),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8.px),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.px),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            8.px),
                                                        child: Center(
                                                          child: Text(
                                                            StringConstants
                                                                .premium,
                                                            maxLines: 1,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displayMedium
                                                                ?.copyWith(
                                                                  fontSize:
                                                                      14.px,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.px),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            8.px),
                                                        child: Center(
                                                          child: Text(
                                                            controller
                                                                .searchResult[
                                                                    index]
                                                                .rating
                                                                .toString(),
                                                            maxLines: 1,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displayMedium
                                                                ?.copyWith(
                                                                  fontSize:
                                                                      14.px,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                // height: 70.px,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.px),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.px),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .searchResult[index]
                                                            .title
                                                            .toString(),
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium
                                                            ?.copyWith(
                                                                fontSize: 16.px,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                      ),
                                                      SizedBox(height: 4.px),
                                                      Text(
                                                        controller
                                                            .searchResult[index]
                                                            .description
                                                            .toString(),
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium
                                                            ?.copyWith(
                                                                fontSize:
                                                                    10.px),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller
                                    .getRecommendedSoundtracksResult.length,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () => controller.clickOnResultCard(
                                      index: index),
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 8.px),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          1.4.px,
                                      height: 180.px,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(20.px),
                                      ),
                                      child: Stack(
                                        children: [
                                          CommonWidgets.imageView(
                                              image: controller
                                                  .getRecommendedSoundtracksResult[
                                                      index]
                                                  .image
                                                  .toString(),
                                              height: double.infinity,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.4.px,
                                              fit: BoxFit.cover,
                                              radius: 20.px),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(8.px),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.px),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            8.px),
                                                        child: Center(
                                                          child: Text(
                                                            StringConstants
                                                                .premium,
                                                            maxLines: 1,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displayMedium
                                                                ?.copyWith(
                                                                  fontSize:
                                                                      14.px,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Theme.of(context)
                                                            .scaffoldBackgroundColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.px),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            8.px),
                                                        child: Center(
                                                          child: Text(
                                                            controller
                                                                .getRecommendedSoundtracksResult[
                                                                    index]
                                                                .rating
                                                                .toString(),
                                                            maxLines: 1,
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .displayMedium
                                                                ?.copyWith(
                                                                  fontSize:
                                                                      14.px,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                // height: 70.px,
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.px),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.px),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                            .getRecommendedSoundtracksResult[
                                                                index]
                                                            .title
                                                            .toString(),
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium
                                                            ?.copyWith(
                                                                fontSize: 16.px,
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                      ),
                                                      SizedBox(height: 4.px),
                                                      Text(
                                                        controller
                                                            .getRecommendedSoundtracksResult[
                                                                index]
                                                            .description
                                                            .toString(),
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleMedium
                                                            ?.copyWith(
                                                                fontSize:
                                                                    10.px),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    /*if (controller.result.isNotEmpty) SizedBox(height: 10.px),
                    if (controller.result.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              StringConstants.gentleRaindrops,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          ),
                          */ /*Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  controller.clickOnPreviousIconInList(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 18.px,
                              ),
                              splashRadius: 18.px,
                            ),
                            IconButton(
                              onPressed: () =>
                                  controller.clickOnNextIconInList(),
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.px,
                              ),
                              splashRadius: 18.px,
                            ),
                          ],
                        )*/ /*
                        ],
                      ),
                    if (controller.result.isNotEmpty) SizedBox(height: 10.px),
                    if (controller.result.isNotEmpty)
                      SizedBox(
                        height: 200.px,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(left: 8.px),
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
                                    radius: 20.px,
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                    image: controller.result[index].smstImage
                                        .toString(),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.px),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.px),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.px),
                                                child: Center(
                                                  child: Text(
                                                    '4.9',
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                          fontSize: 14.px,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
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
                                                    .result[index].smstName
                                                    .toString(),
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                        fontSize: 16.px,
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                              ),
                                              SizedBox(height: 4.px),
                                              Text(
                                                controller.result[index]
                                                    .smstDescription
                                                    .toString(),
                                                maxLines: 1,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium
                                                    ?.copyWith(fontSize: 10.px),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          itemCount: controller.result.length,
                        ),
                      ),*/
                    if (controller.getSoundtrackCategoriesResult.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.getSoundtrackCategoriesResult.isNotEmpty)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              StringConstants.soundtrackCategories,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          ),
                          /*Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  controller.clickOnPreviousIconInList(),
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 18.px,
                              ),
                              splashRadius: 18.px,
                            ),
                            IconButton(
                              onPressed: () =>
                                  controller.clickOnNextIconInList(),
                              icon: Icon(
                                Icons.arrow_forward_ios,
                                size: 18.px,
                              ),
                              splashRadius: 18.px,
                            ),
                          ],
                        )*/
                        ],
                      ),
                    if (controller.getSoundtrackCategoriesResult.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.getSoundtrackCategoriesResult.isNotEmpty)
                      SizedBox(
                        height: 100.px,
                        width: double.infinity,
                        child: Obx(() {
                          controller.count.value;
                          return Center(
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: controller
                                  .getSoundtrackCategoriesResult.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () =>
                                      controller.clickOnCard(index: index),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.px),
                                    child: controller.cards(
                                      index: index,
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                      ),
                    SizedBox(height: 40.px),
                    /* CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnBackNow(),
                      child: Text(
                        StringConstants.back,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 10.px),*/
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
