import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/fertility_education_ebook_read_image_slider_controller.dart';

class FertilityEducationEbookReadImageSliderView
    extends GetView<FertilityEducationEbookReadImageSliderController> {
  const FertilityEducationEbookReadImageSliderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Simple Example')),
      body: controller.webViewController != null
          ? WebViewWidget(controller: controller.webViewController!)
          : SizedBox(),
    );
  }
}
