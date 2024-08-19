import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/book_cart_controller.dart';

class BookCartView extends GetView<BookCartController> {
  const BookCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(),
        body: ListView(
          children: [
            SizedBox(height: 20.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Text(
                StringConstants.cart,
                maxLines: 1,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 24.px,
                    ),
              ),
            ),
            SizedBox(height: 20.px),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.px, vertical: 4.px),
                child: Container(
                  decoration: BoxDecoration(
                    // color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.px),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.px),
                          child: Image.asset(
                            height: 140,
                            'assets/faltu/Rectangle 41925.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 14.px),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'L',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 14.px,
                                      color: Theme.of(context).primaryColor),
                            ),
                            SizedBox(height: 4.px),
                            Text(
                              'Yoga class',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                            SizedBox(height: 4.px),
                            Text(
                              '${CommonWidgets.cur}15.00',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 14.px),
                            ),
                            SizedBox(height: 4.px),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () => controller.clickOnRemoveIcon(
                                      index: index),
                                  child: Image.asset(IconConstants.icRemove,
                                      height: 24.px, width: 24.px),
                                ),
                                SizedBox(width: 8.px),
                                Text(
                                  '01',
                                  maxLines: 1,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 14.px),
                                ),
                                SizedBox(width: 8.px),
                                GestureDetector(
                                  onTap: () =>
                                      controller.clickOnAddIcon(index: index),
                                  child: Image.asset(IconConstants.icAddButton,
                                      height: 24.px, width: 24.px),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: 3,
            ),
            SizedBox(height: 20.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.totalSemi,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px,
                        color: Theme.of(context).colorScheme.onSecondary),
                  ),
                  Text(
                    '${CommonWidgets.cur}95.00',
                    maxLines: 2,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 14.px, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: CommonWidgets.commonElevatedButton(
                onPressed: () => controller.clickOnCheckOutButton(),
                child: Text(
                  StringConstants.checkOut,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w700),
                ),
              ),
            ),
            SizedBox(height: 20.px),
          ],
        ),
      );
    });
  }
}
