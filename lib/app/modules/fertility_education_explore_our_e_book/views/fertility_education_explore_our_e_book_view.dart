import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/fertility_education_explore_our_e_book_controller.dart';

class FertilityEducationExploreOurEBookView
    extends GetView<FertilityEducationExploreOurEBookController> {
  const FertilityEducationExploreOurEBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'Let explore our Ebook!'),
          body: controller.result.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: ListView.builder(
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) => Obx(() {
                            controller.count.value;
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.px),
                              child: ListTile(
                                contentPadding: EdgeInsets.all(10.px),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.px)),
                                tileColor: controller.selectedCard.value ==
                                        index
                                    ? Theme.of(context).primaryColor
                                    : Theme.of(context).scaffoldBackgroundColor,
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                title: Text(
                                  controller.result[index].name.toString(),
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 16.px,
                                        color: controller.selectedCard.value !=
                                                index
                                            ? Theme.of(context).primaryColor
                                            : Theme.of(context)
                                                .scaffoldBackgroundColor,
                                      ),
                                ),
                              ),
                            );
                          }),
                      itemCount: controller.result.length),
                )
              : controller.getEBookCategoryModel == null
                  ? const SizedBox()
                  : Center(
                      child: CommonWidgets.dataNotFound(),
                    ),
        ),
      );
    });
  }
}
