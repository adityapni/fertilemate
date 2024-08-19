import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nutritional_guidance_detail_blog_controller.dart';

class NutritionalGuidanceDetailBlogView
    extends GetView<NutritionalGuidanceDetailBlogController> {
  const NutritionalGuidanceDetailBlogView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.blogs),
          body: controller.result.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.result.length,
                  itemBuilder: (context, index) {
                    print(
                        'controller.result[index].ngbImage::::::::::::::::::::::::${controller.result[index].ngbImage}');
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.px, vertical: 6.px),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14.px),
                            border: Border.all(
                                width: .1,
                                color: Theme.of(context).primaryColor)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (controller.result[index].ngbImage != null &&
                                controller.result[index].ngbImage!.isNotEmpty)
                              Row(
                                mainAxisAlignment: index % 2 == 0
                                    ? MainAxisAlignment.end
                                    : MainAxisAlignment.start,
                                children: [
                                  CommonWidgets.imageView(
                                      image: controller.result[index].ngbImage
                                          .toString(),
                                      radius: 14.px,
                                      height: 140.px,
                                      width: MediaQuery.of(context).size.width /
                                          1.4.px)
                                ],
                              ),
                            if (controller.result[index].ngbImage != null &&
                                controller.result[index].ngbImage!.isNotEmpty)
                              SizedBox(height: 10.px),
                            if (controller.result[index].ngbTitle != null &&
                                controller.result[index].ngbTitle!.isNotEmpty)
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.px),
                                child: Text(
                                  controller.result[index].ngbTitle.toString(),
                                  maxLines: 3,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 18.px,
                                          color:
                                              Theme.of(context).primaryColor),
                                ),
                              ),
                            /*if (controller.result[index].ngbTitle !=
                                null &&
                            controller
                                .result[index].ngbTitle!.isNotEmpty)
                          SizedBox(height: 6.px),
                        Text(
                            controller.result[index].ngbDescription
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 14.px,
                                ),
                          ),*/
                            if (controller.result[index].ngbDescription !=
                                    null &&
                                controller
                                    .result[index].ngbDescription!.isNotEmpty)
                              SizedBox(height: 20.px),
                            Row(
                              mainAxisAlignment: index % 2 != 0
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 8.px),
                                  child: CommonWidgets.commonElevatedButton(
                                    wantContentSizeButton: true,
                                    borderRadius: 8.px,
                                    onPressed: () => controller
                                        .clickOnStartButton(index: index),
                                    child: Text(
                                      StringConstants.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(
                                              fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  })
              : controller.guidanceGetNutritionalGuidanceBlogBySubCategorieIdModel ==
                      null
                  ? const SizedBox()
                  : Center(
                      child: CommonWidgets.dataNotFound(),
                    ),
        ),
      );
    });
  }
}
