import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_education_category_controller.dart';

class FertilityEducationCategoryView
    extends GetView<FertilityEducationCategoryController> {
  const FertilityEducationCategoryView({Key? key}) : super(key: key);

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
                  /*suffixIcon: Image.asset(
                    IconConstants.icFilter,
                    height: 24.px,
                    width: 24.px,
                  ),*/
                ),
              ),
              SizedBox(height: 20.px),
              if (controller.blogByCategory != null)
                controller.searchResult.isNotEmpty ||
                        controller.searchController.text.isNotEmpty
                    ? ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.px, vertical: 4.px),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(0.4)),
                              // color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20.px),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CommonWidgets.imageView(
                                    radius: 20.px,
                                    height: 140,
                                    image: controller
                                        .searchResult[index].febImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 14.px),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller
                                            .searchResult[index].febTitle!,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 18.px,
                                            ),
                                      ),
                                      SizedBox(height: 4.px),
                                      if (controller
                                                  .blogByCategory!
                                                  .data![index]
                                                  .febShorDescription !=
                                              null &&
                                          controller
                                              .blogByCategory!
                                              .data![index]
                                              .febShorDescription!
                                              .isNotEmpty)
                                        Text(
                                          controller.blogByCategory!
                                              .data![index].febShorDescription!,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      SizedBox(height: 4.px),
                                      CommonWidgets.commonElevatedButton(
                                        wantContentSizeButton: true,
                                        onPressed: () => controller
                                            .clickOnReadButton(index: index),
                                        child: Text(
                                          StringConstants.read,
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
                              ],
                            ),
                          ),
                        ),
                        itemCount: controller.searchResult.length,
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20.px, vertical: 4.px),
                          child: Container(
                            margin: EdgeInsets.only(bottom: 4),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(0.4)),
                              // color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(20.px),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: CommonWidgets.imageView(
                                    radius: 20.px,
                                    height: 140,
                                    image: controller
                                        .blogByCategory!.data![index].febImage!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 14.px),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.blogByCategory!.data![index]
                                            .febTitle!,
                                        maxLines: 2,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 18.px,
                                            ),
                                      ),
                                      SizedBox(height: 4.px),
                                      if (controller
                                                  .blogByCategory!
                                                  .data![index]
                                                  .febShorDescription !=
                                              null &&
                                          controller
                                              .blogByCategory!
                                              .data![index]
                                              .febShorDescription!
                                              .isNotEmpty)
                                        Text(
                                          controller.blogByCategory!
                                              .data![index].febShorDescription!,
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                      SizedBox(height: 4.px),
                                      CommonWidgets.commonElevatedButton(
                                        wantContentSizeButton: true,
                                        onPressed: () => controller
                                            .clickOnReadButton(index: index),
                                        child: Text(
                                          StringConstants.read,
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
                              ],
                            ),
                          ),
                        ),
                        itemCount: controller.blogByCategory!.data!.length,
                      ),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }
}
