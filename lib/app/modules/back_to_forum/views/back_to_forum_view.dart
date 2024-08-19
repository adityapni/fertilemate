import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/back_to_forum_controller.dart';

class BackToForumView extends GetView<BackToForumController> {
  const BackToForumView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.px),
              child: Column(
                children: [
                  SizedBox(height: 40.px),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.px),
                        child: AspectRatio(
                          aspectRatio: 8.px / 10.px,
                          child: Image.asset(
                            ImageConstants.imageYourQuestionHasBeenPosted,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 4.px),
                      Text(
                        'Your question has been posted!',
                        textAlign: TextAlign.center,
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 34.px,
                                ),
                      ),
                      SizedBox(height: 4.px),
                      Text(
                        'Stay tuned for answers from the community.',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 12.px,
                            ),
                      ),
                      SizedBox(height: 40.px),
                      CommonWidgets.commonElevatedButton(
                        onPressed: () =>
                            controller.clickOnGoBackToForumButton(),
                        child: Text(
                          textAlign: TextAlign.center,
                          StringConstants.goBackToForum,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 10.px),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
