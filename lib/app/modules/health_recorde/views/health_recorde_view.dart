import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/health_recorde_controller.dart';

class HealthRecordeView extends GetView<HealthRecordeController> {
  const HealthRecordeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return AbsorbPointer(
        absorbing: controller.inAsyncCall.value,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Column(
            children: [
              SizedBox(height: 20.px),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: CommonWidgets.appBarView(
                        title: StringConstants.healthRecorde),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          child: Container(
                            height: 44.px,
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSecondary
                                  .withOpacity(.1.px),
                              borderRadius: BorderRadius.circular(8.px),
                            ),
                            child: TabBar(
                              splashBorderRadius: BorderRadius.circular(8.px),
                              indicator: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.px),
                                color: Theme.of(context).primaryColor,
                              ),
                              labelColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              unselectedLabelColor: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.color,
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor,
                                  ),
                              indicatorSize: TabBarIndicatorSize
                                  .tab, // Set indicatorSize to tab
                              dividerColor: Colors.transparent,
                              onTap: (value) =>
                                  controller.clickOnTabs(value: value),
                              physics: const NeverScrollableScrollPhysics(),
                              tabs: [
                                tabTexts(
                                    text: StringConstants.bloodTests, index: 0),
                                tabTexts(
                                    text: StringConstants.document, index: 1),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.px),
                        Expanded(
                          child: ProgressBar(
                            inAsyncCall: controller.inAsyncCall.value,
                            child: const TabBarView(
                                physics: NeverScrollableScrollPhysics(),
                                children: [
                                  BloodTestView(),
                                  DocumentView(),
                                ]),
                          ),
                        )
                      ],
                    ),
                    floatingActionButton: FloatingActionButton.extended(
                      onPressed: () async {
                        final result = await Get.toNamed(Routes.HEALTH_REPORT);
                        if (result != null){
                          controller.inAsyncCall.value = true;
                          await controller.subCategoriesByCategoryIdApi(value: controller.selectedTab.value);
                          controller.inAsyncCall.value = false;
                        }
                      },
                      icon: Icon(Icons.add),
                      label: Text('Health Record')),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget tabTexts({required String text, required int index}) {
    return Text(
      text,
      style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
          fontSize: 16.px,
          color: controller.selectedTab.value == index
              ? Theme.of(Get.context!).scaffoldBackgroundColor
              : Theme.of(Get.context!).primaryColor),
    );
  }
}

class BloodTestView extends GetView<HealthRecordeController> {
  const BloodTestView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.bloodData.isNotEmpty
          ? ListView.builder(
              // padding: EdgeInsets.symmetric(horizontal: 20.px),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                    // contentPadding: EdgeInsets.zero,
                    onTap: () => controller.clickOnListTile(index: index),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20.px),
                      child: Image.asset(
                        ImageConstants.imageAlp,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.cover,
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(
                          ()=> Text(
                            '${controller.bloodData.value[index].bloodName}\n${controller.bloodData.value[index].reportDate}',
                            style:
                                Theme.of(context).textTheme.titleSmall?.copyWith(
                                      fontSize: 10.px,
                                    ),
                          ),
                        ),
                        SizedBox(width: 4.px),
                        Container(
                          height: 8.px,
                          width: 8.px,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(4.px)),
                        )
                      ],
                    ),
                    title: Obx(
                      ()=> Text(
                        controller.bloodData.value[index].bloodName.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                    ),
                  ),
              itemCount: controller.bloodData.value.length)
          : controller.getHealthRecordModel == null
              ? const SizedBox()
              : Center(child: CommonWidgets.dataNotFound()),
    );
  }
}

class DocumentView extends GetView<HealthRecordeController> {
  const DocumentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.documentData.isNotEmpty
          ? ListView.builder(
              // padding: EdgeInsets.symmetric(horizontal: 20.px),
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                    // contentPadding: EdgeInsets.zero,
                    onTap: () => controller.clickOnListTile(index: index),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(20.px),
                      child: Image.asset(
                        IconConstants.icPdf,
                        height: 40.px,
                        width: 40.px,
                        fit: BoxFit.cover,
                      ),
                    ),
                    trailing: Obx(
                      ()=> Text(
                        controller.documentData.value[index].reportDate.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 10.px,
                                color: Theme.of(context).primaryColor),
                      ),
                    ),
                    title: Obx(
                      ()=> Text(
                        controller.documentData.value[index].bloodName.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                    ),
                    subtitle: Obx(
                      ()=> Text(
                        controller.documentData.value[index].dateTime.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontSize: 14.px),
                      ),
                    ),
                  ),
              itemCount: controller.documentData.length)
          : controller.getHealthRecordModel == null
              ? const SizedBox()
              : Center(child: CommonWidgets.dataNotFound()),
    );
  }
}
