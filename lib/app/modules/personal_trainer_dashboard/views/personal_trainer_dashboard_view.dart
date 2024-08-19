import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/personal_trainer_dashboard_controller.dart';

class PersonalTrainerDashboardView
    extends GetView<PersonalTrainerDashboardController> {
  const PersonalTrainerDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
            title: controller.result?.name ?? '',
          ),
          body: controller.result != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: ListView(
                    children: [
                      /*Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.px),
                        child: Text(
                          controller.result!.name ?? '',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(fontSize: 16.px),
                        ),
                      ),*/
                      SizedBox(height: 20.px),
                      CommonWidgets.imageView(
                        borderRadius: BorderRadius.circular(20.px),
                        image:
                            controller.result!.personalTrainerImage.toString(),
                        radius: 20.px,
                        height: 400.px,
                        fit: BoxFit.cover,
                      ),
                      /* SizedBox(height: 20.px),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '${controller.result!.testimonials ?? ''}\n\nTestimonials',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                          Text(
                            '${controller.result!.clients ?? ''}\n\nClients',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontSize: 14.px),
                          ),
                        ],
                      ),*/
                      SizedBox(height: 20.px),
                      //Bio : ${controller.result?.companyName ?? 'Not Added'}\nGender: ${controller.result?.gender ?? 'Not Added'}
                      Text(
                        'About us : ${controller.result?.description ?? 'Not Added'}\nAddress: ${controller.result?.personalTrainerAddress1 ?? ''} ${controller.result?.personalTrainerAddress2 ?? ''} ${controller.result?.personalTrainerCity ?? ''} ${controller.result?.personalTrainerState ?? ''} ${controller.result?.personalTrainerCountry ?? ''}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        "Rate: ${CommonWidgets.cur} ${controller.result?.consultFee ?? ''}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                      SizedBox(height: 10.px),
                      Text(
                        "Description: ${controller.result?.description ?? ''}",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontSize: 16.px),
                      ),
                      SizedBox(height: 10.px),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            IconConstants.icIntimacyCalendar,
                            height: 20.px,
                            width: 20.px,
                            fit: BoxFit.contain,
                          ),
                          SizedBox(width: 10.px),
                          Flexible(
                            child: Text(
                              maxLines: 2,
                              textAlign: TextAlign.justify,
                              controller.result!.personalTrainerCreatedAt
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 12.px,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      /* SizedBox(height: 20.px),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            IconConstants.icLocation,
                            height: 20.px,
                            width: 20.px,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10.px),
                          Flexible(
                            child: Text(
                              maxLines: 2,
                              textAlign: TextAlign.justify,
                              controller.result!.personalTrainerCity.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    fontSize: 12.px,
                                  ),
                            ),
                          ),
                        ],
                      ),*/
                      SizedBox(height: 10.px),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: CommonWidgets.commonElevatedButton(
                                wantContentSizeButton: true,
                                onPressed: () => controller.clickOnBookButton(),
                                child: Text(
                                  StringConstants.book,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            SizedBox(width: 10.px),
                            Expanded(
                              child: CommonWidgets.commonElevatedButton(
                                wantContentSizeButton: true,
                                onPressed: () =>
                                    controller.clickOnChatNowButton(),
                                child: Text(
                                  StringConstants.chatNow,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40.px),
                    ],
                  ),
                )
              : controller.getPersonalTrainerDetailsModel == null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }
}
