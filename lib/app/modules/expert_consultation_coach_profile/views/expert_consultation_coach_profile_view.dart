import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/expert_consultation_coach_profile_controller.dart';

class ExpertConsultationCoachProfileView
    extends GetView<ExpertConsultationCoachProfileController> {
  const ExpertConsultationCoachProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.obs;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: (controller.result != null)
              ? ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CommonWidgets.imageView(
                              radius: 20.px,
                              height: 220.px,
                              width: 220.px,
                              fit: BoxFit.cover,
                              image: controller.result?.image ?? ''),
                          SizedBox(height: 20.px),
                          Text(
                            'Coach: ${controller.result?.name ?? ''}',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 20.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(height: 4.px),
                          Text(
                            'Expertise: ${controller.result?.education ?? ''}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 12.px,
                                ),
                          ),
                          SizedBox(height: 4.px),
                          Text(
                            'Post: ${controller.result?.post ?? ''}',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 12.px,
                                ),
                          ),
                          /*SizedBox(height: 20.px),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Image.asset(IconConstants.icStartBlack,
                                      width: 20.px, height: 20.px),
                                  SizedBox(width: 10.px),
                                  Text(
                                    controller.result!.rating.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                        ),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${controller.result!.clients.toString()}+',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 16.px,
                                        ),
                                  ),
                                  SizedBox(width: 10.px),
                                  Text(
                                    'clients',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 14.px,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),*/
                          SizedBox(height: 20.px),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'About',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 16.px),
                            ),
                          ),
                          SizedBox(height: 10.px),
                          Text(
                            'Professional Profile: ${controller.result?.professionalProfile ?? 'Not Added'}\nClinic: ${controller.result?.clinic ?? 'Not Added'}\nYear of experience: ${controller.result?.yearOfExperience ?? 'Not Added'}\nLanguages: ${controller.result?.languages ?? 'Not Added'}\nEducation: ${controller.result?.education ?? 'Not Added'}\nNationality: ${controller.result?.nationality ?? 'Not Added'}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                          SizedBox(height: 20.px),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Address',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 16.px),
                            ),
                          ),
                          SizedBox(height: 10.px),
                          Text(
                            controller.result?.address ?? 'Not added',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontSize: 16.px,
                                ),
                          ),
                          SizedBox(height: 20.px),
                          Text(
                            'Rate: ${CommonWidgets.cur} ${controller.result!.consultFee.toString()} / session',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 16.px),
                          ),
                          SizedBox(height: 20.px),
                          Text(
                            "Description: ${controller.result?.description ?? ''}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontSize: 16.px),
                          ),
                          SizedBox(height: 10.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () => controller.clickOnBookNowButton(),
                            child: Text(
                              StringConstants.bookNow,
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
                )
              : controller.getExpertConsultationDoctorsDetailsModel == null
                  ? const SizedBox()
                  : Center(
                      child: CommonWidgets.dataNotFound(),
                    ),
        ),
      );
    });
  }
}
