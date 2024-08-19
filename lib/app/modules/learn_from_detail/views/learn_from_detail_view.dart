import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/learn_from_detail_controller.dart';

class LearnFromDetailView extends GetView<LearnFromDetailController> {
  const LearnFromDetailView({Key? key}) : super(key: key);

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
                child: (controller.result.isNotEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.px),
                          child: Container(
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
                                CommonWidgets.imageView(
                                  image:
                                      controller.result[index].image.toString(),
                                  height: 200.px,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  radius: 20.px,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10.px),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Article: ${controller.result[index].title ?? ''}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 24.px,
                                            ),
                                      ),
                                      SizedBox(height: 10.px),
                                      Text(
                                        'BY: ${controller.result[index].writer ?? ''}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              fontSize: 14.px,
                                            ),
                                      ),
                                      SizedBox(height: 10.px),
                                      Text(
                                        controller.result[index].title ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(fontSize: 20.px),
                                      ),
                                      SizedBox(height: 8.px),
                                      Html(
                                        data: controller
                                                .result[index].description ??
                                            '',
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        itemCount: controller.result.length,
                      )
                    : controller.getSupportiveCommunityDetailsModel == null
                        ? const SizedBox()
                        : Center(child: CommonWidgets.dataNotFound()),
              ),
            ],
          ),
        ),
      );
    });
  }
}
