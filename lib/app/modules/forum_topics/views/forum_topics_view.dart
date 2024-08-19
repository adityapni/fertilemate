import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/forum_topics_controller.dart';

class ForumTopicsView extends GetView<ForumTopicsController> {
  const ForumTopicsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: StringConstants.forum),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.px),
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                (controller.doctor.isNotEmpty)
                    ? Column(
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
                          SizedBox(height: 10.px),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              StringConstants.categories,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          ),
                          SizedBox(height: 10.px),
                          if (controller.doctor.isNotEmpty)
                            controller.searchResult.isNotEmpty ||
                                    controller.searchController.text.isNotEmpty
                                ? SingleChildScrollView(
                                    child: Wrap(
                                      children: List.generate(
                                          controller.searchResult.length,
                                          (index) {
                                        final cellWidth =
                                            MediaQuery.of(Get.context!)
                                                    .size
                                                    .width /
                                                2.2.px;
                                        return SizedBox(
                                          width: cellWidth,
                                          child: GestureDetector(
                                            onTap: () => controller.clickOnCard(
                                              id: controller
                                                  .searchResult[index].id,
                                              title: controller
                                                  .searchResult[index].name,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.px),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.px),
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondary
                                                        .withOpacity(.4.px),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.px,
                                                      vertical: 12.px),
                                                  child: Text(
                                                    controller
                                                        .searchResult[index]
                                                        .name
                                                        .toString(),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 14.px,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  )
                                : SingleChildScrollView(
                                    child: Wrap(
                                      children: List.generate(
                                          controller.doctor.length, (index) {
                                        final cellWidth =
                                            MediaQuery.of(Get.context!)
                                                    .size
                                                    .width /
                                                2.2.px;
                                        return SizedBox(
                                          width: cellWidth,
                                          child: GestureDetector(
                                            onTap: () => controller.clickOnCard(
                                                id: controller.doctor[index].id,
                                                title: controller
                                                    .doctor[index].name),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.px),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.px),
                                                  border: Border.all(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .onSecondary
                                                        .withOpacity(.4.px),
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 2.px,
                                                      vertical: 12.px),
                                                  child: Text(
                                                    controller
                                                        .doctor[index].name
                                                        .toString(),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 14.px,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                        ],
                      )
                    : controller.getForumTopicModel == null
                        ? const SizedBox()
                        : Center(
                            child: CommonWidgets.dataNotFound(),
                          ),
                if (controller.data.isNotEmpty) SizedBox(height: 20.px),
                if (controller.data.isNotEmpty)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      StringConstants.myLatestQuestions,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                              ),
                    ),
                  ),
                if (controller.data.isNotEmpty) SizedBox(height: 10.px),
                if (controller.data.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: 8.px),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.px),
                          side: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(0.2.px),
                          ),
                        ),
                        /*leading: CommonWidgets.imageView(
                            height: 50.px,
                            width: 50.px,
                            image: ImageConstants.defaultNetworkImage,
                            borderRadius: BorderRadius.circular(25.px),
                          ),*/
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(controller.data[index].question ?? '',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(fontSize: 14.px)),
                            SizedBox(height: 4.px),
                            Text(
                                "Posted by: ${controller.data[index].userName ?? ''}",
                                style: Theme.of(context).textTheme.titleMedium)
                          ],
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 4.px),
                        trailing: (controller.data[index].userId.toString() ==
                                controller.userId)
                            ? GestureDetector(
                                onTap: () => controller.clickOnDeleteButton(
                                    index: index),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.px),
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.px),
                                    child: Icon(
                                      Icons.delete_outline_outlined,
                                      color: Theme.of(context).primaryColor,
                                      size: 20.px,
                                    ),
                                  ),
                                ),
                              )
                            : null,
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                "Answers: ${controller.data[index].count ?? ''}",
                                style: Theme.of(context).textTheme.titleMedium),
                            CommonWidgets.commonElevatedButton(
                              wantContentSizeButton: true,
                              onPressed: () =>
                                  controller.clickOnView(index: index),
                              child: Text(
                                StringConstants.view,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    itemCount: controller.data.length,
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
