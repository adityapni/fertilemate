import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/ecommerce_detail_controller.dart';

class EcommerceDetailView extends GetView<EcommerceDetailController> {
  const EcommerceDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
            appBar: CommonWidgets.appBarView(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (controller.product != null)
                      Align(
                        alignment: Alignment.center,
                        child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (controller.product!.productImage != null &&
                                    controller
                                        .product!.productImage!.isNotEmpty)
                                  AspectRatio(
                                    aspectRatio: 13.px / 9.px,
                                    child: CommonWidgets.imageView(
                                      image: controller.product!.productImage
                                          .toString(),
                                      height: double.infinity,
                                      width: double.infinity,
                                    ),
                                  ),
                                if (controller.product!.productImage != null &&
                                    controller
                                        .product!.productImage!.isNotEmpty)
                                  SizedBox(height: 20.px),
                                if (controller.product!.productName != null &&
                                    controller.product!.productName!.isNotEmpty)
                                  Text(
                                    controller.product!.productName.toString(),
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 20.px,
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                if (controller.product!.productName != null &&
                                    controller.product!.productName!.isNotEmpty)
                                  SizedBox(height: 4.px),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (controller
                                                .product!.productUnitMeasure !=
                                            null &&
                                        controller.product!.productUnitMeasure!
                                            .isNotEmpty &&
                                        controller.product!.productUnit !=
                                            null &&
                                        controller
                                            .product!.productUnit!.isNotEmpty)
                                      Text(
                                        controller.product!.productUnit
                                                .toString() +
                                            controller
                                                .product!.productUnitMeasure
                                                .toString(),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 12.px,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary
                                                  .withOpacity(.4),
                                            ),
                                      ),
                                    /*IconButton(
                                      onPressed: () =>
                                          controller.clickOnFavoriteIcon(),
                                      icon: Icon(
                                        Icons.favorite_border,
                                        color: controller.isLike.value?Theme.of(context).primaryColor:Theme.of(context).colorScheme.error,
                                        size: 24.px,
                                      ),
                                    ),*/
                                  ],
                                ),
                                SizedBox(height: 4.px),
                                Row(
                                  children: [
                                    Image.asset(
                                      ImageConstants.imageRating,
                                      height: 14.px,
                                    ),
                                    SizedBox(width: 10.px),
                                    Text(
                                      "4.0",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 8.px),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        GestureDetector(
                                          onTap: () =>
                                              controller.clickOnRemoveButton(),
                                          child: Image.asset(
                                              IconConstants.icRemove,
                                              height: 24.px,
                                              width: 24.px),
                                        ),
                                        SizedBox(width: 10.px),
                                        Text(
                                          controller.quantity.value.toString(),
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(fontSize: 14.px),
                                        ),
                                        SizedBox(width: 10.px),
                                        GestureDetector(
                                          onTap: () =>
                                              controller.clickOnAddButton(),
                                          child: Image.asset(
                                              IconConstants.icAddButton,
                                              height: 24.px,
                                              width: 24.px),
                                        ),
                                      ],
                                    ),
                                    if (controller.product!.productPrice !=
                                            null &&
                                        controller
                                            .product!.productPrice!.isNotEmpty)
                                      Text(
                                        CommonWidgets.cur +
                                            controller.product!.productPrice
                                                .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                              fontSize: 16.px,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      ),
                                  ],
                                ),
                                SizedBox(height: 8.px),
                                if (controller.product!.productDescription !=
                                        null &&
                                    controller.product!.productDescription!
                                        .isNotEmpty)
                                  Text(
                                    "Description",
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 18.px,
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                if (controller.product!.productDescription !=
                                        null &&
                                    controller.product!.productDescription!
                                        .isNotEmpty)
                                  SizedBox(height: 4.px),
                                if (controller.product!.productDescription !=
                                        null &&
                                    controller.product!.productDescription!
                                        .isNotEmpty)
                                  Html(
                                    data: controller.product!.productDescription
                                        .toString(),
                                  ),
                                /*ReadMoreText(
                                    controller
                                          .product!.productDescription
                                          .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(fontSize: 12.px),
                                    lessStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontSize: 12.px,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                    moreStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall
                                        ?.copyWith(
                                          fontSize: 12.px,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                  ),*/
                                SizedBox(height: 15.px),
                                if (controller.address.isNotEmpty)
                                  headingText(title: StringConstants.address),
                                if (controller.address.isNotEmpty)
                                  SizedBox(height: 10.px),
                                if (controller.address.isNotEmpty)
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(15.px),
                                    ),
                                    child: Column(
                                      children: [
                                        if (controller.address.isNotEmpty)
                                          SizedBox(
                                            child: ListView.builder(
                                              itemCount:
                                                  controller.address.length,
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemBuilder: (context, index) {
                                                return Obx(() {
                                                  return RadioListTile<String>(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.px),
                                                    ),
                                                    secondary: Image.asset(
                                                        IconConstants
                                                            .icLocation,
                                                        height: 24.px,
                                                        width: 24.px),
                                                    controlAffinity:
                                                        ListTileControlAffinity
                                                            .trailing,
                                                    activeColor:
                                                        Theme.of(context)
                                                            .primaryColor,
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
                                                        .address[index]
                                                        .addressId
                                                        .toString(),
                                                    groupValue: controller
                                                        .selectedAddressId
                                                        .value,
                                                    onChanged: (value) {
                                                      controller
                                                          .selectedAddressId
                                                          .value = value!;
                                                      controller.selectedAddress
                                                              .value =
                                                          '${controller.address[index].addressName} ${controller.address[index].addressStreetAddress} ${controller.address[index].addressCity} ${controller.address[index].addressState} ${controller.address[index].addressPostalCode}';
                                                    },
                                                  );
                                                });
                                              },
                                            ),
                                          ),
                                        InkWell(
                                          onTap: () =>
                                              controller.clickOnAddAddress(),
                                          borderRadius:
                                              BorderRadius.circular(15.px),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 10.px,
                                                horizontal: 14.px),
                                            child: Row(
                                              children: [
                                                Image.asset(IconConstants.icAdd,
                                                    height: 24.px,
                                                    width: 24.px),
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
                                SizedBox(height: 24.px),
                                CommonWidgets.commonElevatedButton(
                                  onPressed: () =>
                                      controller.clickOnBuyNowButton(),
                                  child: Text(
                                    StringConstants.buyNow,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall
                                        ?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            )),
      );
    });
  }

  headingText({String title = '', double? fontSize}) {
    return Text(
      title,
      style: Theme.of(Get.context!)
          .textTheme
          .displayMedium
          ?.copyWith(fontSize: fontSize ?? 16.px),
    );
  }
}
