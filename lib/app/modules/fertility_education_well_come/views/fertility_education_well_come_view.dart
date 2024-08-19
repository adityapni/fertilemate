import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_education_well_come_controller.dart';

class FertilityEducationWellComeView
    extends GetView<FertilityEducationWellComeController> {
  const FertilityEducationWellComeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.welcome,
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      StringConstants.fertilityEducation,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(height: 20.px),
                    if (controller.result != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.px),
                        child: Stack(
                          children: [
                            CommonWidgets.imageView(
                              image: controller.result!.image.toString(),
                              height: 180.px,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: EdgeInsets.all(20.px),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Html(
                                    data: controller.result!.description
                                        .toString(),
                                  ),
                                  /* Text(
                                    controller.result!.description.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 18.px),
                                  ),*/
                                  /* CommonWidgets.commonElevatedButton(
                                    wantContentSizeButton: true,
                                    onPressed: () =>
                                        controller.clickOnRegisterButton(),
                                    child: Text(
                                      StringConstants.register,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w700,
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                          ),
                                    ),
                                  ),*/
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    SizedBox(height: 20.px),
                    Text(
                      StringConstants.categories,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                              ),
                    ),
                    SizedBox(height: 10.px),
                    SizedBox(
                      height: 100.px,
                      width: double.infinity,
                      child: Obx(() {
                        controller.count.value;
                        return Center(
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.listOfCards.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.px),
                                  child: cards(
                                    textString: controller.listOfCards[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 20.px),
                    if (controller.blogCategorylist != null)
                      Text(
                        StringConstants.mostPopularContent,
                        maxLines: 1,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    if (controller.blogCategorylist != null)
                      SizedBox(height: 10.px),
                    if (controller.blogCategorylist != null &&
                        controller.blogCategorylist!.data!.isNotEmpty)
                      SizedBox(
                        height: 200.px,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.blogCategorylist!.data!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () =>
                                  controller.clickOnContentCard(index: index),
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.px),
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    CommonWidgets.imageView(
                                      radius: 20.px,
                                      image: controller.blogCategorylist!
                                          .data![index].febImage!,
                                      fit: BoxFit.cover,
                                      height: 200.px,
                                      width: MediaQuery.of(context).size.width -
                                          40.px,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width -
                                          40.px,
                                      decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: EdgeInsets.all(8.px),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            if (controller
                                                        .blogCategorylist!
                                                        .data![index]
                                                        .febTitle !=
                                                    null &&
                                                controller
                                                    .blogCategorylist!
                                                    .data![index]
                                                    .febTitle!
                                                    .isNotEmpty)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  controller.blogCategorylist!
                                                      .data![index].febTitle!,
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          fontSize: 16.px,
                                                          color: Theme.of(
                                                                  context)
                                                              .scaffoldBackgroundColor),
                                                ),
                                              ),
                                            if (controller
                                                        .blogCategorylist!
                                                        .data![index]
                                                        .febShorDescription !=
                                                    null &&
                                                controller
                                                    .blogCategorylist!
                                                    .data![index]
                                                    .febShorDescription!
                                                    .isNotEmpty)
                                              SizedBox(height: 4.px),
                                            if (controller
                                                        .blogCategorylist!
                                                        .data![index]
                                                        .febShorDescription !=
                                                    null &&
                                                controller
                                                    .blogCategorylist!
                                                    .data![index]
                                                    .febShorDescription!
                                                    .isNotEmpty)
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  controller
                                                      .blogCategorylist!
                                                      .data![index]
                                                      .febShorDescription!,
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                          fontSize: 10.px),
                                                ),
                                              ),
                                            SizedBox(height: 4.px),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    SizedBox(height: 10.px),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget cards({
    required String textString,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*SizedBox(
          height: 64.px,
          width: 64.px,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.px),
            child: Image.network(
              bgImageString,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(ImageConstants.defaultNetworkImage);
              },
            ),
          ),
        ),*/
        Image.asset(IconConstants.icTimeCard, width: 64.px, height: 64.px),
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
