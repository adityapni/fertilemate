import 'dart:io';

import 'package:fertility_boost/app/modules/health_report/controllers/health_report_controller.dart';
import 'package:fertility_boost/common/common_methods.dart';
import 'package:fertility_boost/common/date_picker_view.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:intl/intl.dart';

class HealthReportView extends StatelessWidget {
  const HealthReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HealthReportController());
    final iconColor = Theme.of(context).textTheme.labelMedium?.color!;

    return  Scaffold(
      appBar: CommonWidgets.appBarView(title: 'Send Health Report'),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            CommonWidgets.commonTextFieldForLoginSignUP(
              controller: controller.bloodNameController,
                hintText: 'Blood name'
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: controller.reportDateController,
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                controller.reportDate.value =  await PickDate.pickDateView(color: Theme.of(Get.context!).primaryColor);
                if(controller.reportDate.value != null){
                  final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
                  final String formatted = dateFormat.format(controller.reportDate.value!);
                  controller.reportDateController.text = formatted;
                }
              },
              decoration: InputDecoration(
                hintText: 'Report date',
                fillColor: const Color(0xffF8F8F8),
                filled: true
              ),
            ),
            SizedBox(height: 20,),
            CommonWidgets.commonTextFieldForLoginSignUP(
              controller: controller.bloodController,
                hintText: 'Blood'
            ),
            SizedBox(height: 20,),
            DropdownButtonFormField(
              hint: Text('Type'),
              items: [
                DropdownMenuItem(child: Text('Document'),value: 'Document',),
                DropdownMenuItem(child: Text('Blood'),value: 'Blood',)
              ],
              decoration: InputDecoration(
                fillColor: const Color(0xffF8F8F8),
                filled: true,
                border: InputBorder.none
              ),
              onChanged: (value){
                controller.type.value = value??'';
                controller.typeController.text = value??'';
              },
            ),
            SizedBox(height: 20,),
            // OutlinedButton(onPressed: () async {
            //   FilePickerResult? result = await FilePicker.platform.pickFiles();
            //   if (result != null) {
            //     File file = File(result.files.single.path!);
            //   } else {
            //     // User canceled the picker
            //   }
            // }, child: Text('Document')),
            TextFormField(
              onTap: () async {
                FocusScope.of(context).requestFocus(FocusNode());
                FilePickerResult? result = await FilePicker.platform.pickFiles();
                if (result != null) {
                  File file = File(result.files.single.path!);
                  controller.file.value = file;
                  controller.documentController.text = file.uri.pathSegments.last;
                } else {
                  // User canceled the picker
                }
              },
              decoration: InputDecoration(
                hintText: 'Upload Document',
                suffixIcon: Icon(Icons.upload_file,color: iconColor,),
                fillColor: const Color(0xffF8F8F8),
                filled: true
              ),
              controller: controller.documentController
            ),
            SizedBox(height: 20,),
            CommonWidgets.commonElevatedButton(
              onPressed: () async {
                String message = await controller.onSubmitClicked();
                Get.back(result: message);
                CommonMethods.showSnackBar(message: message);
              },
              child: Text('Submit',style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w700),)
            )
          ],
        ),
      ),
    );
  }
}
