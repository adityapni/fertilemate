import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/intimacy_management_language_of_love_quotes_controller.dart';

class IntimacyManagementLanguageOfLoveQuotesView
    extends GetView<IntimacyManagementLanguageOfLoveQuotesController> {
  const IntimacyManagementLanguageOfLoveQuotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.languageOfLoveQuotes),
          body: ListView(
            children: [
              SizedBox(height: 40.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.result.isNotEmpty) SizedBox(height: 10.px),
                    if (controller.result.isNotEmpty)
                      Text(
                        StringConstants.discoverThePowerOfWordsToIgnitePassion,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    if (controller.result.isNotEmpty) SizedBox(height: 10.px),
                    if (controller.result.isNotEmpty)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.4.px),
                          ),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.all(10.px),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        StringConstants
                                            .expressYourLoveWithBeautifulQuotes,
                                        maxLines: 3,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 16.px,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                      SizedBox(height: 10.px),
                                      CommonWidgets.commonElevatedButton(
                                        wantContentSizeButton: true,
                                        onPressed: () =>
                                            controller.clickOnExploreButton(),
                                        child: Text(
                                          StringConstants.explore,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall
                                              ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Image.asset(
                                    ImageConstants.imageBeautifulQuotes,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (controller.result.isNotEmpty) SizedBox(height: 10.px),
                    if (controller.result.isNotEmpty)
                      Text(
                        StringConstants.chooseByYourMood,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    if (controller.result.isNotEmpty) SizedBox(height: 10.px),
                  ],
                ),
              ),
              if (controller.result.isNotEmpty)
                Wrap(
                  children: List.generate(
                    controller.result.length,
                    (index) => GestureDetector(
                      onTap: () => controller.clickOnCard(index: index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.px, vertical: 8.px),
                        child: Container(
                          height: 120.px,
                          width: MediaQuery.of(context).size.width / 2.3.px,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.4.px),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(8.px),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CommonWidgets.imageView(
                                  image:
                                      controller.result[index].image.toString(),
                                  height: 50.px,
                                  width: 50.px,
                                ),
                                Text(
                                  controller.result[index].name.toString(),
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 18.px,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
