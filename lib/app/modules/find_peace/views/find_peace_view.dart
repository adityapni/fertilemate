import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/find_peace_controller.dart';

class FindPeaceView extends GetView<FindPeaceController> {
  const FindPeaceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: 'Find Peace'),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      onChanged: (value) =>
                          controller.searchMethod(value: value),
                      controller: controller.searchController,
                      borderRadius: 15.px,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2),
                      hintText: StringConstants.search,
                      suffixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconConstants.icSearch,
                            height: 24.px,
                            width: 24.px,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.px),
                    if (controller.result.isNotEmpty)
                      SizedBox(
                        height: 50.px,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.result.length,
                          itemBuilder: (context, index) =>
                              tabBarText(index: index),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                    if (controller.result.isNotEmpty) SizedBox(height: 20.px),
                    (controller.getPeaceSubCategoryResult.isNotEmpty)
                        ? controller.searchResult.isNotEmpty ||
                                controller.searchController.text.isNotEmpty
                            ? ListView.builder(
                                itemCount:
                                    controller.getPeaceSubCategoryResult.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.px),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(6.px),
                                    onTap: () => controller.clickOnListTileCard(
                                        index: index),
                                    child: ListTile(
                                      title: Text(
                                        controller
                                            .getPeaceSubCategoryResult[index]
                                            .name
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 12.px,
                                            ),
                                      ),
                                      trailing: Image.asset(
                                        IconConstants.icRightArrow,
                                        height: 24.px,
                                        width: 24.px,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                itemCount:
                                    controller.getPeaceSubCategoryResult.length,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) => Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.px),
                                  ),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(6.px),
                                    onTap: () => controller.clickOnListTileCard(
                                        index: index),
                                    child: ListTile(
                                      title: Text(
                                        controller
                                            .getPeaceSubCategoryResult[index]
                                            .name
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 12.px,
                                            ),
                                      ),
                                      trailing: Image.asset(
                                        IconConstants.icRightArrow,
                                        height: 24.px,
                                        width: 24.px,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                        : controller.getPeaceSubCategoryModel == null
                            ? const SizedBox()
                            : Center(
                                child: CommonWidgets.dataNotFound(),
                              ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  tabBarText({required int index}) {
    return GestureDetector(
      onTap: () => controller.clickOnCard(index: index),
      child: Padding(
        padding: EdgeInsets.all(4.px),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            color: controller.selectedTab.value == index
                ? Theme.of(Get.context!).primaryColor
                : Colors.transparent,
            border: Border.all(
                color: Theme.of(Get.context!).colorScheme.onSecondary),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 20.px),
            child: Text(
              controller.result[index].name.toString(),
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 16.px,
                  color: controller.selectedTab.value == index
                      ? Theme.of(Get.context!).scaffoldBackgroundColor
                      : Theme.of(Get.context!).textTheme.displayMedium?.color),
            ),
          ),
        ),
      ),
    );
  }
}
