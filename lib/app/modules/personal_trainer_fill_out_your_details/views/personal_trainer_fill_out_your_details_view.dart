import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/validations.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/personal_trainer_fill_out_your_details_controller.dart';

class PersonalTrainerFillOutYourDetailsView
    extends GetView<PersonalTrainerFillOutYourDetailsController> {
  const PersonalTrainerFillOutYourDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
                  Text(
                    'Fill out your details',
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(fontSize: 24.px),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    validator: (value) =>
                        FormValidator.isEmptyValid(value: value),
                    controller: controller.nameController,
                    fillColor: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(.2.px),
                    hintText: StringConstants.firstName,
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonTextFieldForLoginSignUP(
                    validator: (value) =>
                        FormValidator.isEmptyValid(value: value),
                    controller: controller.phoneNumberController,
                    fillColor: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(.2.px),
                    hintText: StringConstants.phoneNumber,
                  ),
                  SizedBox(height: 20.px),
                  Wrap(
                    children: List.generate(
                      controller.listOfTime.length,
                      (index) => tabBarText(index: index),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  paymentTypeDis(title: 'Price', price: '140'),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnPayNowButton(),
                    child: Text(
                      StringConstants.payNow,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall
                          ?.copyWith(fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: 40.px),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  paymentTypeDis({String title = '', String price = ''}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 14.px),
        ),
        Text(
          CommonWidgets.cur + price,
          style: Theme.of(Get.context!)
              .textTheme
              .displayMedium
              ?.copyWith(fontSize: 14.px),
        ),
      ],
    );
  }

  tabBarText({required int index}) {
    return GestureDetector(
      onTap: () => controller.clickOnCard(index: index),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.px, horizontal: 1.px),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            color:
                controller.selectedTabs.contains(controller.listOfTime[index])
                    ? Theme.of(Get.context!).primaryColor
                    : Colors.transparent,
            border: Border.all(
                color: Theme.of(Get.context!).colorScheme.onSecondary),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 20.px),
            child: Text(
              controller.listOfTime[index],
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 10.px,
                  color: controller.selectedTabs
                          .contains(controller.listOfTime[index])
                      ? Theme.of(Get.context!).scaffoldBackgroundColor
                      : Theme.of(Get.context!).textTheme.displayMedium?.color),
            ),
          ),
        ),
      ),
    );
  }
}
