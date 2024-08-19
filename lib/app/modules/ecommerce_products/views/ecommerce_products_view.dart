import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../controllers/ecommerce_products_controller.dart';

class EcommerceProductsView extends GetView<EcommerceProductsController> {
  const EcommerceProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: controller.categoryName.toString()),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.px),
                    child: Column(
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
                          /*suffixIcon: Image.asset(
                            IconConstants.icFilter,
                            height: 24.px,
                            width: 24.px,
                          ),*/
                        ),
                        SizedBox(height: 20.px),
                      ],
                    ),
                  ),
                  (controller.category.isNotEmpty)
                      ? controller.searchResult.isNotEmpty ||
                              controller.searchController.text.isNotEmpty
                          ? Align(
                              alignment: Alignment.center,
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: Wrap(
                                  children: List.generate(
                                      controller.searchResult.length, (index) {
                                    final cellWidth = MediaQuery.of(
                                                Get.context!)
                                            .size
                                            .width /
                                        2.2; // Every cell's `width` will be set to 1/2 of the
                                    // screen width.
                                    return SizedBox(
                                      width: cellWidth,
                                      child: GestureDetector(
                                        onTap: () => controller.clickOnCard(
                                            productId: controller
                                                .searchResult[index].productId
                                                .toString()),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14.px)),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.px),
                                            child: Column(
                                              children: [
                                                /* Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: IconButton(
                                                    onPressed: () => controller
                                                        .clickOFavoriteIcon(),
                                                    icon: Icon(
                                                      Icons.favorite_border,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 24.px,
                                                    ),
                                                  ),
                                                ),*/
                                                CommonWidgets.imageView(
                                                  image: controller
                                                      .searchResult[index]
                                                      .productImage
                                                      .toString(),
                                                  height: 120.px,
                                                  radius: 10.px,
                                                ),
                                                SizedBox(height: 8.px),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller
                                                          .searchResult[index]
                                                          .productName
                                                          .toString(),
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                            fontSize: 14.px,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          CommonWidgets.cur +
                                                              controller
                                                                  .searchResult[
                                                                      index]
                                                                  .productPrice
                                                                  .toString(),
                                                          maxLines: 2,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .displayMedium
                                                              ?.copyWith(
                                                                  fontSize:
                                                                      14.px,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                        ),
                                                        IconButton(
                                                          onPressed: () =>
                                                              controller
                                                                  .clickOnAddIcon(
                                                                      index:
                                                                          index),
                                                          splashRadius: 18.px,
                                                          icon: Image.asset(
                                                            IconConstants.icAdd,
                                                            width: 24.px,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 8.px),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.center,
                              child: SingleChildScrollView(
                                physics: const NeverScrollableScrollPhysics(),
                                child: Wrap(
                                  children: List.generate(
                                      controller.category.length, (index) {
                                    final cellWidth = MediaQuery.of(
                                                Get.context!)
                                            .size
                                            .width /
                                        2.2; // Every cell's `width` will be set to 1/2 of the
                                    // screen width.
                                    return SizedBox(
                                      width: cellWidth,
                                      child: GestureDetector(
                                        onTap: () => controller.clickOnCard(
                                            productId: controller
                                                .category[index].productId
                                                .toString()),
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(14.px)),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.px),
                                            child: Column(
                                              children: [
                                                /*Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: IconButton(
                                                    onPressed: () => controller
                                                        .clickOFavoriteIcon(),
                                                    icon: Icon(
                                                      Icons.favorite_border,
                                                      color: Theme.of(context)
                                                          .primaryColor,
                                                      size: 24.px,
                                                    ),
                                                  ),
                                                ),*/
                                                CommonWidgets.imageView(
                                                  image: controller
                                                      .category[index]
                                                      .productImage
                                                      .toString(),
                                                  height: 120.px,
                                                  radius: 10.px,
                                                ),
                                                SizedBox(height: 8.px),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      controller.category[index]
                                                          .productName
                                                          .toString(),
                                                      maxLines: 2,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayMedium
                                                          ?.copyWith(
                                                            fontSize: 14.px,
                                                          ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          CommonWidgets.cur +
                                                              controller
                                                                  .category[
                                                                      index]
                                                                  .productPrice
                                                                  .toString(),
                                                          maxLines: 2,
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .displayMedium
                                                              ?.copyWith(
                                                                  fontSize:
                                                                      14.px,
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                        ),
                                                        IconButton(
                                                          onPressed: () =>
                                                              controller
                                                                  .clickOnAddIcon(
                                                                      index:
                                                                          index),
                                                          splashRadius: 18.px,
                                                          icon: Image.asset(
                                                            IconConstants.icAdd,
                                                            width: 24.px,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 8.px),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              ),
                            )
                      : controller.productsByCategoryIdModel != null
                          ? CommonWidgets.dataNotFound()
                          : const SizedBox(),
                  SizedBox(height: 20.px),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
