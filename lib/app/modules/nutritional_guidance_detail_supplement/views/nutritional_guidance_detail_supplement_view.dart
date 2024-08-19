import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/nutritional_guidance_detail_supplement_controller.dart';

class NutritionalGuidanceDetailSupplementView
    extends GetView<NutritionalGuidanceDetailSupplementController> {
  const NutritionalGuidanceDetailSupplementView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar:
              CommonWidgets.appBarView(title: StringConstants.supplementPlan),
          body: controller.getSupplementPlanResult.isNotEmpty
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /*Text(
                        'Ayur Lin Capsule for 1 month femira for 3 months',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 14.px),
                      ),
                      SizedBox(height: 20.px),
                      Text(
                        'Insulin Resistance Package',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 14.px),
                      ),
                      SizedBox(height: 20.px),*/
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.px),
                              ),
                              elevation: .2.px,
                              child: Padding(
                                padding: EdgeInsets.all(4.px),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: SizedBox(
                                        height: 77.px,
                                        width: 77.px,
                                        child: Card(
                                          elevation: .4,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4.px),
                                          ),
                                          child: CommonWidgets.imageView(
                                              image: controller
                                                      .getSupplementPlanResult[
                                                          index]
                                                      .image ??
                                                  ''),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.px),
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  controller
                                                      .getSupplementPlanResult[
                                                          index]
                                                      .name
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          fontSize: 16.px),
                                                  maxLines: 1,
                                                ),
                                              ),
                                              /* IconButton(
                                                onPressed: () => controller
                                                    .clickOnDeleteIcon(
                                                        index: index),
                                                splashRadius: 18.px,
                                                icon: Image.asset(
                                                    IconConstants.icDelete,
                                                    height: 18.px,
                                                    width: 18.px),
                                              )*/
                                            ],
                                          ),
                                          Text(
                                            controller
                                                .getSupplementPlanResult[index]
                                                .subTitle
                                                .toString(),
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(fontSize: 12.px),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              /*Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () => controller
                                                        .clickOnRemoveIcon(
                                                            index: index),
                                                    child: Image.asset(
                                                        IconConstants.icRemove,
                                                        height: 24.px,
                                                        width: 24.px),
                                                  ),
                                                  SizedBox(width: 4.px),
                                                  Text(
                                                    (index == 0)
                                                        ? controller.quantity
                                                            .toString()
                                                        : '2',
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 14.px),
                                                  ),
                                                  SizedBox(width: 4.px),
                                                  GestureDetector(
                                                    onTap: () => controller
                                                        .clickOnAddIcon(
                                                            index: index),
                                                    child: Image.asset(
                                                        IconConstants.icAdd,
                                                        height: 24.px,
                                                        width: 24.px),
                                                  ),
                                                ],
                                              ),*/
                                              Flexible(
                                                child: Text(
                                                  CommonWidgets.cur +
                                                      controller
                                                          .getSupplementPlanResult[
                                                              index]
                                                          .amount
                                                          .toString(),
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                        fontSize: 14.px,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: controller.getSupplementPlanResult.length),
                      SizedBox(height: 20.px),
                      if (controller.getSupplementPlanResult.isNotEmpty)
                        SizedBox(height: 10.px),
                      if (controller.getSupplementPlanResult.isNotEmpty)
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.px),
                          ),
                          child: Column(
                            children: [
                              if (controller.address.isNotEmpty)
                                SizedBox(
                                  child: ListView.builder(
                                    itemCount: controller.address.length,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      return Obx(() {
                                        return RadioListTile<String>(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.px),
                                          ),
                                          secondary: Image.asset(
                                              IconConstants.icLocation,
                                              height: 24.px,
                                              width: 24.px),
                                          controlAffinity:
                                              ListTileControlAffinity.trailing,
                                          activeColor:
                                              Theme.of(context).primaryColor,
                                          title: Text(
                                            '${controller.address[index].addressName} ${controller.address[index].addressStreetAddress} ${controller.address[index].addressCity} ${controller.address[index].addressState} ${controller.address[index].addressPostalCode}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall
                                                ?.copyWith(
                                                  fontSize: 10.px,
                                                ),
                                          ),
                                          value: controller
                                              .address[index].addressId
                                              .toString(),
                                          groupValue: controller
                                              .selectedAddressId.value,
                                          onChanged: (value) {
                                            controller.selectedAddressId.value =
                                                value!;
                                            controller.selectedAddress.value =
                                                '${controller.address[index].addressName} ${controller.address[index].addressStreetAddress} ${controller.address[index].addressCity} ${controller.address[index].addressState} ${controller.address[index].addressPostalCode}';
                                          },
                                        );
                                      });
                                    },
                                  ),
                                ),
                              InkWell(
                                onTap: () => controller.clickOnAddAddress(),
                                borderRadius: BorderRadius.circular(15.px),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.px, horizontal: 14.px),
                                  child: Row(
                                    children: [
                                      Image.asset(IconConstants.icAdd,
                                          height: 24.px, width: 24.px),
                                      SizedBox(width: 10.px),
                                      Text(
                                        StringConstants.addAddress,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontSize: 10.px,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      SizedBox(height: 20.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () => controller.clickOnCheckOutButton(),
                        child: Text(
                          StringConstants.checkOut,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                )
              : controller.getSupplementPlanModel == null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }
}
