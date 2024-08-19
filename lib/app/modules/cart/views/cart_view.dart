import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: StringConstants.cart, wantBackButton: false),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Column(
                  children: [
                    SizedBox(height: 20.px),
                    CommonWidgets.commonTextFieldForLoginSignUP(
                      controller: controller.searchController,
                      borderRadius: 15.px,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.2),
                      hintText: StringConstants.search,
                      prefixIcon: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            IconConstants.icSearch,
                            height: 24.px,
                            width: 24.px,
                          ),
                        ],
                      ),
                      /* suffixIcon: Image.asset(
                        IconConstants.icFilter,
                        height: 24.px,
                        width: 24.px,
                      ),*/
                    ),
                    SizedBox(height: 20.px),
                    (controller.cart.isNotEmpty)
                        ? ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              if (controller.cart[index].productData != null) {
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
                                          child: Center(
                                            child: SizedBox(
                                              height: 77.px,
                                              width: 77.px,
                                              child: Card(
                                                elevation: .4,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.px)),
                                                child: CommonWidgets.imageView(
                                                  image: controller.cart[index]
                                                      .productData!.productImage
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
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
                                              if (controller
                                                          .cart[index]
                                                          .productData!
                                                          .productName !=
                                                      null &&
                                                  controller
                                                      .cart[index]
                                                      .productData!
                                                      .productName!
                                                      .isNotEmpty)
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    if (controller
                                                                .cart[index]
                                                                .productData!
                                                                .productName !=
                                                            null &&
                                                        controller
                                                            .cart[index]
                                                            .productData!
                                                            .productName!
                                                            .isNotEmpty)
                                                      Flexible(
                                                        child: Text(
                                                          controller
                                                              .cart[index]
                                                              .productData!
                                                              .productName
                                                              .toString(),
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .displayMedium
                                                              ?.copyWith(
                                                                  fontSize:
                                                                      16.px),
                                                          maxLines: 1,
                                                        ),
                                                      ),
                                                    IconButton(
                                                      onPressed: () => controller
                                                          .clickOnDeleteIcon(
                                                              index: index),
                                                      splashRadius: 18.px,
                                                      icon: Image.asset(
                                                          IconConstants
                                                              .icDelete,
                                                          height: 18.px,
                                                          width: 18.px),
                                                    )
                                                  ],
                                                ),
                                              if (controller
                                                          .cart[index]
                                                          .productData!
                                                          .productUnit !=
                                                      null &&
                                                  controller
                                                      .cart[index]
                                                      .productData!
                                                      .productUnit!
                                                      .isNotEmpty &&
                                                  controller
                                                          .cart[index]
                                                          .productData!
                                                          .productUnitMeasure !=
                                                      null &&
                                                  controller
                                                      .cart[index]
                                                      .productData!
                                                      .productUnitMeasure!
                                                      .isNotEmpty)
                                                Text(
                                                  controller
                                                          .cart[index]
                                                          .productData!
                                                          .productUnitMeasure
                                                          .toString() +
                                                      controller
                                                          .cart[index]
                                                          .productData!
                                                          .productUnit
                                                          .toString(),
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                          fontSize: 12.px),
                                                ),
                                              SizedBox(height: 4.px),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () => controller
                                                            .clickOnRemoveIcon(
                                                                index: index),
                                                        child: Image.asset(
                                                            IconConstants
                                                                .icRemove,
                                                            height: 24.px,
                                                            width: 24.px),
                                                      ),
                                                      SizedBox(width: 4.px),
                                                      Text(
                                                        controller.cart[index]
                                                            .cartQuantity
                                                            .toString(),
                                                        maxLines: 1,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayMedium
                                                            ?.copyWith(
                                                                fontSize:
                                                                    14.px),
                                                      ),
                                                      SizedBox(width: 4.px),
                                                      GestureDetector(
                                                        onTap: () => controller
                                                            .clickOnAddIcon(
                                                                index: index),
                                                        child: Image.asset(
                                                            IconConstants
                                                                .icAddButton,
                                                            height: 24.px,
                                                            width: 24.px),
                                                      ),
                                                    ],
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      CommonWidgets.cur +
                                                          (double.parse(controller
                                                                          .cart[
                                                                              index]
                                                                          .productData!
                                                                          .productPriceFinal ??
                                                                      '0') *
                                                                  double.parse(controller
                                                                          .cart[
                                                                              index]
                                                                          .cartQuantity ??
                                                                      '0'))
                                                              .toString(),
                                                      maxLines: 1,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                            fontSize: 14.px,
                                                            color: Theme.of(
                                                                    context)
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
                              }
                              return CommonWidgets.dataNotFound();
                            },
                            itemCount: controller.cart.length)
                        : (controller.cartsModel == null)
                            ? const SizedBox()
                            : Center(child: CommonWidgets.dataNotFound()),
                    if (controller.cartsModel != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.cartsModel!.subTotal != null &&
                              controller.cartsModel!.subTotal != 0)
                            SizedBox(height: 20.px),
                          if (controller.cartsModel!.subTotal != null &&
                              controller.cartsModel!.subTotal != 0)
                            headingText(title: StringConstants.paymentDetail),
                          SizedBox(height: 10.px),
                          if (controller.cartsModel!.totalAmount != null &&
                              controller.cartsModel!.totalAmount != "0")
                            paymentTypeDis(
                                title: StringConstants.total,
                                price: controller.cartsModel!.totalAmount
                                    .toString()),
                          if (controller.cartsModel!.total != null &&
                              controller.cartsModel!.total != 0)
                            SizedBox(height: 20.px),
                          if (controller.address.isNotEmpty)
                            headingText(title: StringConstants.address),
                          if (controller.address.isNotEmpty)
                            SizedBox(height: 10.px),
                          if (controller.address.isNotEmpty)
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
                                                    BorderRadius.circular(
                                                        15.px),
                                              ),
                                              secondary: Image.asset(
                                                  IconConstants.icLocation,
                                                  height: 24.px,
                                                  width: 24.px),
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              activeColor: Theme.of(context)
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
                                                  .address[index].addressId
                                                  .toString(),
                                              groupValue: controller
                                                  .selectedAddressId.value,
                                              onChanged: (value) {
                                                controller.selectedAddressId
                                                    .value = value!;
                                                controller
                                                        .selectedAddress.value =
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
                          /* SizedBox(height: 20.px),
                        headingText(title: StringConstants.creditAndDebitCards),
                        SizedBox(height: 10.px),
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.px),
                          ),
                          child: Column(
                            children: [
                              RadioListTile<String>(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.px),
                                ),
                                visualDensity: VisualDensity.compact,
                                secondary: Image.asset(
                                    IconConstants.icMastercard,
                                    height: 24.px,
                                    width: 24.px),
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                title: Text(
                                  'Axis Bank **** **** **** 8395',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 10.px,
                                      ),
                                ),
                                value: "Hey",
                                groupValue: "newGroup",
                                onChanged: (value) {},
                              ),
                              RadioListTile<String>(
                                visualDensity: VisualDensity.compact,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.px),
                                ),
                                secondary: Image.asset(IconConstants.icVisa,
                                    height: 24.px, width: 24.px),
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                title: Text(
                                  'HDFC Bank **** **** **** 6246',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 10.px,
                                      ),
                                ),
                                value: "Hey",
                                groupValue: "newGroup",
                                onChanged: (value) {},
                              ),
                              InkWell(
                                onTap: () {},
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
                                        StringConstants.addNewCard,
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
                        headingText(
                            title: StringConstants.cardNumber, fontSize: 12.px),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                            hintText: StringConstants.enterDigitCardNumber,
                            borderRadius: 15.px,
                            fillColor: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2)),
                        SizedBox(height: 20.px),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headingText(
                                      title: StringConstants.validThru,
                                      fontSize: 12.px),
                                  SizedBox(height: 20.px),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CommonWidgets
                                            .commonTextFieldForLoginSignUP(
                                          hintText: StringConstants.month,
                                          borderRadius: 15.px,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(.2),
                                        ),
                                      ),
                                      SizedBox(width: 10.px),
                                      Expanded(
                                        child: CommonWidgets
                                            .commonTextFieldForLoginSignUP(
                                          hintText: StringConstants.year,
                                          borderRadius: 15.px,
                                          fillColor: Theme.of(context)
                                              .colorScheme
                                              .onSecondary
                                              .withOpacity(.2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 10.px),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  headingText(
                                      title: StringConstants.cvv,
                                      fontSize: 12.px),
                                  SizedBox(height: 20.px),
                                  CommonWidgets.commonTextFieldForLoginSignUP(
                                    obscureText: controller.hideCvv.value,
                                    hintText: StringConstants.cvv,
                                    borderRadius: 15.px,
                                    fillColor: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(.2),
                                    suffixIcon: GestureDetector(
                                      onTap: () =>
                                          controller.clickOnEyeButton(),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            controller.hideCvv.value
                                                ? IconConstants.icView
                                                : IconConstants.icHide,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary,
                                            height: 18.px,
                                            width: 18.px,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20.px),
                        headingText(
                            title: StringConstants.cardHoldersName,
                            fontSize: 12.px),
                        SizedBox(height: 20.px),
                        CommonWidgets.commonTextFieldForLoginSignUP(
                          hintText: StringConstants.nameOnCard,
                          borderRadius: 15.px,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2),
                        ),*/
                          if (controller.cartsModel!.total != null &&
                              controller.cartsModel!.total != 0)
                            SizedBox(height: 40.px),
                          if (controller.cartsModel!.total != null &&
                              controller.cartsModel!.total != 0)
                            CommonWidgets.commonElevatedButton(
                              onPressed: () =>
                                  controller.clickOnCheckOutButton(),
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
                      )
                  ],
                ),
              ),
            ],
          ),
        ),
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

  paymentTypeDis({String title = '', String price = ''}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(Get.context!)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: 14.px),
        ),
        Text(
          CommonWidgets.cur + price,
          style: Theme.of(Get.context!)
              .textTheme
              .titleSmall
              ?.copyWith(fontSize: 14.px),
        ),
      ],
    );
  }
}
