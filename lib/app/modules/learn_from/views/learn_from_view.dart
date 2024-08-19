import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/learn_from_controller.dart';

class LearnFromView extends GetView<LearnFromController> {
  const LearnFromView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'Learn From'),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
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
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconConstants.icSearch,
                            height: 24.px,
                            width: 24.px,
                          ),
                        ],
                      ),
                    ),
                    if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                    if (controller.result.isNotEmpty)
                      controller.searchResult.isNotEmpty ||
                              controller.searchController.text.isNotEmpty
                          ? ListView.builder(
                              itemCount: controller.searchResult.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.px),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(6.px),
                                  onTap: () =>
                                      controller.clickOnCard(index: index),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: CommonWidgets.imageView(
                                            image: controller
                                                .searchResult[index].image
                                                .toString(),
                                            height: 78.px,
                                            width: 100.px,
                                            fit: BoxFit.cover,
                                            radius: 6.px),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.px),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller
                                                    .searchResult[index].title
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                      fontSize: 12.px,
                                                    ),
                                              ),
                                              SizedBox(height: 14.px),
                                              Text(
                                                controller.searchResult[index]
                                                    .description
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      fontSize: 10.px,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Image.asset(
                                            IconConstants.icRightArrow,
                                            height: 24.px,
                                            width: 24.px,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.result.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.px),
                                ),
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(6.px),
                                  onTap: () =>
                                      controller.clickOnCard(index: index),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: CommonWidgets.imageView(
                                            image: controller
                                                .result[index].image
                                                .toString(),
                                            height: 78.px,
                                            width: 100.px,
                                            fit: BoxFit.cover,
                                            radius: 6.px),
                                      ),
                                      Expanded(
                                        flex: 6,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 12.px),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.result[index].title
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .displayMedium
                                                    ?.copyWith(
                                                      fontSize: 12.px,
                                                    ),
                                              ),
                                              SizedBox(height: 14.px),
                                              Text(
                                                controller
                                                    .result[index].description
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall
                                                    ?.copyWith(
                                                      fontSize: 10.px,
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Center(
                                          child: Image.asset(
                                            IconConstants.icRightArrow,
                                            height: 24.px,
                                            width: 24.px,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    if (controller.result.isNotEmpty) SizedBox(height: 20.px),
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
