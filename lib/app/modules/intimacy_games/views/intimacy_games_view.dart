import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/intimacy_games_controller.dart';

class IntimacyGamesView extends GetView<IntimacyGamesController> {
  const IntimacyGamesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'Intimacy Games'),
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              if (controller.gameModelResult.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Text(
                    'Featured Intimacy Games',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
              if (controller.gameModelResult.isNotEmpty)
                SizedBox(height: 20.px),
              if (controller.gameModelResult.isNotEmpty)
                SizedBox(
                  height: 300.px,
                  width: double.infinity,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.px),
                            child: Container(
                              height: 280.px,
                              width: 310.px,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          CommonWidgets.imageView(
                                            image: controller
                                                .gameModelResult[index].image
                                                .toString(),
                                            height: 140.px,
                                            width: double.infinity,
                                            radius: 20.px,
                                          ),
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
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.px),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(6.px),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        CommonWidgets.imageView(
                                                          image: controller
                                                              .gameModelResult[
                                                                  index]
                                                              .userImage
                                                              .toString(),
                                                          fit: BoxFit.fill,
                                                          width: 32.px,
                                                          height: 32.px,
                                                          radius: 16.px,
                                                        ),
                                                        SizedBox(width: 6.px),
                                                        Text(
                                                          controller
                                                              .gameModelResult[
                                                                  index]
                                                              .userName
                                                              .toString(),
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .displayMedium
                                                                  ?.copyWith(
                                                                    fontSize:
                                                                        10.px,
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
                                      Text(
                                        controller
                                            .gameModelResult[index].location
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 14.px),
                                      ),
                                      SizedBox(height: 14.px),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Image.asset(
                                                  IconConstants.icTimeBlack,
                                                  width: 18.px,
                                                  height: 18.px),
                                              SizedBox(width: 4.px),
                                              Text(
                                                controller
                                                    .gameModelResult[index]
                                                    .duretion
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
                                                controller
                                                    .gameModelResult[index]
                                                    .duretion
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
                                            onPressed: () => controller
                                                .clickOnBuyNowButton(),
                                            child: Text(
                                              StringConstants.buyNow,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          ),
                      itemCount: controller.gameModelResult.length),
                ),
              if (controller.result.isNotEmpty) SizedBox(height: 20.px),
              if (controller.result.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Text(
                    StringConstants.categories,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
              if (controller.result.isNotEmpty) SizedBox(height: 20.px),
              if (controller.result.isNotEmpty)
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
                        itemCount: controller.result.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => controller.clickOnCard(
                                CatId: controller.result[index].id!,
                                title: controller.result[index].name!),
                            child: cards(
                              index: index,
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ),
              SizedBox(height: 10.px),
              if (controller.blogSavedList != null)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Text(
                    StringConstants.myJourney,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 14.px,
                        ),
                  ),
                ),
              if (controller.blogSavedList != null) SizedBox(height: 10.px),
              if (controller.blogSavedList != null)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.blogSavedList!.data!.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () => controller.clickOnCard(
                        CatId: controller.blogSavedList!.data![index].febId!,
                        title:
                            controller.blogSavedList!.data![index].febTitle!),
                    trailing: Image.asset(
                      IconConstants.icSaveBlack,
                      width: 24.px,
                      height: 24.px,
                    ),
                    leading: CommonWidgets.imageView(
                        image: controller.blogSavedList!.data![index].febImage!,
                        width: 60.px,
                        height: 60.px,
                        radius: 8.px),
                    title: Text(
                      controller.blogSavedList!.data![index].febTitle!,
                      maxLines: 1,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 16.px,
                              ),
                    ),
                    subtitle: Text(
                        controller.blogSavedList!.data![index].febDescription!,
                        style: Theme.of(context).textTheme.titleSmall),
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
    return Padding(
      padding: EdgeInsets.only(right: 8.px),
      child: Container(
        width: 80.px,
        height: 80.px,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.px),
          border: Border.all(
            color: Theme.of(Get.context!)
                .colorScheme
                .onSecondary
                .withOpacity(.4.px),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(4.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CommonWidgets.imageView(
                  image: controller.result[index].image.toString(),
                  width: 32.px,
                  height: 32.px),
              SizedBox(height: 8.px),
              Text(
                controller.result[index].name.toString(),
                style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                    fontSize: 10.px,
                    color: Theme.of(Get.context!).primaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
