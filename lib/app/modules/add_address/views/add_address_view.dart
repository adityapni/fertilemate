import 'package:fertility_boost/common/validations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../common/common_widgets.dart';
import '../../../data/constants/string_constants.dart';
import '../controllers/add_address_controller.dart';

class AddAddressView extends GetView<AddAddressController> {
  const AddAddressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.addAddress),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.px),
            child: Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.px),
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
                  SizedBox(height: 8.px),
/*
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.px),
                    child: Image.asset(
                      ImageConstants.imageMap,
                      height: 200.px,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                RadioListTile(
                    contentPadding: EdgeInsets.zero,
                    visualDensity: VisualDensity(vertical: -2.px),
                    value: false,
                    title: Text(
                      StringConstants.shipToADifferentAddress,
                      style: Theme.of(Get.context!).textTheme.titleMedium,
                    ),
                    groupValue: true,
                    onChanged: (value) {},
                  ),*/
                  Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.px, horizontal: 10.px),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.px),
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.2.px), // Background color
                    ),
                    child: TextField(
                      maxLines: 7,
                      controller: controller.otherNotesController,
                      style: Theme.of(Get.context!)
                          .textTheme
                          .titleMedium
                          ?.copyWith(
                              color: Theme.of(Get.context!).primaryColor),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: StringConstants.orderNotesOptional,
                        hintStyle: Theme.of(Get.context!).textTheme.titleMedium,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnSaveButton(),
                    child: Text(
                      StringConstants.save,
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
          ),
        ],
      ),
    );
  }

  TextEditingController textControllers({required int index}) {
    switch (index) {
      case 0:
        return controller.nameController;
      case 1:
        return controller.streetAddressController;
      case 2:
        return controller.cityController;
      case 3:
        return controller.stateController;
      case 4:
        return controller.postalCodeController;
      case 5:
        return controller.countryController;
      case 6:
        return controller.phoneController;
      default:
        return controller.emailController;
    }
  }
}
