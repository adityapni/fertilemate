import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/nutritional_guidance_detail_controller.dart';

class NutritionalGuidanceDetailView
    extends GetView<NutritionalGuidanceDetailController> {
  const NutritionalGuidanceDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            body: (controller.result.isNotEmpty)
                ? Column(
                    children: [
                      Stack(
                        children: [
                          if (controller.result.first.guideImage != null &&
                              controller.result.first.guideImage!.isNotEmpty)
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.px),
                              child: AspectRatio(
                                aspectRatio: 14.px / 9.px,
                                child: CommonWidgets.imageView(
                                  image: controller.result.first.guideImage
                                      .toString(),
                                ),
                              ),
                            ),
                          AspectRatio(
                            aspectRatio: 14.px / 9.px,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.px, vertical: 34.px),
                                  child: IconButton(
                                    onPressed: () =>
                                        controller.clickOnBackButton(),
                                    icon: Icon(
                                      Icons.arrow_back,
                                      size: 34.px,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: ListView(
                          physics: const AlwaysScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.px),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (controller.result.first.guideQuestion !=
                                          null &&
                                      controller.result.first.guideQuestion!
                                          .isNotEmpty)
                                    Text(
                                      controller.result.first.guideQuestion
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(fontSize: 16.px),
                                    ),
                                  if (controller.result.first.guideQuestion !=
                                          null &&
                                      controller.result.first.guideQuestion!
                                          .isNotEmpty)
                                    SizedBox(height: 10.px),
                                  if (controller.result.first.guideAnswer !=
                                          null &&
                                      controller
                                          .result.first.guideAnswer!.isNotEmpty)
                                    Html(
                                        data: controller
                                            .result.first.guideAnswer
                                            .toString()),
                                  SizedBox(height: 20.px),
                                  Text(
                                    'Lunch And Dinner Dashboard',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 16.px),
                                  ),
                                  SizedBox(height: 20.px),
                                  ListView.builder(
                                    itemCount:
                                        controller.listOfDashboard.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.px),
                                      ),
                                      child: InkWell(
                                        borderRadius:
                                            BorderRadius.circular(8.px),
                                        onTap: () => controller.clickOnListTile(
                                            index: index),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.px),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 12.px),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        controller
                                                                .listOfDashboard[
                                                            index]['title'],
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium
                                                            ?.copyWith(
                                                              fontSize: 12.px,
                                                            ),
                                                      ),
                                                      SizedBox(height: 6.px),
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
                                  ),
                                  SizedBox(height: 20.px),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : controller.guidesGetGuidBySubCategoryIdModel == null
                    ? const SizedBox()
                    : Center(
                        child: CommonWidgets.dataNotFound(),
                      ),
          ),
        );
      },
    );
  }
}
