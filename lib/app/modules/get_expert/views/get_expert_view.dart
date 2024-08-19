import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/get_expert_controller.dart';

class GetExpertView extends GetView<GetExpertController> {
  const GetExpertView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.getExpert),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.px),
                Text(
                  StringConstants.letsFindYourExpert,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 22.px, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 4.px),
                Text(
                  StringConstants.connectWithFertilityDoctors,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                SizedBox(height: 20.px),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Obx(
                          () => Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.px),
                            child: ListTile(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 8.px, vertical: 4.px),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.px),
                              ),
                              tileColor: (index !=
                                      controller.selectedCard.value)
                                  ? Theme.of(context).scaffoldBackgroundColor
                                  : Theme.of(context).primaryColor,
                              onTap: () =>
                                  controller.clickOnListTile(index: index),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(4.px),
                                child: Image.asset(
                                  controller.listOfListTileTitlesImages[index]
                                      ['icon'],
                                  color:
                                      (index != controller.selectedCard.value)
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .scaffoldBackgroundColor,
                                  height: 40.px,
                                  width: 40.px,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              trailing: Image.asset(
                                IconConstants.icRightArrow,
                                height: 24.px,
                                width: 24.px,
                                fit: BoxFit.cover,
                              ),
                              title: Text(
                                controller.listOfListTileTitlesImages[index]
                                    ['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        fontSize: 14.px,
                                        color: (index ==
                                                controller.selectedCard.value)
                                            ? Theme.of(context)
                                                .scaffoldBackgroundColor
                                            : Theme.of(context).primaryColor),
                              ),
                              subtitle: Text(
                                controller.listOfListTileTitlesImages[index]
                                    ['subTitle'],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(fontSize: 14.px),
                              ),
                            ),
                          ),
                        ),
                    itemCount: controller.listOfListTileTitlesImages.length),
                SizedBox(height: 20.px),
                CommonWidgets.commonElevatedButton(
                  onPressed: () => controller.clickOnGetStartedButton(),
                  child: Text(
                    StringConstants.getStarted,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(height: 20.px),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
