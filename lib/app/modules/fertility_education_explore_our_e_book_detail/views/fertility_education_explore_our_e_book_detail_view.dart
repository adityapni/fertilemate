import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_education_explore_our_e_book_detail_controller.dart';

class FertilityEducationExploreOurEBookDetailView
    extends GetView<FertilityEducationExploreOurEBookDetailController> {
  const FertilityEducationExploreOurEBookDetailView({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'Let explore our Ebook!'),
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              if (controller.result.isNotEmpty)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.px, vertical: 4.px),
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(20.px),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CommonWidgets.imageView(
                                image: controller.result[index].thumbnailImage
                                    .toString(),
                                height: 140,
                                fit: BoxFit.cover,
                                radius: 20.px),
                          ),
                          SizedBox(width: 14.px),
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        controller.result[index].author
                                            .toString(),
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        controller.result[index].categoryName
                                            .toString(),
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4.px),
                                Text(
                                  controller.result[index].title.toString(),
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 14.px),
                                ),
                                SizedBox(height: 4.px),
                                CommonWidgets.commonElevatedButton(
                                  wantContentSizeButton: true,
                                  onPressed: () => controller.clickOnReadButton(
                                      index: index),
                                  child: Text(
                                    StringConstants.read,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: controller.result.length,
                ),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }
}
