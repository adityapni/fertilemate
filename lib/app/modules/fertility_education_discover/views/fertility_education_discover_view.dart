import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/apis/api_models/get_fertility_webinars_blogs_by_category_model.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_education_discover_controller.dart';

class FertilityEducationDiscoverView
    extends GetView<FertilityEducationDiscoverController> {
  const FertilityEducationDiscoverView({Key? key}) : super(key: key);

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
              if (controller.bannerResult != null) SizedBox(height: 20.px),
              if (controller.bannerResult != null)
                Padding(
                  padding: EdgeInsets.all(20.px),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(15.px),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.bannerResult!.description.toString(),
                                maxLines: 3,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 18.px,
                                    ),
                              ),
                              SizedBox(height: 4.px),
                            ],
                          ),
                        ),
                        SizedBox(width: 14.px),
                        Expanded(
                          flex: 1,
                          child: CommonWidgets.imageView(
                            image: controller.bannerResult!.image.toString(),
                            height: 125.px,
                            width: 25,
                            fit: BoxFit.cover,
                            radius: 20.px,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (controller.bannerResult != null) SizedBox(height: 20.px),
              if (controller.result.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, indexResult) {
                      if (controller.result[indexResult].webinarsDeatils !=
                              null &&
                          controller.result[indexResult].webinarsDeatils!
                              .isNotEmpty) {
                        List<WebinarsDeatils> webinarsDeatils =
                            controller.result[indexResult].webinarsDeatils!;
                        return Padding(
                          padding: EdgeInsets.only(bottom: 8.px),
                          child: Container(
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
                                    /*  SizedBox(height: 14.px),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          controller.result[indexResult].name
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 14.px,
                                              ),
                                        ),
                                        Text(
                                          controller.result[indexResult].title
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 14.px,
                                              ),
                                        ),
                                      ],
                                    ),*/
                                    SizedBox(height: 20.px),
                                    (webinarsDeatils.isNotEmpty)
                                        ? ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemBuilder: (context, index) =>
                                                Padding(
                                              padding:
                                                  EdgeInsets.only(bottom: 8.px),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.px),
                                                ),
                                                child: Padding(
                                                  padding:
                                                      EdgeInsets.all(10.px),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              webinarsDeatils[
                                                                      index]
                                                                  .title
                                                                  .toString(),
                                                              maxLines: 2,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .displayMedium
                                                                  ?.copyWith(
                                                                    fontSize:
                                                                        16.px,
                                                                  ),
                                                            ),
                                                            /*
                                                            SizedBox(
                                                                height: 4.px),
                                                            Text(
                                                              webinarsDeatils[
                                                                      index]
                                                                  .title
                                                                  .toString(),
                                                              maxLines: 2,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .displayMedium
                                                                  ?.copyWith(
                                                                    fontSize:
                                                                        18.px,
                                                                  ),
                                                            ),*/
                                                            SizedBox(
                                                                height: 4.px),
                                                            Text(
                                                              webinarsDeatils[
                                                                      index]
                                                                  .duration
                                                                  .toString(),
                                                              maxLines: 1,
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall,
                                                            ),
                                                            SizedBox(
                                                                height: 4.px),
                                                            CommonWidgets
                                                                .commonElevatedButton(
                                                              wantContentSizeButton:
                                                                  true,
                                                              onPressed: () => controller
                                                                  .clickOnWatchButton(
                                                                      id: webinarsDeatils[
                                                                              index]
                                                                          .id
                                                                          .toString()),
                                                              child: Text(
                                                                StringConstants
                                                                    .watch,
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .headlineSmall
                                                                    ?.copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(width: 14.px),
                                                      CommonWidgets.imageView(
                                                        image: webinarsDeatils[
                                                                index]
                                                            .image
                                                            .toString(),
                                                        height: 125.px,
                                                        width: 125,
                                                        fit: BoxFit.cover,
                                                        radius: 20.px,
                                                      ),
                                                      /* ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    20.px),
                                                        child: Image.asset(
                                                          height: 125.px,
                                                          'assets/faltu/Rectangle 41925.png',
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),*/
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            itemCount: webinarsDeatils.length,
                                          )
                                        : const SizedBox(),
                                  ]),
                            ),
                          ),
                        );
                        return const SizedBox();
                      }
                      return const SizedBox();
                    },
                    itemCount: controller.result.length,
                  ),
                ),
              SizedBox(height: 10.px),
            ],
          ),
        ),
      );
    });
  }
}
