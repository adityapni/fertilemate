import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../controllers/tel_doc_client_detail_controller.dart';

class TelDocClientDetailView extends GetView<TelDocClientDetailController> {
  const TelDocClientDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.obs;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar:
              CommonWidgets.appBarView(title: StringConstants.clientDetails),
          body: controller.getDoctorAppointmentDetailsResult != null
              ? ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Column(
                        children: [
                          CommonWidgets.imageView(
                            image: controller
                                .getDoctorAppointmentDetailsResult!.userImage
                                .toString(),
                            height: 100.px,
                            width: 100.px,
                            fit: BoxFit.cover,
                            radius: 50.px,
                          ),
                          SizedBox(height: 20.px),
                          Text(
                            controller
                                .getDoctorAppointmentDetailsResult!.userName
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(
                                    fontSize: 20.px,
                                    color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(height: 4.px),
                          Text(
                            controller.getDoctorAppointmentDetailsResult!
                                .specialInstruction
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                  fontSize: 12.px,
                                ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20.px),
                              Text(
                                'About',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 20.px,
                                    ),
                              ),
                              SizedBox(height: 20.px),
                              Text(
                                controller.getDoctorAppointmentDetailsResult!
                                    .consultantFee
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 16.px,
                                    ),
                              ),
                              SizedBox(height: 20.px),
                              Text(
                                'Email',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                      fontSize: 20.px,
                                    ),
                              ),
                              SizedBox(height: 20.px),
                              Text(
                                controller
                                    .getDoctorAppointmentDetailsResult!.email
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                      fontSize: 16.px,
                                    ),
                              ),
                              SizedBox(height: 20.px),
                              controller.isTrainer == ApiKeyConstants.isTrainer
                                  ? Row(
                                      children: [
                                        Expanded(
                                          child: CommonWidgets
                                              .commonElevatedButton(
                                            onPressed: () => controller
                                                .clickOnAcceptButton(),
                                            child: Text(
                                              StringConstants.accept,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20.px),
                                        Expanded(
                                          child: CommonWidgets
                                              .commonElevatedButton(
                                            onPressed: () =>
                                                controller.clickOnAcceptButton(
                                                    type: ApiKeyConstants
                                                        .rejected),
                                            child: Text(
                                              StringConstants.cancel,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: CommonWidgets
                                              .commonElevatedButton(
                                            onPressed: () =>
                                                controller.clickOnChatButton(),
                                            child: Text(
                                              StringConstants.chatNow,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineSmall
                                                  ?.copyWith(
                                                      fontWeight:
                                                          FontWeight.w700),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 20.px),
                                        /*Expanded(
                                    child: CommonWidgets.commonElevatedButton(
                                      onPressed: () => controller
                                          .clickOnAppointmentsButton(),
                                      child: Text(
                                        StringConstants.appointment,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),*/
                                      ],
                                    ),
                              SizedBox(height: 20.px),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : controller.getDoctorAppointmentDetailsModel == null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }
}
