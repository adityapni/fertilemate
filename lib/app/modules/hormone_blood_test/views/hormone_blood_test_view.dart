import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/hormone_blood_test_controller.dart';

class HormoneBloodTestView extends GetView<HormoneBloodTestController> {
  const HormoneBloodTestView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: controller.title),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              children: [
                SizedBox(height: 20.px),
                (controller.availableTest.isNotEmpty)
                    ? Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              List list = controller
                                  .availableTest[index].testTags
                                  .toString()
                                  .split(',');
                              return Card(
                                elevation: .4.px,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.px),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CommonWidgets.imageView(
                                            image: controller
                                                .availableTest[index].testImage
                                                .toString(),
                                            height: 84.px,
                                            width: 84.px,
                                            radius: 42.px),
                                        SizedBox(width: 10.px),
                                        Flexible(
                                          child: Text(
                                            controller
                                                .availableTest[index].testName
                                                .toString(),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                    fontSize: 20.px,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10.px),
                                    if (controller.availableTest[index]
                                                .testTags !=
                                            null &&
                                        controller.availableTest[index]
                                            .testTags!.isNotEmpty)
                                      Align(
                                        alignment: Alignment.center,
                                        child: SingleChildScrollView(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          child: Wrap(
                                            children: List.generate(list.length,
                                                (index) {
                                              final cellWidth = MediaQuery.of(
                                                          Get.context!)
                                                      .size
                                                      .width /
                                                  2.2; // Every cell's `width` will be set to 1/2 of the
                                              // screen width.
                                              return SizedBox(
                                                // width: cellWidth,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 4.px,
                                                      horizontal: 10.px),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: 6.px,
                                                        height: 6.px,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4.px),
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                      ),
                                                      SizedBox(width: 12.px),
                                                      Text(
                                                        list[index].toString(),
                                                        maxLines: null,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .titleSmall,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        ),
                                      ),
                                    SizedBox(height: 10.px),
                                    CommonWidgets.commonElevatedButton(
                                      onPressed: () => controller
                                          .clickOnBookNowButton(index: index),
                                      child: Text(
                                        StringConstants.bookNow,
                                        style: Theme.of(Get.context!)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 12.px,
                                              fontWeight: FontWeight.w600,
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                            ),
                                      ),
                                    ),
                                    SizedBox(height: 10.px),
                                  ],
                                ),
                              );
                            },
                            itemCount: controller.availableTest.length),
                      )
                    : controller.availableTestsModel == null
                        ? const SizedBox()
                        : Center(
                            child: CommonWidgets.dataNotFound(),
                          ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
