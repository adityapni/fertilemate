import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/nutritional_guidance_quiz_controller.dart';

class NutritionalGuidanceQuizView
    extends GetView<NutritionalGuidanceQuizController> {
  const NutritionalGuidanceQuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NutritionalGuidanceQuizView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'NutritionalGuidanceQuizView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
