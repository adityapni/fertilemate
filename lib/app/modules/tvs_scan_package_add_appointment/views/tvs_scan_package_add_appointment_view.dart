import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tvs_scan_package_add_appointment_controller.dart';

class TvsScanPackageAddAppointmentView
    extends GetView<TvsScanPackageAddAppointmentController> {
  const TvsScanPackageAddAppointmentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TvsScanPackageAddAppointmentView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TvsScanPackageAddAppointmentView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
