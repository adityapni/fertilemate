import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/fertility_specialist_details_controller.dart';

class FertilitySpecialistDetailsView
    extends GetView<FertilitySpecialistDetailsController> {
  const FertilitySpecialistDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 0,
            leading: GestureDetector(
              onTap: () => controller.clickOnBackButton(),
              child: Center(
                child: Image.asset(
                  IconConstants.icBackWhite,
                  height: 40.px,
                  width: 40.px,
                ),
              ),
            ),
          ),
          body: controller.doctor != null
              ? ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            AspectRatio(
                              aspectRatio: 16.px / 7.px,
                              child: Container(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            if (controller.doctor!.image != null &&
                                controller.doctor!.image!.isNotEmpty)
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  children: [
                                    AspectRatio(
                                      aspectRatio: 16.px / 3.px,
                                      child: const SizedBox(),
                                    ),
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(70.px),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(2.px),
                                        child: Container(
                                          height: 140.px,
                                          width: 140.px,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(70.px),
                                            color: Theme.of(context)
                                                .scaffoldBackgroundColor,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(controller
                                                  .doctor!.image
                                                  .toString()),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                        if (controller.doctor!.name != null &&
                            controller.doctor!.name!.isNotEmpty)
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              controller.doctor!.name.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(fontSize: 18.px),
                            ),
                          ),
                        if (controller.doctor!.post != null &&
                            controller.doctor!.post!.isNotEmpty)
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              controller.doctor!.post.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 12.px,
                                  ),
                            ),
                          ),
                        if (controller.doctor!.post != null &&
                            controller.doctor!.post!.isNotEmpty)
                          SizedBox(height: 20.px),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.px),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              if (controller.doctor!.clinic != null &&
                                  controller.doctor!.clinic!.isNotEmpty)
                                Text(
                                  controller.doctor!.clinic.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 18.px),
                                ),
                              if (controller.doctor!.consultFee != null &&
                                  controller.doctor!.consultFee!.isNotEmpty)
                                SizedBox(height: 6.px),
                              if (controller.doctor!.consultFee != null &&
                                  controller.doctor!.consultFee!.isNotEmpty)
                                Text(
                                  'Consult Fee: ${CommonWidgets.cur} ${controller.doctor!.consultFee.toString()}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 12.px,
                                      ),
                                ),
                              if (controller.doctor!.consultFee != null &&
                                  controller.doctor!.consultFee!.isNotEmpty)
                                SizedBox(height: 10.px),
                              if (controller.doctor!.professionalProfile !=
                                      null &&
                                  controller
                                      .doctor!.professionalProfile!.isNotEmpty)
                                Text(
                                  StringConstants.professionalProfile,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 18.px),
                                ),
                              if (controller.doctor!.professionalProfile !=
                                      null &&
                                  controller
                                      .doctor!.professionalProfile!.isNotEmpty)
                                SizedBox(height: 6.px),
                              if (controller.doctor!.professionalProfile !=
                                      null &&
                                  controller
                                      .doctor!.professionalProfile!.isNotEmpty)
                                Text(
                                  controller.doctor!.professionalProfile
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 12.px,
                                      ),
                                ),
                              if (controller.doctor!.yearOfExperience != null &&
                                  controller
                                      .doctor!.yearOfExperience!.isNotEmpty)
                                SizedBox(height: 10.px),
                              if (controller.doctor!.yearOfExperience != null &&
                                  controller
                                      .doctor!.yearOfExperience!.isNotEmpty)
                                Text(
                                  StringConstants.yearOfExperience,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 18.px),
                                ),
                              if (controller.doctor!.yearOfExperience != null &&
                                  controller
                                      .doctor!.yearOfExperience!.isNotEmpty)
                                SizedBox(height: 6.px),
                              if (controller.doctor!.yearOfExperience != null &&
                                  controller
                                      .doctor!.yearOfExperience!.isNotEmpty)
                                Text(
                                  controller.doctor!.yearOfExperience
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 12.px,
                                      ),
                                ),
                              if (controller.doctor!.languages != null &&
                                  controller.doctor!.languages!.isNotEmpty)
                                SizedBox(height: 10.px),
                              if (controller.doctor!.languages != null &&
                                  controller.doctor!.languages!.isNotEmpty)
                                Text(
                                  StringConstants.languages,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 18.px),
                                ),
                              if (controller.doctor!.languages != null &&
                                  controller.doctor!.languages!.isNotEmpty)
                                SizedBox(height: 6.px),
                              if (controller.doctor!.languages != null &&
                                  controller.doctor!.languages!.isNotEmpty)
                                Text(
                                  controller.doctor!.languages.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 12.px,
                                      ),
                                ),
                              if (controller.doctor!.education != null &&
                                  controller.doctor!.education!.isNotEmpty)
                                SizedBox(height: 10.px),
                              if (controller.doctor!.education != null &&
                                  controller.doctor!.education!.isNotEmpty)
                                Text(
                                  StringConstants.education,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(fontSize: 18.px),
                                ),
                              if (controller.doctor!.education != null &&
                                  controller.doctor!.education!.isNotEmpty)
                                SizedBox(height: 6.px),
                              if (controller.doctor!.education != null &&
                                  controller.doctor!.education!.isNotEmpty)
                                Text(
                                  controller.doctor!.education.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(
                                        fontSize: 12.px,
                                      ),
                                ),
                              SizedBox(height: 20.px),
                              CommonWidgets.commonElevatedButton(
                                onPressed: () => controller.clickOnBookButton(),
                                child: Text(
                                  StringConstants.book,
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
                        SizedBox(height: 20.px),
                      ],
                    ),
                  ],
                )
              : controller.doctorsGetDoctorByIdModel == null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }
}
