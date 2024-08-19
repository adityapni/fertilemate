import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/intimacy_management_love_language_sub_category_controller.dart';

class IntimacyManagementLoveLanguageSubCategoryView
    extends GetView<IntimacyManagementLoveLanguageSubCategoryController> {
  const IntimacyManagementLoveLanguageSubCategoryView({Key? key})
      : super(key: key);

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
                  fillColor:
                      Theme.of(context).colorScheme.onSecondary.withOpacity(.2),
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
                            child: GestureDetector(
                              onTap: () => controller.clickOnCard(
                                  result: controller.searchResult[index]),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonWidgets.imageView(
                                      image: controller
                                          .searchResult[index].image
                                          .toString(),
                                      height: 140.px,
                                      width: double.infinity,
                                      radius: 20.px,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.px),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              controller
                                                  .searchResult[index].name
                                                  .toString(),
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(fontSize: 14.px),
                                            ),
                                          ),
                                          /* Expanded(
                                            child: Text(
                                              controller
                                                  .searchResult[index].status
                                                  .toString(),
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(fontSize: 12.px),
                                            ),
                                          ),*/
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
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.px),
                            child: GestureDetector(
                              onTap: () => controller.clickOnCard(
                                  result: controller.result[index]),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonWidgets.imageView(
                                      image: controller.result[index].image
                                          .toString(),
                                      height: 140.px,
                                      width: double.infinity,
                                      radius: 20.px,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(10.px),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              controller.result[index].name
                                                  .toString(),
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.copyWith(fontSize: 14.px),
                                            ),
                                          ),
                                          /* Expanded(
                                            child: Text(
                                              controller.result[index].status
                                                  .toString(),
                                              maxLines: 2,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.copyWith(fontSize: 12.px),
                                            ),
                                          ),*/
                                        ],
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
              /*SizedBox(height: 10.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Text(
                  StringConstants.yourPersonalizedRecommendations,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px,
                      ),
                ),
              ),
              SizedBox(height: 10.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: SizedBox(
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
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(20.px),
                        ),
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.asset(
                              height: double.infinity,
                              width: double.infinity,
                              ImageConstants.imageConfirmBooking,
                              fit: BoxFit.cover,
                            ),
                            Container(
                              width: double.infinity,
                              height: 60.px,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(20.px),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10.px),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Intimate Connection",
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
                          ],
                        ),
                      ),
                    ),
                    itemCount: 10,
                  ),
                ),
              ),*/
              SizedBox(height: 10.px),
            ],
          ),
        ),
      );
    });
  }
}
