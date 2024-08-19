import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/progress_bar.dart';
import '../../../../common/validations.dart';
import '../../../data/constants/icons_constant.dart';
import '../controllers/clinic_detail_controller.dart';

class ClinicDetailView extends GetView<ClinicDetailController> {
  const ClinicDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(title: controller.title),
          body: controller.category != null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.px),
                  child: ListView(children: [
                    if (controller.category!.clinicImage != null &&
                        controller.category!.clinicImage!.isNotEmpty)
                      CommonWidgets.imageView(
                          image: controller.category!.clinicImage.toString(),
                          width: double.infinity,
                          height: 180.px,
                          radius: 20.px),
                    if (controller.category!.clinicImage != null &&
                        controller.category!.clinicImage!.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.category!.clinicName != null &&
                        controller.category!.clinicName!.isNotEmpty)
                      Text(
                        controller.category!.clinicName!.toString(),
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 20.px),
                      ),
                    if (controller.category!.clinicName != null &&
                        controller.category!.clinicName!.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.category!.clinicAddress != null &&
                        controller.category!.clinicAddress!.isNotEmpty)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            IconConstants.icRouteLocation,
                            height: 20.px,
                            width: 20.px,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10.px),
                          Flexible(
                            child: Text(
                              StringConstants.address,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 12.px),
                            ),
                          ),
                        ],
                      ),
                    if (controller.category!.clinicAddress != null &&
                        controller.category!.clinicAddress!.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.category!.clinicAddress != null &&
                        controller.category!.clinicAddress!.isNotEmpty)
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              Clipboard.setData(ClipboardData(
                                      text: controller.category!.clinicAddress
                                          .toString()))
                                  .then((_) {
                                CommonWidgets.snackBarView(
                                    title: 'Copied to your clipboard !');
                              });
                            },
                            borderRadius: BorderRadius.circular(8.px),
                            child: Padding(
                              padding: EdgeInsets.all(4.px),
                              child: Icon(
                                Icons.copy,
                                size: 24.px,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.px),
                          Flexible(
                            child: InkWell(
                              onLongPress: () async {
                                Clipboard.setData(ClipboardData(
                                        text: controller.category!.clinicAddress
                                            .toString()))
                                    .then((_) async {
                                  /*final query =
                                      "1600 Amphiteatre Parkway, Mountain View";
                                  var addresses = await Geocoder.local
                                      .findAddressesFromQuery(query);
                                  var first = addresses.first;
                                  print(
                                      "${first.featureName} : ${first.coordinates}");*/

                                  CommonWidgets.snackBarView(
                                      title: 'Copied to your clipboard !');
                                });
                              },
                              borderRadius: BorderRadius.circular(4.px),
                              child: Padding(
                                padding: EdgeInsets.all(4.px),
                                child: Text(
                                  controller.category!.clinicAddress.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 12.px),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    if (controller.category!.clinicMonday != null &&
                        controller.category!.clinicMonday!.isNotEmpty)
                      SizedBox(height: 20.px),
                    if (controller.category!.clinicMonday != null &&
                        controller.category!.clinicMonday!.isNotEmpty)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            IconConstants.icClock,
                            height: 20.px,
                            width: 20.px,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10.px),
                          Flexible(
                            child: Text(
                              StringConstants.operationTime,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontSize: 12.px),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(height: 16.px),
                    Text(
                      StringConstants.openingHours,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                              ),
                    ),
                    if (controller.category!.clinicMonday != null &&
                        controller.category!.clinicMonday!.isNotEmpty)
                      SizedBox(height: 6.px),
                    if (controller.category!.clinicMonday != null &&
                        controller.category!.clinicMonday!.isNotEmpty)
                      Text(
                        "Monday - ${controller.category!.clinicMonday.toString()}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (controller.category!.clinicTuesday != null &&
                        controller.category!.clinicTuesday!.isNotEmpty)
                      SizedBox(height: 6.px),
                    if (controller.category!.clinicTuesday != null &&
                        controller.category!.clinicTuesday!.isNotEmpty)
                      Text(
                        "Tuesday - ${controller.category!.clinicTuesday.toString()}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (controller.category!.clinicWednesday != null &&
                        controller.category!.clinicWednesday!.isNotEmpty)
                      SizedBox(height: 6.px),
                    if (controller.category!.clinicWednesday != null &&
                        controller.category!.clinicWednesday!.isNotEmpty)
                      Text(
                        "Wednesday - ${controller.category!.clinicWednesday.toString()}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (controller.category!.clinicThursday != null &&
                        controller.category!.clinicThursday!.isNotEmpty)
                      SizedBox(height: 6.px),
                    if (controller.category!.clinicThursday != null &&
                        controller.category!.clinicThursday!.isNotEmpty)
                      Text(
                        "Thursday - ${controller.category!.clinicThursday.toString()}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (controller.category!.clinicFriday != null &&
                        controller.category!.clinicFriday!.isNotEmpty)
                      SizedBox(height: 6.px),
                    if (controller.category!.clinicFriday != null &&
                        controller.category!.clinicFriday!.isNotEmpty)
                      Text(
                        "Friday - ${controller.category!.clinicFriday.toString()}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (controller.category!.clinicSaturday != null &&
                        controller.category!.clinicSaturday!.isNotEmpty)
                      SizedBox(height: 6.px),
                    if (controller.category!.clinicSaturday != null &&
                        controller.category!.clinicSaturday!.isNotEmpty)
                      Text(
                        "Saturday - ${controller.category!.clinicSaturday.toString()}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (controller.category!.clinicSunday != null &&
                        controller.category!.clinicSunday!.isNotEmpty)
                      SizedBox(height: 6.px),
                    if (controller.category!.clinicSunday != null &&
                        controller.category!.clinicSunday!.isNotEmpty)
                      Text(
                        "Sunday - ${controller.category!.clinicSunday.toString()}",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    SizedBox(height: 20.px),
                    Text(
                      StringConstants.package,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                              ),
                    ),
                    SizedBox(height: 8.px),
                    if (controller.category!.package != null &&
                        controller.category!.package!.isNotEmpty)
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: controller.category!.package!.length,
                        itemBuilder: (context, index) => Theme(
                          data: ThemeData(
                              unselectedWidgetColor:
                                  Theme.of(context).primaryColor),
                          child: CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              '${CommonWidgets.cur}${controller.category!.package?[index].mrp}',
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                    fontSize: 14.px,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                            subtitle: Text(
                              controller.category!.package?[index].testName ??
                                  '',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(fontSize: 12.px),
                            ),
                            activeColor: Theme.of(context).primaryColor,
                            controlAffinity: ListTileControlAffinity.leading,
                            value: controller.selectedTestList.contains(
                                controller.category!.package?[index].id
                                    .toString()),
                            onChanged: (bool? value) {
                              if (controller.selectedTestList.contains(
                                  controller.category!.package?[index].id
                                      .toString())) {
                                controller.selectedTestList.remove(controller
                                    .category!.package?[index].id
                                    .toString());
                                controller.selectedTestListAmount.remove(
                                    controller.category!.package?[index].mrp
                                        .toString());
                              } else {
                                controller.selectedTestList.add(controller
                                    .category!.package?[index].id
                                    .toString());
                                controller.selectedTestListAmount.add(controller
                                    .category!.package![index].mrp
                                    .toString());
                              }
                              controller.increment();
                            },
                          ),
                        ),
                      ),
                    SizedBox(height: 20.px),
                    Text(
                      StringConstants.form,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontSize: 14.px,
                              ),
                    ),
                    SizedBox(height: 8.px),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.listOfTextTitle.length,
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.symmetric(vertical: 4.px),
                        child: CommonWidgets.commonTextFieldForLoginSignUP(
                          validator: (value) =>
                              FormValidator.isEmptyValid(value: value),
                          controller: textControllers(index: index),
                          fillColor: Theme.of(context)
                              .colorScheme
                              .onSecondary
                              .withOpacity(.2.px),
                          hintText: controller.listOfTextTitle[index]['hint'],
                        ),
                      ),
                    ),
                    SizedBox(height: 20.px),
                    CommonWidgets.commonElevatedButton(
                      onPressed: () => controller.clickOnCheckOutButton(),
                      child: Text(
                        StringConstants.bookNow,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(height: 20.px),
                  ]),
                )
              : controller.availableClinicsGetAvailableClinicsByIdModel == null
                  ? const SizedBox()
                  : Center(child: CommonWidgets.dataNotFound()),
        ),
      );
    });
  }

  TextEditingController textControllers({required int index}) {
    switch (index) {
      case 0:
        return controller.fullNameController;
      case 1:
        return controller.icNoController;
      case 2:
        return controller.telNoController;
      case 3:
        return controller.dateOfBirthController;
      case 4:
        return controller.genderController;
      case 5:
        return controller.ageController;
      default:
        return controller.emailController;
    }
  }
}
