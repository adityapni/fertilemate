import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/find_peace_detail_controller.dart';

class FindPeaceDetailView extends GetView<FindPeaceDetailController> {
  const FindPeaceDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: controller.title),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: (controller.result.isNotEmpty)
                ? Column(
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
                      SizedBox(height: 20.px),
                      if (controller.result.isNotEmpty)
                        controller.searchResult.isNotEmpty ||
                                controller.searchController.text.isNotEmpty
                            ? SingleChildScrollView(
                                child: Wrap(
                                  children: List.generate(
                                      controller.searchResult.length, (index) {
                                    final cellWidth =
                                        MediaQuery.of(Get.context!).size.width /
                                            2.2.px;
                                    return SizedBox(
                                      width: cellWidth,
                                      child: GestureDetector(
                                        /* onTap: () => controller.clickOnCard(
                              id: controller.searchResult[index].id!,
                              title:
                                  controller.searchResult[index].clinicName!),*/
                                        child: Padding(
                                          padding: EdgeInsets.all(4.px),
                                          child: Container(
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
                                              children: [
                                                CommonWidgets.imageView(
                                                    height: 90.px,
                                                    fit: BoxFit.cover,
                                                    image: controller
                                                        .searchResult[index]
                                                        .image
                                                        .toString(),
                                                    radius: 20.px),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.all(12.px),
                                                  child: Text(
                                                    controller
                                                        .searchResult[index]
                                                        .title
                                                        .toString(),
                                                    maxLines: 2,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 14.px,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Wrap(
                                  children: List.generate(
                                      controller.result.length, (index) {
                                    final cellWidth =
                                        MediaQuery.of(Get.context!).size.width /
                                            2.2.px;
                                    return SizedBox(
                                      width: cellWidth,
                                      child: GestureDetector(
                                        onTap: () => controller.clickOnCard(
                                            id: controller.result[index].id!,
                                            title: controller.result[index]
                                                .peaceSubCategoryName!),
                                        child: Padding(
                                          padding: EdgeInsets.all(4.px),
                                          child: Container(
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
                                              children: [
                                                CommonWidgets.imageView(
                                                    height: 90.px,
                                                    fit: BoxFit.cover,
                                                    image: controller
                                                        .result[index].image
                                                        .toString(),
                                                    radius: 20.px),
                                                Padding(
                                                  padding:
                                                      EdgeInsets.all(12.px),
                                                  child: Text(
                                                    controller
                                                        .result[index].title
                                                        .toString(),
                                                    maxLines: 2,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 14.px,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                    ],
                  )
                : controller.getSupportivePeaceModel == null
                    ? const SizedBox()
                    : Center(
                        child: CommonWidgets.dataNotFound(),
                      ),
          ),
        ),
      );
    });
  }
}
