import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/book_list_overview_controller.dart';

class BookListOverviewView extends GetView<BookListOverviewController> {
  const BookListOverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(),
          body: controller.result != null
              ? ListView(
                  children: [
                    if (controller.result!.smzbpProvidersName != null &&
                        controller.result!.smzbpProvidersName!.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.result!.smzbpProvidersName != null &&
                        controller.result!.smzbpProvidersName!.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.px),
                        child: Text(
                          controller.result!.smzbpProvidersName!,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                                  fontSize: 14.px,
                                  color: Theme.of(context).primaryColor),
                        ),
                      ),
                    if (controller.result!.price != null &&
                        controller.result!.price!.isNotEmpty)
                      SizedBox(height: 20.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (controller.result!.price != null &&
                              controller.result!.price!.isNotEmpty)
                            Text(
                              CommonWidgets.cur +
                                  controller.result!.price.toString(),
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                  ),
                            ),
                          /* if (controller.result!.price != null &&
                              controller.result!.price!.isNotEmpty)*/
                          Text(
                            'Healthy morning fuel',
                            maxLines: 1,
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
                    if (controller.result!.price != null &&
                        controller.result!.price!.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.result!.price != null &&
                        controller.result!.price!.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.px, vertical: 4.px),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(.2.px),
                            borderRadius: BorderRadius.circular(20.px),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: EdgeInsets.all(20.px),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.result!.smzbpProvidersName
                                            .toString(),
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                fontSize: 14.px,
                                                color: Theme.of(context)
                                                    .primaryColor),
                                      ),
                                      SizedBox(height: 4.px),
                                      Text(
                                          controller.result!.duration
                                              .toString(),
                                          maxLines: 1,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall),
                                      /*SizedBox(height: 4.px),
                                    Text(
                                        controller.result!.smzbpProvidersName
                                            .toString(),
                                        maxLines: 1,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),*/
                                      SizedBox(height: 4.px),
                                    ],
                                  ),
                                ),
                              ),
                              if (controller.result!.smzbpProvidersImage !=
                                      null &&
                                  controller
                                      .result!.smzbpProvidersImage!.isNotEmpty)
                                SizedBox(width: 14.px),
                              if (controller.result!.smzbpProvidersImage !=
                                      null &&
                                  controller
                                      .result!.smzbpProvidersImage!.isNotEmpty)
                                CommonWidgets.imageView(
                                    image: controller
                                        .result!.smzbpProvidersImage
                                        .toString(),
                                    height: 136.px,
                                    radius: 20.px,
                                    fit: BoxFit.cover,
                                    width: 136.px)
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 20.px),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.px),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (controller.result!.aboutUs != null &&
                              controller.result!.aboutUs!.isNotEmpty)
                            Text(
                              'About',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 14.px,
                                      color: Theme.of(context).primaryColor),
                            ),
                          if (controller.result!.aboutUs != null &&
                              controller.result!.aboutUs!.isNotEmpty)
                            SizedBox(height: 4.px),
                          if (controller.result!.aboutUs != null &&
                              controller.result!.aboutUs!.isNotEmpty)
                            Text(controller.result!.aboutUs.toString(),
                                // maxLines: 1,
                                style: Theme.of(context).textTheme.titleSmall),
                          if (controller.result!.aboutUs != null &&
                              controller.result!.aboutUs!.isNotEmpty)
                            SizedBox(height: 20.px),
                          if (controller.result!.aboutUs != null &&
                              controller.result!.aboutUs!.isNotEmpty)
                            Text(
                              'Address',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 14.px,
                                      color: Theme.of(context).primaryColor),
                            ),
                          if (controller.result!.smzbpProvidersAddress1 !=
                                  null &&
                              controller
                                  .result!.smzbpProvidersAddress1!.isNotEmpty)
                            SizedBox(height: 4.px),
                          if (controller.result!.smzbpProvidersAddress1 !=
                                  null &&
                              controller
                                  .result!.smzbpProvidersAddress1!.isNotEmpty)
                            Text(
                                controller.result!.smzbpProvidersAddress1
                                    .toString(),
                                maxLines: 1,
                                style: Theme.of(context).textTheme.titleSmall),
                          if (controller.result!.rating != null &&
                              controller.result!.rating!.isNotEmpty)
                            SizedBox(height: 20.px),
                          if (controller.result!.rating != null &&
                              controller.result!.rating!.isNotEmpty)
                            Text(
                              'Rating',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      fontSize: 14.px,
                                      color: Theme.of(context).primaryColor),
                            ),
                          if (controller.result!.rating != null &&
                              controller.result!.rating!.isNotEmpty)
                            SizedBox(height: 4.px),
                          if (controller.result!.rating != null &&
                              controller.result!.rating!.isNotEmpty)
                            Text(controller.result!.rating!,
                                maxLines: 1,
                                style: Theme.of(context).textTheme.titleSmall),
                          SizedBox(height: 20.px),
                          CommonWidgets.commonElevatedButton(
                            onPressed: () =>
                                controller.clickOnSelectDateButton(),
                            child: Text(
                              StringConstants.selectDate,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.px),
                  ],
                )
              : controller.sleepManagementZenBookGetZenBookProvidersByIdModel ==
                      null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }
}
