import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/image_constants.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/trainer_net_home_controller.dart';

class TrainerNetHomeView extends GetView<TrainerNetHomeController> {
  const TrainerNetHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return WillPopScope(
        onWillPop: () => controller.onWillPop(),
        child: ProgressBar(
          inAsyncCall: controller.inAsyncCall.value,
          child: Scaffold(
            appBar: CommonWidgets.appBarView(
              title: StringConstants.appointments,
              actions: [
                Center(
                  child: CommonWidgets.imageView(
                    image: controller.userData?.image.toString() ??
                        ImageConstants.defaultNetworkImage,
                    width: 40.px,
                    height: 40.px,
                    radius: 20.px,
                  ),
                ),
                SizedBox(width: 20.px),
              ],
              wantBackButton: false,
              leading: IconButton(
                onPressed: () => controller.clickOnProfile(),
                icon: Icon(
                  Icons.dehaze_rounded,
                  size: 24.px,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
            body: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 40.px),
                      if (controller.userData != null)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.px),
                                border: Border.all(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary
                                      .withOpacity(.4.px),
                                ),
                              ),
                              padding: EdgeInsets.all(14.px),
                              child: Row(
                                children: [
                                  /* CommonWidgets.imageView(
                                  image: controller
                                      .userData!.personalTrainerImage
                                      .toString(),
                                  borderRadius: BorderRadius.circular(30.px),
                                  height: 60.px,
                                  width: 60.px,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(width: 14.px),*/
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.userData!.name.toString(),
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                  fontSize: 20.px,
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                        ),
                                        SizedBox(height: 8.px),
                                        Text(
                                          controller.userData!.description
                                              .toString(),
                                          maxLines: 2,
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.copyWith(
                                                fontSize: 14.px,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 14.px),
                                  IconButton(
                                    onPressed: () =>
                                        controller.clickOnAddButton(),
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      size: 24.px,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  /* IconButton(
                                  onPressed: () => controller.clickOnLogout(),
                                  icon: Icon(
                                    Icons.logout,
                                    size: 24.px,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),*/
                                ],
                              ),
                            ),
                            SizedBox(height: 10.px),
                            if (controller
                                        .countDoctorUpcomingAppointmentResult !=
                                    null &&
                                controller.countDoctorUpcomingAppointmentResult!
                                        .totalBooking !=
                                    null)
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.px),
                                  border: Border.all(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(.4.px),
                                  ),
                                ),
                                padding: EdgeInsets.all(14.px),
                                child: Column(
                                  children: [
                                    if (controller
                                                .countDoctorUpcomingAppointmentResult !=
                                            null &&
                                        controller
                                                .countDoctorUpcomingAppointmentResult!
                                                .totalBooking !=
                                            null)
                                      Text(
                                        "You have ${controller.countDoctorUpcomingAppointmentResult?.totalBooking} new appointments! Manage your clients' "
                                        "appointments",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(fontSize: 18.px),
                                      ),
                                    if (controller
                                                .countDoctorUpcomingAppointmentResult !=
                                            null &&
                                        controller
                                                .countDoctorUpcomingAppointmentResult!
                                                .totalBooking !=
                                            null)
                                      SizedBox(height: 10.px),
                                    if (controller.countDoctorUpcomingAppointmentResult != null &&
                                        controller
                                                .countDoctorUpcomingAppointmentResult!
                                                .totalProgress !=
                                            null &&
                                        controller
                                                .countDoctorUpcomingAppointmentResult!
                                                .totalBooking !=
                                            null)
                                      LinearProgressIndicator(
                                        value: double.parse(
                                          (controller.countDoctorUpcomingAppointmentResult!
                                                      .totalProgress! /
                                                  controller
                                                      .countDoctorUpcomingAppointmentResult!
                                                      .totalBooking!
                                                      .toInt())
                                              .toString(),
                                        ),
                                        minHeight: 8.px,
                                        borderRadius:
                                            BorderRadius.circular(8.px),
                                        color: Theme.of(context).primaryColor,
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .onSecondary
                                            .withOpacity(.4.px),
                                      )
                                  ],
                                ),
                              )
                          ],
                        ),
                      SizedBox(height: 20.px),
                      /*SizedBox(
                        height: 50.px,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.listOfTabs.length,
                          itemBuilder: (context, index) => tabBarText(
                              title: controller.listOfTabs[index],
                              index: index),
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      SizedBox(height: 10.px),*/
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
                        suffixIcon: GestureDetector(
                          onTap: () => controller.ClickOnFilter(),
                          child: Image.asset(
                            IconConstants.icFilter,
                            height: 24.px,
                            width: 24.px,
                          ),
                        ),
                      ),
                      SizedBox(height: 20.px),
                      if (controller.resultPending.isNotEmpty)
                        Text(
                          'Upcoming appointments',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                              ),
                        ),
                      if (controller.resultPending.isNotEmpty)
                        SizedBox(height: 20.px),
                      if (controller.resultPending.isNotEmpty)
                        SizedBox(
                          height: 180,
                          width: double.infinity,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.resultPending.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => controller
                                  .clickOnUpComingAppointment(index: index),
                              child: Padding(
                                padding: EdgeInsets.only(right: 8.px),
                                child: Container(
                                  width: MediaQuery.of(context).size.width /
                                      1.4.px,
                                  height: 180.px,
                                  decoration: BoxDecoration(
                                    // color: Theme.of(context).primaryColor,
                                    borderRadius: BorderRadius.circular(20.px),
                                  ),
                                  child: Stack(
                                    children: [
                                      CommonWidgets.imageView(
                                          image: controller
                                              .resultPending[index].userImage
                                              .toString(),
                                          height: double.infinity,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.4.px,
                                          fit: BoxFit.cover,
                                          radius: 20.px),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.px),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.px),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.px),
                                                    child: Center(
                                                      child: Text(
                                                        StringConstants.premium,
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
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .scaffoldBackgroundColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.px),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.px),
                                                    child: Center(
                                                      child: Text(
                                                        /* controller
                                                            .resultPending[
                                                        index]
                                                            .rating
                                                            .toString()*/
                                                        '4.2',
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
                                          ),
                                          Container(
                                            width: double.infinity,
                                            // height: 70.px,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                              borderRadius:
                                                  BorderRadius.circular(20.px),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(8.px),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    controller
                                                        .resultPending[index]
                                                        .userName
                                                        .toString(),
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 16.px,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                  ),
                                                  SizedBox(height: 4.px),
                                                  Text(
                                                    controller
                                                        .resultPending[index]
                                                        .specialInstruction
                                                        .toString(),
                                                    maxLines: 1,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium
                                                        ?.copyWith(
                                                            fontSize: 10.px),
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
                            ),
                          ),
                        ),
                      if (controller.resultAccepted.isNotEmpty)
                        SizedBox(height: 10.px),
                      if (controller.resultAccepted.isNotEmpty)
                        Text(
                          "Client: ${controller.resultAccepted.first.userName.toString()}",
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                              ),
                        ),
                      if (controller.resultAccepted.isNotEmpty)
                        SizedBox(height: 10.px),
                      if (controller.resultAccepted.isNotEmpty)
                        SizedBox(
                          height: 200.px,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.only(left: 8.px),
                              child: Container(
                                width:
                                    MediaQuery.of(context).size.width / 2.4.px,
                                height: 180.px,
                                decoration: BoxDecoration(
                                  // color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(20.px),
                                ),
                                child: Stack(
                                  children: [
                                    CommonWidgets.imageView(
                                      radius: 20.px,
                                      height: double.infinity,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      image: controller
                                          .resultAccepted[index].userImage
                                          .toString(),
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        /*Padding(
                                          padding: EdgeInsets.all(8.px),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Theme.of(context)
                                                      .scaffoldBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.px),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.px),
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
                                        ),*/
                                        Container(
                                          width: double.infinity,
                                          height: 60.px,
                                          decoration: BoxDecoration(
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(20.px),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(10.px),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Client: ${controller.resultAccepted[index].userName}',
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .displayMedium
                                                      ?.copyWith(
                                                          fontSize: 16.px,
                                                          color: Theme.of(
                                                                  context)
                                                              .primaryColor),
                                                ),
                                                SizedBox(height: 4.px),
                                                Text(
                                                  'Trainer: ${controller.resultAccepted[index].specialInstruction}',
                                                  maxLines: 1,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium
                                                      ?.copyWith(
                                                          fontSize: 10.px),
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
                            itemCount: controller.resultAccepted.length,
                          ),
                        ),
                      if (controller.trainerCategoryData.isNotEmpty)
                        SizedBox(height: 10.px),
                      if (controller.trainerCategoryData.isNotEmpty)
                        Text(
                          StringConstants.categories,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                fontSize: 14.px,
                              ),
                        ),
                      if (controller.trainerCategoryData.isNotEmpty)
                        SizedBox(height: 10.px),
                      if (controller.trainerCategoryData.isNotEmpty)
                        SizedBox(
                          height: 100.px,
                          width: double.infinity,
                          child: Obx(() {
                            controller.count.value;
                            return Center(
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount:
                                    controller.trainerCategoryData.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () =>
                                        controller.clickOnCard(index: index),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8.px),
                                      child: cards(
                                        textString: controller
                                            .trainerCategoryData[index].ptcName
                                            .toString(),
                                        iconString: controller
                                            .trainerCategoryData[index].ptcImage
                                            .toString(),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          }),
                        ),
                      SizedBox(height: 10.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget cards({
    required String textString,
    required String iconString,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        /*SizedBox(
          height: 64.px,
          width: 64.px,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.px),
            child: Image.network(
              bgImageString,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.network(ImageConstants.defaultNetworkImage);
              },
            ),
          ),
        ),*/
        CommonWidgets.imageView(image: iconString, width: 54.px, height: 54.px),
        SizedBox(height: 4.px),
        Text(
          textString,
          style: Theme.of(Get.context!).textTheme.displayMedium?.copyWith(
              fontSize: 12.px, color: Theme.of(Get.context!).primaryColor),
        ),
      ],
    );
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
