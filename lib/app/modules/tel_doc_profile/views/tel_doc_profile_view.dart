import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/tel_doc_profile_controller.dart';

class TelDocProfileView extends GetView<TelDocProfileController> {
  const TelDocProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TelDocProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TelDocProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
