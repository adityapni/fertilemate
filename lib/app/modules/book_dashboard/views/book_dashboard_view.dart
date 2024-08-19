import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/book_dashboard_controller.dart';

class BookDashboardView extends GetView<BookDashboardController> {
  const BookDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
            body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180.px,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          StringConstants.enhanceIntimacyAndConnection,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 24.px,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                        ),
                        SizedBox(height: 30.px),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    children: [
                      SizedBox(height: 160.px),
                      CommonWidgets.commonTextFieldForLoginSignUP(
                        onChanged: (value) =>
                            controller.searchMethod(value: value),
                        controller: controller.searchController,
                        borderRadius: 15.px,
                        fillColor: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(.2),
                        hintText: StringConstants.search,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  if (controller.resultDate.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Text(
                        StringConstants.nearbyClassesAndSpas,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    ),
                  if (controller.resultDate.isNotEmpty) SizedBox(height: 10.px),
                  if (controller.resultDate.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: SizedBox(
                        height: 160.px,
                        child: controller.searchResult.isNotEmpty ||
                                controller.searchController.text.isNotEmpty
                            ? ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () =>
                                      controller.clickOnNearbyClassesAndSpas(
                                          index: index),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.px),
                                    child: Container(
                                      width: 200.px,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.px),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(.4.px),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonWidgets.imageView(
                                            height: 100.px,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            image: controller
                                                .searchResult[index]
                                                .smzbpProvidersImage
                                                .toString(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4.px),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.searchResult[index]
                                                      .smzbpProvidersName
                                                      .toString(),
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                        fontSize: 14.px,
                                                      ),
                                                ),
                                                SizedBox(height: 8.px),
                                                Text(
                                                  'Duration: ${controller.searchResult[index].duration.toString()}',
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                              ],
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
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                  onTap: () =>
                                      controller.clickOnNearbyClassesAndSpas(
                                          index: index),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 8.px),
                                    child: Container(
                                      width: 200.px,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.px),
                                        border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(.4.px),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonWidgets.imageView(
                                            height: 100.px,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            image: controller.resultDate[index]
                                                .smzbpProvidersImage
                                                .toString(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(4.px),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller.resultDate[index]
                                                      .smzbpProvidersName
                                                      .toString(),
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                        fontSize: 14.px,
                                                      ),
                                                ),
                                                SizedBox(height: 8.px),
                                                Text(
                                                  'Duration: ${controller.resultDate[index].duration.toString()}',
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                itemCount: controller.resultDate.length,
                              ),
                      ),
                    ),
                  if (controller.resultZenBookLocationCategory.isNotEmpty)
                    SizedBox(height: 20.px),
                  if (controller.resultZenBookLocationCategory.isNotEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Text(
                        StringConstants.locationZenStudio,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    ),
                  if (controller.resultZenBookLocationCategory.isNotEmpty)
                    SizedBox(height: 10.px),
                  if (controller.resultZenBookLocationCategory.isNotEmpty)
                    SizedBox(
                      height: 100.px,
                      width: double.infinity,
                      child: Obx(() {
                        controller.count.value;
                        return Center(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                controller.resultZenBookLocationCategory.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.px),
                                  child: cards(
                                    index: index,
                                    textString: controller
                                        .resultZenBookLocationCategory[index]
                                        .name
                                        .toString(),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                  SizedBox(height: 10.px),
                ],
              ),
            ),
          ],
        )),
      );
    });
  }

  Widget cards({
    required String textString,
    required int index,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CommonWidgets.imageView(
            image: controller.resultZenBookLocationCategory[index].image
                .toString(),
            width: 64.px,
            height: 64.px),
        SizedBox(height: 4.px),
        Text(
          textString,
          style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
              fontSize: 12.px, color: Theme.of(Get.context!).primaryColor),
        ),
      ],
    );
  }
}
