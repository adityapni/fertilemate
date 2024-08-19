import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/my_profile_controller.dart';

class MyProfileView extends GetView<MyProfileController> {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          extendBody: true,
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: CommonWidgets.appBarView(title: StringConstants.myProfile),
          body: controller.userData != null
              ? ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 40.px),
                          CommonWidgets.imageView(
                              image: controller.userData!.image != null &&
                                      controller.userData!.image!.isNotEmpty
                                  ? controller.userData!.image.toString()
                                  : ImageConstants.defaultNetworkImage,
                              height: 100.px,
                              width: 100.px,
                              radius: 20.px),
                          if (controller.userData!.image != null &&
                              controller.userData!.image!.isNotEmpty)
                            SizedBox(height: 20.px),
                          if (controller.userData!.userName != null &&
                              controller.userData!.userName!.isNotEmpty)
                            Text(
                              controller.userData!.userName.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 20.px,
                                      color: Theme.of(context).primaryColor),
                            ),
                          if (controller.userData!.userName != null &&
                              controller.userData!.userName!.isNotEmpty)
                            SizedBox(height: 4.px),
                          if (controller.userData!.email != null &&
                              controller.userData!.email!.isNotEmpty)
                            Text(
                              controller.userData!.email.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 12.px,
                                  ),
                            ),
                          if (controller.userData!.email != null &&
                              controller.userData!.email!.isNotEmpty)
                            SizedBox(height: 20.px),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Personal Info',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 16.px,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.color),
                            ),
                          ),
                          SizedBox(height: 20.px),
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    onTap: () =>
                                        controller.clickOnListTilePersonalInfo(
                                            index: index),
                                    trailing: /*controller
                                        .listOfListTilePersonalInfoTitles[
                                    index]==StringConstants.usCitizen
                                        ? Obx(
                                            () => CupertinoSwitch(
                                              activeColor: Theme.of(context)
                                                  .primaryColor,
                                              value:
                                                  controller.switchValue.value,
                                              onChanged: (value) {
                                                controller.switchValue.value =
                                                    !controller
                                                        .switchValue.value;
                                              },
                                            ),
                                          )
                                        :*/
                                        Text(
                                      getStringFunc(index: index),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    title: Text(
                                      controller
                                              .listOfListTilePersonalInfoTitles[
                                          index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.color),
                                    ),
                                  ),
                              itemCount: controller
                                  .listOfListTilePersonalInfoTitles.length),
                          SizedBox(height: 12.px),
                          SizedBox(height: 20.px),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              StringConstants.contactInfo,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 16.px,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.color),
                            ),
                          ),
                          SizedBox(height: 20.px),
                          ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    onTap: () =>
                                        controller.clickOnListTilePersonalInfo(
                                            index: index),
                                    trailing: Text(
                                      getStringFuncForInfo(index: index),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                    ),
                                    title: Text(
                                      controller
                                              .listOfListTileContactInfoTitles[
                                          index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium
                                          ?.copyWith(
                                              fontSize: 14.px,
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall
                                                  ?.color),
                                    ),
                                  ),
                              itemCount: controller
                                  .listOfListTileContactInfoTitles.length),
                          SizedBox(height: 20.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () => controller.clickOnEditButton(),
                            child: Text(
                              StringConstants.edit,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 10.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () => controller.clickOnDeleteButton(),
                            child: Text(
                              StringConstants.delete,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(height: 10.px),
                        ],
                      ),
                    ),
                  ],
                )
              : controller.doctorsGetProfileModel == null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }

  String getStringFunc({required int index}) {
    switch (index) {
      case 0:
        return controller.userData!.userName ?? '';
      case 1:
        return controller.userData!.occupation ?? '';
      case 2:
        return controller.userData!.gender ?? '';
      case 3:
        return controller.userData!.maritalStatus ?? '';
      case 4:
        return controller.userData!.dob ?? '';
      default:
        return 'Not';
    }
  }

  String getStringFuncForInfo({required int index}) {
    switch (index) {
      case 0:
        return controller.userData!.mobile.toString();
      default:
        return controller.userData!.email.toString();
    }
  }
}
