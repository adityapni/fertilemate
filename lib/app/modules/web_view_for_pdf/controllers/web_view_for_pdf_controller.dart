import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewForPdfController extends GetxController {
  final count = 0.obs;
  WebViewController webController = WebViewController();
  final inAsyncCall = false.obs;
  Map<String, String?> parameters = Get.parameters;
  String urlPdf = '';

  @override
  Future<void> onInit() async {
    urlPdf = parameters[ApiKeyConstants.urlPdf] ?? '';
    super.onInit();
    print('urlPdf:::::::::::::::::::::${urlPdf}');
    inAsyncCall.value = true;
    webController = WebViewController()
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
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://flutter.dev'));
    inAsyncCall.value = false;
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
