import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/supportive_community_controller.dart';

class SupportiveCommunityView extends GetView<SupportiveCommunityController> {
  const SupportiveCommunityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CommonWidgets.appBarView(title: StringConstants.supportiveCommunity),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                Text(
                  StringConstants.welcomeToFertilityChat,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 22.px, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 4.px),
                Text(
                  StringConstants.connectWithOthersOnYourFertilityJourney,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                SizedBox(height: 20.px),
                Card(
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.px)),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(10.px),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  StringConstants
                                      .findSupportAndGuidanceFromOurCommunity,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 16.px,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor),
                                ),
                                SizedBox(height: 10.px),
                                CommonWidgets.commonElevatedButton(
                                  wantContentSizeButton: true,
                                  onPressed: () =>
                                      controller.clickOnJoinNowButton(),
                                  buttonColor:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  child: Text(
                                    StringConstants.joinNow,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 16.px,
                                            color:
                                                Theme.of(context).primaryColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              ImageConstants.imageSupportiveCommunity,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.px),
                Text(
                  StringConstants.exploreOurForumsAndChatRooms,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(fontSize: 22.px),
                ),
                SizedBox(height: 20.px),
              ],
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Wrap(
                children:
                    List.generate(controller.listOfCardTitle.length, (index) {
                  final cellWidth =
                      MediaQuery.of(Get.context!).size.width / 2.2;
                  return SizedBox(
                    width: cellWidth,
                    child: Obx(
                      () => GestureDetector(
                        onTap: () => controller.clickOnCard(index: index),
                        child: Padding(
                          padding: EdgeInsets.all(4.px),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.px)),
                            elevation: .4.px,
                            color: (index != controller.selectedCard.value)
                                ? Theme.of(context).scaffoldBackgroundColor
                                : Theme.of(context).primaryColor,
                            child: Padding(
                              padding: EdgeInsets.all(12.px),
                              child: Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.px),
                                    child: Image.asset(
                                      controller.listOfCardTitle[index]['icon'],
                                      height: 54.px,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(height: 8.px),
                                  Text(
                                    controller.listOfCardTitle[index]['title'],
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 14.px,
                                            color: (index !=
                                                    controller
                                                        .selectedCard.value)
                                                ? Theme.of(context).primaryColor
                                                : Theme.of(context)
                                                    .scaffoldBackgroundColor),
                                  ),
                                ],
                              ),
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
          SizedBox(height: 20.px),
        ],
      ),
    );
  }
}
