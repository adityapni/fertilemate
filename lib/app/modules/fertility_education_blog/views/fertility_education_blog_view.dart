import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_education_blog_controller.dart';

class FertilityEducationBlogView
    extends GetView<FertilityEducationBlogController> {
  const FertilityEducationBlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.obs;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: controller.title),
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              if (controller.blogfeaturedList != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Text(
                    StringConstants.featuredArticles,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
              if (controller.blogfeaturedList != null) SizedBox(height: 20.px),
              if (controller.blogfeaturedList != null &&
                  controller.blogfeaturedList!.data != null &&
                  controller.blogfeaturedList!.data!.isNotEmpty)
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.8,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.blogfeaturedList!.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        child: Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2.px),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(20.px),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      CommonWidgets.imageView(
                                          image: controller.blogfeaturedList!
                                              .data![index].febImage!,
                                          height: 140.px,
                                          width: double.infinity,
                                          radius: 20.px),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.px),
                                        child: Column(
                                          children: [
                                            SizedBox(height: 120.px),
                                            Container(
                                              height: 42.px,
                                              decoration: ShapeDecoration(
                                                color: Theme.of(context)
                                                    .scaffoldBackgroundColor,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.px),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(6.px),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    CommonWidgets.imageView(
                                                        image: controller
                                                                .blogfeaturedList!
                                                                .data![index]
                                                                .febImage ??
                                                            '',
                                                        width: 32.px,
                                                        height: 32.px,
                                                        radius: 16.px),
                                                    SizedBox(width: 6.px),
                                                    Flexible(
                                                      child: Text(
                                                        controller
                                                            .blogfeaturedList!
                                                            .data![index]
                                                            .febTitle!,
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium
                                                            ?.copyWith(
                                                              fontSize: 10.px,
                                                            ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 14.px),
                                  if (controller.blogfeaturedList!.data![index]
                                              .febShorDescription !=
                                          null &&
                                      controller.blogfeaturedList!.data![index]
                                          .febShorDescription!.isNotEmpty)
                                    Text(
                                      controller.blogfeaturedList!.data![index]
                                          .febShorDescription!,
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                            fontSize: 14.px,
                                          ),
                                    ),
                                  SizedBox(height: 14.px),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Image.asset(IconConstants.icTimeBlack,
                                              width: 18.px, height: 18.px),
                                          SizedBox(width: 4.px),
                                          Text(
                                            controller.blogfeaturedList!
                                                .data![index].febReadingTime!
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                  fontSize: 14.px,
                                                ),
                                          ),
                                          SizedBox(width: 8.px),
                                          Image.asset(
                                              IconConstants.icStartBlack,
                                              width: 18.px,
                                              height: 18.px),
                                          SizedBox(width: 4.px),
                                          Text(
                                            controller.blogfeaturedList!
                                                .data![index].febAverageRating!
                                                .toString(),
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                  fontSize: 14.px,
                                                ),
                                          )
                                        ],
                                      ),
                                      CommonWidgets.commonElevatedButton(
                                        wantContentSizeButton: true,
                                        onPressed: () =>
                                            controller.clickOnReadButton(),
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
                                  )
                                ]),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              if (controller.blogCategorylist != null) SizedBox(height: 20.px),
              if (controller.blogCategorylist != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Text(
                    StringConstants.categories,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
              if (controller.blogCategorylist != null) SizedBox(height: 20.px),
              if (controller.blogCategorylist != null)
                Container(
                  padding: EdgeInsets.only(left: 20.px),
                  height: 100.px,
                  width: double.infinity,
                  child: Obx(() {
                    controller.count.value;
                    return Center(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.blogCategorylist!.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => controller.clickOnCard(
                                catId: controller
                                    .blogCategorylist!.data![index].fecId!,
                                cardTitle: controller
                                    .blogCategorylist!.data![index].fecName!),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.px),
                              child: cards(
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              if (controller.getFertilityEducationsSavedBlogData.isNotEmpty)
                SizedBox(height: 20.px),
              if (controller.getFertilityEducationsSavedBlogData.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Text(
                    StringConstants.mySavedContent,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
              if (controller.getFertilityEducationsSavedBlogData.isNotEmpty)
                SizedBox(height: 20.px),
              if (controller.getFertilityEducationsSavedBlogData.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount:
                      controller.getFertilityEducationsSavedBlogData.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () => controller.clickOnContentCard(index: index),
                    trailing: GestureDetector(
                      onTap: () => controller.clickOnBookmarkIcon(index: index),
                      child: Icon(
                          controller.getFertilityEducationsSavedBlogData[index]
                                      .saveStatus ==
                                  true
                              ? Icons.bookmark
                              : Icons.bookmark_border,
                          color: Theme.of(context).primaryColor),
                    ),
                    leading: CommonWidgets.imageView(
                        image: controller
                                .getFertilityEducationsSavedBlogData[index]
                                .febImage ??
                            '',
                        width: 60.px,
                        height: 60.px,
                        radius: 8.px),
                    title: Text(
                      controller.getFertilityEducationsSavedBlogData[index]
                              .febTitle ??
                          "",
                      maxLines: 1,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.px,
                              ),
                    ),
                    subtitle: (controller
                                    .getFertilityEducationsSavedBlogData[index]
                                    .febShortDescription !=
                                null &&
                            controller
                                .getFertilityEducationsSavedBlogData[index]
                                .febShortDescription!
                                .isNotEmpty)
                        ? Text(
                            controller
                                .getFertilityEducationsSavedBlogData[index]
                                .febShortDescription!,
                            style: Theme.of(context).textTheme.titleSmall)
                        : const SizedBox(),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }

  Widget cards({
    required int index,
  }) {
    return Container(
      width: 80.px,
      height: 40.px,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.px),
        border: Border.all(
          color:
              Theme.of(Get.context!).colorScheme.onSecondary.withOpacity(.4.px),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(2.px),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CommonWidgets.imageView(
              image:
                  controller.blogCategorylist!.data![index].fecImage.toString(),
              width: 34.px,
              height: 34.px,
            ),
            SizedBox(height: 8.px),
            Text(
              controller.blogCategorylist!.data![index].fecName!,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 10.px, color: Theme.of(Get.context!).primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
