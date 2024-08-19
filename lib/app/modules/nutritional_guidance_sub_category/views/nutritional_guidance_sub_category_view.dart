import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/nutritional_guidance_sub_category_controller.dart';

class NutritionalGuidanceSubCategoryView
    extends GetView<NutritionalGuidanceSubCategoryController> {
  const NutritionalGuidanceSubCategoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            appBar: CommonWidgets.appBarView(title: controller.title),
            body: controller.result.isNotEmpty
                ? ListView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      if (controller.subCategoriesByCategoryIdModel != null)
                        Container(
                          padding: EdgeInsets.all(8.px),
                          decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.4.px)),
                          child: Column(
                            children: [
                              if (controller.subCategoriesByCategoryIdModel!
                                          .banner !=
                                      null &&
                                  controller.subCategoriesByCategoryIdModel!
                                      .banner!.isNotEmpty)
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(4.px),
                                  child: AspectRatio(
                                    aspectRatio: 14.px / 9.px,
                                    child: CommonWidgets.imageView(
                                      fit: BoxFit.contain,
                                      image: controller
                                          .subCategoriesByCategoryIdModel!
                                          .banner
                                          .toString(),
                                    ),
                                  ),
                                ),
                              if (controller.subCategoriesByCategoryIdModel!
                                          .title !=
                                      null &&
                                  controller.subCategoriesByCategoryIdModel!
                                      .title!.isNotEmpty)
                                Container(
                                  padding: EdgeInsets.all(4.px),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(2.px),
                                  ),
                                  child: Text(
                                    controller
                                        .subCategoriesByCategoryIdModel!.title!
                                        .toString(),
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 14.px,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor),
                                  ),
                                )
                            ],
                          ),
                        ),
                      SizedBox(height: 20.px),
                      if (controller.result.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          child: Text(
                            'Treatment Plan Guide',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                  fontSize: 20.px,
                                ),
                          ),
                        ),
                      if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                      (controller.result.isNotEmpty)
                          ? ListView.builder(
                              itemCount: controller.result.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20.px),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.px),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(6.px),
                                    onTap: () => controller.clickOnListTile(
                                        index: index),
                                    child: Row(
                                      children: [
                                        if (controller.result[index].image !=
                                                null &&
                                            controller.result[index].image!
                                                .isNotEmpty)
                                          Expanded(
                                            flex: 2,
                                            child: CommonWidgets.imageView(
                                              image: controller
                                                  .result[index].image
                                                  .toString(),
                                            ),
                                          ),
                                        Expanded(
                                          flex: 6,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 12.px),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                if (controller.result[index]
                                                            .name !=
                                                        null &&
                                                    controller.result[index]
                                                        .name!.isNotEmpty)
                                                  Text(
                                                    controller
                                                        .result[index].name
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                          fontSize: 12.px,
                                                        ),
                                                  ),
                                                /* if (controller
                                                        .result[index].name !=
                                                    null &&
                                                controller.result[index].name!
                                                    .isNotEmpty)
                                              SizedBox(height: 14.px),
                                            if (controller.result[index]
                                                        .description !=
                                                    null &&
                                                controller.result[index]
                                                    .description!.isNotEmpty)
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
                                            if (controller.result[index]
                                                        .description !=
                                                    null &&
                                                controller.result[index]
                                                    .description!.isNotEmpty)
                                              SizedBox(height: 6.px),*/
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
                            )
                          : Center(child: CommonWidgets.dataNotFound()),
                      if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                    ],
                  )
                : controller.subCategoriesByCategoryIdModel == null
                    ? const SizedBox()
                    : Center(child: CommonWidgets.dataNotFound()),
          ),
        );
      },
    );
  }
}
