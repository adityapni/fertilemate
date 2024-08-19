import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/prt_reset_password_controller.dart';

class PrtResetPasswordView extends GetView<PrtResetPasswordController> {
  const PrtResetPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PrtResetPasswordView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PrtResetPasswordView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
