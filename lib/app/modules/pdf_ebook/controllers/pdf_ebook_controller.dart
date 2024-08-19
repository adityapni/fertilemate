import 'dart:ui';

import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PdfEbookController extends GetxController {
  final count = 0.obs;
  String pdfPath = '';
  Map<String, dynamic> parameters = Get.parameters;

  WebViewController? webViewController;
  @override
  Future<void> onInit() async {
    pdfPath = parameters['pdf'] ?? '';
    super.onInit();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(pdfPath)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(pdfPath));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
