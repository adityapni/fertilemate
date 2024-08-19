import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../controllers/prt_profile_controller.dart';

class PrtProfileView extends GetView<PrtProfileController> {
  const PrtProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CommonWidgets.imageView(
                    image: controller.image,
                    height: 100.px,
                    width: 100.px,
                    fit: BoxFit.cover,
                    radius: 50.px),
                SizedBox(height: 20.px),
                Text(
                  controller.userName,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 20.px, color: Theme.of(context).primaryColor),
                ),
                SizedBox(height: 4.px),
                Text(
                  controller.email,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontSize: 12.px,
                      ),
                ),
                SizedBox(height: 20.px),
                ListView.builder(
                    // padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => ListTile(
                          contentPadding: EdgeInsets.zero,
                          onTap: () => controller.clickOnListTile(index: index),
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(20.px),
                            child: Image.asset(
                              controller.listOfListTileImages[index],
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
                            controller.listOfListTileTitles[index],
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                        ),
                    itemCount: controller.listOfListTileTitles.length),
                SizedBox(height: 12.px),
              ],
            ),
          ),
        ),
      );
    });
  }
}
