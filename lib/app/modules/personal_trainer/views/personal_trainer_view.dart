import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/personal_trainer_controller.dart';

class PersonalTrainerView extends GetView<PersonalTrainerController> {
  const PersonalTrainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          body: ListView(
            children: [
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.all(12.px),
                child: Text(
                  'Find ${controller.expertConsultation.value}',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontSize: 30.px,
                      ),
                ),
              ),
              SizedBox(height: 10.px),
              if (controller.appointmentResult.isNotEmpty)
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.px, vertical: 4.px),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.px),
                        border: Border.all(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.4.px),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.px),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    StringConstants.upcomingAppointment,
                                    maxLines: 1,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(fontSize: 14.px),
                                  ),
                                ),
                                CommonWidgets.commonElevatedButton(
                                  borderRadius: 20.px,
                                  buttonColor: Theme.of(context).primaryColor,
                                  wantContentSizeButton: true,
                                  onPressed: () => controller.clickOnChatButton(
                                      index: index),
                                  child: Text(
                                    StringConstants.chatNow,
                                    style: Theme.of(Get.context!)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 12.px,
                                          fontWeight: FontWeight.w600,
                                          color: Theme.of(context)
                                              .scaffoldBackgroundColor,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                            ListTile(
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10.px),
                              leading: CommonWidgets.imageView(
                                image: controller
                                    .appointmentResult[index].doctorImage
                                    .toString(),
                                height: 60.px,
                                width: 60.px,
                                fit: BoxFit.cover,
                                radius: 8.px,
                              ),
                              title: Text(
                                'Coach: ${controller.appointmentResult[index].doctorName ?? ''}',
                                maxLines: 1,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 14.px,
                                    ),
                              ),
                              subtitle: Text(
                                'Date Time: ${controller.appointmentResult[index].datetime ?? ''}',
                                maxLines: 1,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  itemCount: controller.appointmentResult.length,
                ),
              SizedBox(height: 20.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                  onChanged: (value) => controller.searchMethod(value: value),
                  controller: controller.searchController,
                  borderRadius: 15.px,
                  fillColor:
                      Theme.of(context).colorScheme.onSecondary.withOpacity(.2),
                  hintText: StringConstants.search,
                  suffixIcon: Column(
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
              ),
              SizedBox(height: 20.px),
              /*if (controller.doctor.isNotEmpty)
                SizedBox(
                  height: 50.px,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.doctor.length,
                    itemBuilder: (context, index) => tabBarText(
                        title: controller.doctor[index].name.toString(),
                        index: index),
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              if (controller.doctor.isNotEmpty) SizedBox(height: 20.px),*/
              if (controller.personalTrainerGetPersonalTrainerCategoryModel !=
                  null)
                controller.data.isNotEmpty
                    ? controller.searchResult.isNotEmpty ||
                            controller.searchController.text.isNotEmpty
                        ? Align(
                            alignment: Alignment.center,
                            child: SingleChildScrollView(
                              child: Wrap(
                                children: List.generate(
                                    controller.searchResult.length, (index) {
                                  final cellWidth =
                                      MediaQuery.of(Get.context!).size.width /
                                          2.2.px;
                                  return SizedBox(
                                    width: cellWidth,
                                    child: GestureDetector(
                                      onTap: () => controller.clickOnCard(
                                          expertConsultationCategoriesId:
                                              controller.searchResult[index]
                                                  .expertConsultationCategoriesId
                                                  .toString()),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.px),
                                        child: Container(
                                          height: 144.px,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.px),
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary
                                                  .withOpacity(.4.px),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonWidgets.imageView(
                                                image: controller
                                                    .searchResult[index]
                                                    .ptcImage
                                                    .toString(),
                                                radius: 20.px,
                                                height: 110.px,
                                              ),
                                              if (controller
                                                  .searchResult.isNotEmpty)
                                                Padding(
                                                  padding: EdgeInsets.all(8.px),
                                                  child: Text(
                                                    controller
                                                        .searchResult[index]
                                                        .ptcName
                                                        .toString(),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 12.px,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                  ),
                                                ),
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
                              child: Wrap(
                                children: List.generate(controller.data.length,
                                    (index) {
                                  final cellWidth =
                                      MediaQuery.of(Get.context!).size.width /
                                          2.2.px;
                                  return SizedBox(
                                    width: cellWidth,
                                    child: GestureDetector(
                                      onTap: () => controller.clickOnCard(
                                          expertConsultationCategoriesId:
                                              controller.data[index]
                                                  .expertConsultationCategoriesId
                                                  .toString()),
                                      child: Padding(
                                        padding: EdgeInsets.all(4.px),
                                        child: Container(
                                          height: 144.px,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20.px),
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSecondary
                                                  .withOpacity(.4.px),
                                            ),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonWidgets.imageView(
                                                image: controller
                                                    .data[index].ptcImage
                                                    .toString(),
                                                radius: 20.px,
                                                height: 110.px,
                                              ),
                                              if (controller.data.isNotEmpty)
                                                Padding(
                                                  padding: EdgeInsets.all(8.px),
                                                  child: Text(
                                                    controller
                                                        .data[index].ptcName
                                                        .toString(),
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .displayMedium
                                                        ?.copyWith(
                                                            fontSize: 12.px,
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor),
                                                  ),
                                                ),
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
                    : Center(child: CommonWidgets.dataNotFound()),
              SizedBox(height: 20.px),
            ],
          ),
        ),
      );
    });
  }

  tabBarText({required String title, required int index}) {
    return GestureDetector(
      onTap: () => controller.clickOnFilterCard(index: index),
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
