import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../controllers/personal_trainer_book_controller.dart';

class PersonalTrainerBookView extends GetView<PersonalTrainerBookController> {
  const PersonalTrainerBookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.obs;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
              title: controller.expertConsultation.value),
          body: ListView(
            physics: const AlwaysScrollableScrollPhysics(),
            children: [
              SizedBox(height: 10.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: Text(
                  'Filter by Location',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      fontSize: 16.px,
                      color: Theme.of(context).colorScheme.onSecondary),
                ),
              ),
              SizedBox(height: 10.px),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: CommonWidgets.commonTextFieldForLoginSignUP(
                  validator: (value) => FormValidator.isNameValid(value: value),
                  borderRadius: 8.px,
                  fillColor: Theme.of(context)
                      .colorScheme
                      .onSecondary
                      .withOpacity(.2.px),
                  controller: controller.allLocationsController,
                  hintText: StringConstants.allLocations,
                  readOnly: true,
                  onTap: () => controller.clickOnAllLocationsTextField(),
                ),
              ),
              SizedBox(height: 10.px),
              (controller.personalTrainerData.isNotEmpty)
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Column(
                        children: [
                          ListView.builder(
                            itemCount: controller.personalTrainerData.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) => Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.px),
                              ),
                              child: GestureDetector(
                                onTap: () =>
                                    controller.clickOnCard(index: index),
                                child: Padding(
                                  padding: EdgeInsets.all(12.px),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonWidgets.imageView(
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: 134.px,
                                          image: controller
                                              .personalTrainerData[index]
                                              .personalTrainerImage!,
                                          radius: 20.px),
                                      SizedBox(height: 10.px),
                                      Text(
                                        controller.personalTrainerData[index]
                                                .name ??
                                            '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 14.px,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                      SizedBox(height: 6.px),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  controller
                                                          .personalTrainerData[
                                                              index]
                                                          .description ??
                                                      '',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                        fontSize: 12.px,
                                                      ),
                                                ),
                                                SizedBox(height: 6.px),
                                                Text(
                                                  '${CommonWidgets.cur} ${controller.personalTrainerData[index].consultFee ?? ''}/Session',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                        fontSize: 12.px,
                                                      ),
                                                ),
                                                SizedBox(height: 6.px),
                                                Text(
                                                  '${controller.personalTrainerData[index].personalTrainerAddress1 ?? ''} ${controller.personalTrainerData[index].personalTrainerAddress2 ?? ''} ${controller.personalTrainerData[index].personalTrainerCity ?? ''}',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall
                                                      ?.copyWith(
                                                        fontSize: 12.px,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          CommonWidgets.commonElevatedButton(
                                            wantContentSizeButton: true,
                                            onPressed: () =>
                                                controller.clickOnBookButton(
                                                    index: index),
                                            child: Text(
                                              StringConstants.book,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.px),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20.px),
                        ],
                      ),
                    )
                  : controller.personalTrainerGetPersonalTrainerModel == null
                      ? const SizedBox()
                      : Center(child: CommonWidgets.dataNotFound()),
            ],
          ),
        ),
      );
    });
  }
}
