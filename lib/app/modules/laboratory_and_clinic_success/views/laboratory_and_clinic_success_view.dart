import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/laboratory_and_clinic_success_controller.dart';

class LaboratoryAndClinicSuccessView
    extends GetView<LaboratoryAndClinicSuccessController> {
  const LaboratoryAndClinicSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LaboratoryAndClinicSuccessView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'LaboratoryAndClinicSuccessView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
