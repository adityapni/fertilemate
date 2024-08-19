import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nutritional_guidance_controller.dart';

class NutritionalGuidanceView extends GetView<NutritionalGuidanceController> {
  const NutritionalGuidanceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        controller.count.value;
        return ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            appBar: CommonWidgets.appBarView(
                title: StringConstants.nutritionalGuidance),
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
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.px)),
                        child: Padding(
                          padding: EdgeInsets.all(12.px),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    StringConstants.bMICalculator,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 22.px),
                                  ),
                                ),
                                SizedBox(height: 20.px),
                                CommonWidgets.commonTextFieldForLoginSignUP(
                                  filled: true,
                                  borderRadius: 15.px,
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.2.px),
                                  controller: controller.weightForBimController,
                                  hintText: StringConstants.weightKg,
                                ),
                                SizedBox(height: 20.px),
                                CommonWidgets.commonTextFieldForLoginSignUP(
                                  filled: true,
                                  borderRadius: 15.px,
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.2.px),
                                  controller: controller.heightController,
                                  hintText: StringConstants.heightCm,
                                ),
                                SizedBox(height: 14.px),
                                CommonWidgets.commonElevatedButton(
                                  onPressed: () =>
                                      controller.clickOnBmiCalculatorButton(),
                                  child: Text(
                                    StringConstants.calculator,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(height: 14.px),
                                Text(
                                  StringConstants.result,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                                SizedBox(height: 6.px),
                                Obx(() {
                                  controller.count.value;
                                  return Text(
                                    'Your BMI is ${controller.calculatedCategory.value} \nHealthy Weight:  ${controller.calculatedBmi.value}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 14.px,
                                            fontWeight: FontWeight.w400),
                                  );
                                }),
                                SizedBox(height: 6.px),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          controller.clickOnReference(),
                                      child: Text(
                                        "Reference",
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 14.px,
                                                color: Colors.blue,
                                                decorationThickness: 2,
                                                decorationColor: Colors.blue,
                                                decoration: TextDecoration
                                                    .underline // This adds the underline
                                                ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.px)),
                        child: Padding(
                          padding: EdgeInsets.all(12.px),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    StringConstants.waterCalculator,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 22.px,
                                        ),
                                  ),
                                ),
                                SizedBox(height: 20.px),
                                CommonWidgets.commonTextFieldForLoginSignUP(
                                  controller:
                                      controller.weightForWaterController,
                                  hintText: StringConstants.weightKg,
                                  filled: true,
                                  borderRadius: 15.px,
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.2.px),
                                ),
                                SizedBox(height: 20.px),
                                CommonWidgets.commonTextFieldForLoginSignUP(
                                  onTap: () =>
                                      controller.clickOnActivityTextField(),
                                  readOnly: true,
                                  controller: controller.activityController,
                                  hintText: StringConstants.activity,
                                  filled: true,
                                  borderRadius: 15.px,
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.2.px),
                                ),
                                SizedBox(height: 20.px),
                                CommonWidgets.commonTextFieldForLoginSignUP(
                                  onTap: () =>
                                      controller.clickOnClimateTextField(),
                                  readOnly: true,
                                  controller: controller.climateController,
                                  hintText: StringConstants.climate,
                                  filled: true,
                                  borderRadius: 15.px,
                                  fillColor: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.2.px),
                                ),
                                SizedBox(height: 14.px),
                                CommonWidgets.commonElevatedButton(
                                  onPressed: () =>
                                      controller.clickOnCalculatorButton(),
                                  child: Text(
                                    StringConstants.calculator,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                                SizedBox(height: 14.px),
                                Text(
                                  StringConstants.result,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                                SizedBox(height: 6.px),
                                Text(
                                  'You Need to drink ${controller.waterIntake.toString()} Litre per day:',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 14.px,
                                          fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 6.px),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    GestureDetector(
                                      onTap: () =>
                                          controller.clickOnReferenceWaterCalculate(),
                                      child: Text(
                                        "Reference",
                                        textAlign: TextAlign.right,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                            fontSize: 14.px,
                                            color: Colors.blue,
                                            decorationThickness: 2,
                                            decorationColor: Colors.blue,
                                            decoration: TextDecoration
                                                .underline // This adds the underline
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                /* SizedBox(height: 14.px),
                                CommonWidgets.commonElevatedButton(
                                  onPressed: () => controller
                                      .clickOnEnableWaterReminderButton(),
                                  child: Text(
                                    StringConstants.enableWaterReminder,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),*/
                              ],
                            ),
                          ),
                        ),
                      ),
                      /*SizedBox(height: 8.px),
                      ListView.builder(
                        itemCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.px)),
                          child: Padding(
                            padding: EdgeInsets.all(12.px),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.listOfCardsTitle[index]['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 18.px,
                                      ),
                                ),
                                Text(
                                  controller.listOfCardsTitle[index]
                                      ['subTitle'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                                SizedBox(height: 20.px),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.px),
                                  child: Image.asset(
                                    controller.listOfCardsTitle[index]['image'],
                                    height: 130.px,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10.px),
                                CommonWidgets.commonElevatedButton(
                                  onPressed: () =>
                                      controller.clickOnStartedButton(),
                                  child: Text(
                                    StringConstants.letStart,
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
                      ),*/
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
                if (controller.mainCategory != null)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        if (controller.mainCategory!.description != null &&
                            controller.mainCategory!.description!.isNotEmpty)
                          Text(
                            controller.mainCategory!.description!
                                .split(',')[0]
                                .toString(),
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 20.px),
                          ),
                        if (controller.mainCategory!.description != null &&
                            controller.mainCategory!.description!.isNotEmpty)
                          SizedBox(height: 4.px),
                        if (controller.mainCategory!.description != null &&
                            controller.mainCategory!.description!.isNotEmpty)
                          Text(
                            controller.mainCategory!.description!
                                .split(',')[1]
                                .toString(),
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                        if (controller.mainCategory!.description != null &&
                            controller.mainCategory!.description!.isNotEmpty)
                          SizedBox(height: 4.px),
                        if (controller.mainCategory!.bannerImage != null &&
                            controller.mainCategory!.bannerImage!.isNotEmpty)
                          CommonWidgets.imageView(
                            radius: 20.px,
                            height: 200.px,
                            image:
                                controller.mainCategory!.bannerImage.toString(),
                          ),
                        if (controller.mainCategory!.bannerImage != null &&
                            controller.mainCategory!.bannerImage!.isNotEmpty)
                          SizedBox(height: 18.px),
                        if (controller.mainCategory!.description != null &&
                            controller.mainCategory!.description!.isNotEmpty)
                          Text(
                            controller.mainCategory!.description!
                                .split(',')[2]
                                .toString(),
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                      ],
                    ),
                  ),
                if (controller.data.isNotEmpty)
                  Align(
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                      child: Wrap(
                        children:
                            List.generate(controller.data.length, (index) {
                          final cellWidth = MediaQuery.of(Get.context!)
                                  .size
                                  .width /
                              2.2.px; // Every cell's `width` will be set to 1/2 of the screen width.
                          return SizedBox(
                            width: cellWidth,
                            height: 120.px,
                            child: GestureDetector(
                              onTap: () => controller.clickOnCard(index: index),
                              child: Padding(
                                padding: EdgeInsets.all(4.px),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(8.px)),
                                  child: Padding(
                                    padding: EdgeInsets.all(4.px),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        if (controller.data[index]
                                                    .categoryImage !=
                                                null &&
                                            controller.data[index]
                                                .categoryImage!.isNotEmpty)
                                          CommonWidgets.imageView(
                                              image: controller
                                                  .data[index].categoryImage!
                                                  .toString(),
                                              width: 34.px,
                                              height: 34.px,
                                              radius: 0.px),
                                        if (controller.data[index]
                                                    .categoryImage !=
                                                null &&
                                            controller.data[index]
                                                .categoryImage!.isNotEmpty)
                                          SizedBox(height: 8.px),
                                        if (controller
                                                    .data[index].categoryName !=
                                                null &&
                                            controller.data[index].categoryName!
                                                .isNotEmpty)
                                          Text(
                                            controller.data[index].categoryName!
                                                .toString(),
                                            maxLines: 2,
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                  fontSize: 12.px,
                                                ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
