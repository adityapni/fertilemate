import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/intimacy_management_insights_controller.dart';

class IntimacyManagementInsightsView
    extends GetView<IntimacyManagementInsightsController> {
  const IntimacyManagementInsightsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar:
              CommonWidgets.appBarView(title: StringConstants.intimacyInsight),
          body: ListView(
            children: [
              SizedBox(height: 40.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.resultData != null)
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.px),
                          border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.4.px),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.px, horizontal: 20.px),
                              child: Text(
                                controller.resultData!.name.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 16.px,
                                      fontWeight: FontWeight.w400,
                                      color: Theme.of(context).primaryColor,
                                    ),
                              ),
                            ),
                            CommonWidgets.imageView(
                              image: controller.resultData!.image.toString(),
                              height: 140.px,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.px, horizontal: 20.px),
                              child: Text(
                                controller.resultData!.description.toString(),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            )
                          ],
                        ),
                      ),
                    SizedBox(height: 10.px),
                    if (controller.result.isNotEmpty)
                      Text(
                        StringConstants.categories,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                    SizedBox(height: 10.px),
                  ],
                ),
              ),
              if (controller.result.isNotEmpty)
                Wrap(
                  children: List.generate(
                    controller.result.length,
                    (index) => GestureDetector(
                      onTap: () => controller.clickOnCard(index: index),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.px, vertical: 8),
                        child: Container(
                          height: 120.px,
                          width: MediaQuery.of(context).size.width / 2.3.px,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.px),
                            border: Border.all(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.4.px),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.px),
                                child: Column(
                                  children: [
                                    if (controller.result[index].imcName !=
                                            null &&
                                        controller
                                            .result[index].imcName!.isNotEmpty)
                                      Text(
                                        controller.result[index].imcName
                                            .toString(),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 14.px),
                                      ),
                                    /* Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
                                          splashRadius: 24.px,
                                          icon: Icon(
                                            Icons.favorite,
                                            size: 24.px,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          splashRadius: 24.px,
                                          icon: Icon(
                                            Icons.share,
                                            size: 24.px,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        )
                                      ],
                                    ),*/
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      );
    });
  }
}
