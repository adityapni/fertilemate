import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/intimacy_management_controller.dart';

class IntimacyManagementView extends GetView<IntimacyManagementController> {
  const IntimacyManagementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ListView(
          children: [
            SizedBox(height: 40.px),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.intimacyManagement,
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).primaryColor, fontSize: 24.px),
                  ),
                  Text(
                    'Hi Sam Smith!',
                    style: Theme.of(context).textTheme.displayMedium?.copyWith(
                          fontSize: 18.px,
                        ),
                  ),
                  SizedBox(height: 20.px),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.px),
                    child: Image.asset(
                        height: 180.px,
                        'assets/faltu/Rectangle 41933.png',
                        fit: BoxFit.cover),
                  ),
                  SizedBox(height: 20.px),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.listOfCards.length,
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    onTap: () => controller.clickOnCard(index: index),
                    shape: Border.all(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(.4.px),
                    ),
                    leading: Image.asset(
                      controller.listOfCards[index]['icon'],
                      width: 24.px,
                      height: 24.px,
                    ),
                    title: Text(
                      controller.listOfCards[index]['title'],
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 18.px,
                              ),
                    ),
                  ),
                  SizedBox(height: 4.px)
                ],
              ),
            ),
            SizedBox(height: 10.px),
          ],
        ),
      );
    });
  }
}
