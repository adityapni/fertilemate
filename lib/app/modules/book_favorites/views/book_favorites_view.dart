import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/book_favorites_controller.dart';

class BookFavoritesView extends GetView<BookFavoritesController> {
  const BookFavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(title: StringConstants.favorites),
        body: ListView(
          children: [
            SizedBox(height: 20.px),
            SizedBox(
              height: 50.px,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.listOfTabs.length,
                itemBuilder: (context, index) => tabBarText(
                    title: controller.listOfTabs[index], index: index),
                scrollDirection: Axis.horizontal,
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
                  width: double.infinity,
                  height: 180.px,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20.px),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.px),
                        child: Image.asset(
                          height: double.infinity,
                          width: double.infinity,
                          'assets/faltu/Rectangle 41925.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8.px),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    borderRadius: BorderRadius.circular(20.px),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.px, vertical: 4.px),
                                    child: Center(
                                      child: Text(
                                        'Book',
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 14.px,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.favorite,
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor
                                          .withOpacity(.6.px),
                                    ),
                                    SizedBox(width: 4.px),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(20.px),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.px, vertical: 4.px),
                                        child: Center(
                                          child: Text(
                                            '4.9',
                                            maxLines: 1,
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium
                                                ?.copyWith(
                                                  fontSize: 14.px,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: 70.px,
                            decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(20.px),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(14.px),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "You've listened to 7 soothing",
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 20.px,
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                  SizedBox(height: 4.px),
                                  Text(
                                    '80% of your weekly sleep goel is completed',
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(fontSize: 10.px),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              itemCount: 10,
            ),
            SizedBox(height: 20.px),
          ],
        ),
      );
    });
  }

  tabBarText({required String title, required int index}) {
    return GestureDetector(
      onTap: () => controller.clickOnCard(index: index),
      child: Padding(
        padding: EdgeInsets.all(4.px),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.px),
            color: controller.selectedTab.value == index
                ? Theme.of(Get.context!).primaryColor
                : Colors.transparent,
            border: Border.all(
                color: Theme.of(Get.context!).colorScheme.onSecondary),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 20.px),
            child: Text(
              title,
              style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
                  fontSize: 16.px,
                  color: controller.selectedTab.value == index
                      ? Theme.of(Get.context!).scaffoldBackgroundColor
                      : Theme.of(Get.context!).textTheme.displayMedium?.color),
            ),
          ),
        ),
      ),
    );
  }
}
