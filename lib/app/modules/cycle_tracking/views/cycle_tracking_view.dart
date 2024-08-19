import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/cycle_tracking_controller.dart';

class CycleTrackingView extends GetView<CycleTrackingController> {
  const CycleTrackingView({Key? key}) : super(key: key);

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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 20.px),
                    if (controller.categoriesByMainCategoryIdModel != null &&
                        controller.categoriesByMainCategoryIdModel!.title !=
                            null &&
                        controller
                            .categoriesByMainCategoryIdModel!.title!.isNotEmpty)
                      Text(
                        controller.categoriesByMainCategoryIdModel!.title!
                            .toString(),
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 18.px),
                      ),
                    if (controller.categoriesByMainCategoryIdModel != null &&
                        controller.categoriesByMainCategoryIdModel!.title !=
                            null &&
                        controller
                            .categoriesByMainCategoryIdModel!.title!.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.data.isNotEmpty)
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 4.px),
                                child: Obx(
                                  () => ListTile(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.px),
                                    ),
                                    tileColor:
                                        (index != controller.selectedCard.value)
                                            ? Theme.of(context)
                                                .scaffoldBackgroundColor
                                            : Theme.of(context).primaryColor,
                                    onTap: () => controller.clickOnListTile(
                                        index: index),
                                    title: Text(
                                      controller.data[index].categoryName
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              color: (index !=
                                                      controller
                                                          .selectedCard.value)
                                                  ? Theme.of(context)
                                                      .primaryColor
                                                  : Theme.of(context)
                                                      .scaffoldBackgroundColor),
                                    ),
                                    subtitle: Text(
                                      controller.data[index].description
                                          .toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(fontSize: 10.px),
                                    ),
                                  ),
                                ),
                              ),
                          itemCount: controller.data.length),
                    if (controller.data.isNotEmpty) SizedBox(height: 20.px),
                    /* Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.px),
                      ),
                      elevation: 0,
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.6),
                      child: SizedBox(
                        width: double.infinity,
                        height: 370.px,
                        child: ScrollableCleanCalendar(
                          calendarController: controller.calendarController,
                          daySelectedBackgroundColor:
                              Theme.of(context).primaryColor,
                          dayRadius: 20.px,
                          showWeekdays: false,
                          layout: Layout.BEAUTY,
                          */
                    /*dayBuilder: (context, values) {
                            return Text(values.text,style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 14.px),);
                          },*/
                    /*
                          dayTextStyle: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontSize: 14.px),
                          dayDisableColor:
                              Theme.of(context).colorScheme.onSecondary,
                          monthTextStyle: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 14.px),
                          weekdayTextStyle:
                              Theme.of(context).textTheme.titleSmall,
                          calendarCrossAxisSpacing: 0,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),*/
                    if (controller.data.isNotEmpty)
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnContinueButton(),
                        child: Text(
                          StringConstants.continueText,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
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
}
