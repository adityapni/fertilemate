import 'package:advance_pdf_viewer_fork/advance_pdf_viewer_fork.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_e_book_by_category_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class FertilityEducationExploreOurEBookDetailController extends GetxController {
  final count = 0.obs;
  GetEBookByCategoryModel? getEBookByCategoryModel;
  Map<String, dynamic> queryParameters = {};
  Map<String, dynamic> parameters = Get.parameters;
  String ebookCategoryId = '';
  List<Result> result = [];

  final inAsyncCall = false.obs;
  Map<String, String> parameter = {};

  @override
  Future<void> onInit() async {
    ebookCategoryId = parameters[ApiKeyConstants.ebookCategoryId] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await onInitWork();
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

  clickOnReadButton({required int index}) async {
    Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (context) => PdfPage(
          pdfUrl: result[index].bookPdf.toString(),
        ),
      ),
    );
  }

  Future<void> onInitWork() async {
    await getEbookCategoryApi();
  }

  Future<void> getEbookCategoryApi() async {
    queryParameters = {ApiKeyConstants.ebookCategoryId: ebookCategoryId};
    getEBookByCategoryModel =
        await ApiMethods.getEBookByCategory(queryParameters: queryParameters);
    if (getEBookByCategoryModel != null &&
        getEBookByCategoryModel!.result != null &&
        getEBookByCategoryModel!.result!.isNotEmpty) {
      result = getEBookByCategoryModel!.result!;
    }
  }
}

class PdfPage extends StatefulWidget {
  String pdfUrl;

  PdfPage({super.key, required this.pdfUrl});

  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  bool _isLoading = true;
  PDFDocument? document;
  bool _usePDFListView = false;

  @override
  void initState() {
    super.initState();
    loadDocument();
  }

  @override
  void dispose() {
    document!.clearImageCache();
    document = null;
    super.dispose();
  }

  loadDocument() async {
    setState(() => _isLoading = true);
    document = await PDFDocument.fromURL(widget.pdfUrl);
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(),
      body: Column(
        children: <Widget>[
          !_usePDFListView
              ? Expanded(
                  child: Center(
                    child: _isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : PDFViewer(
                            document: document!,
                            scrollDirection: Axis.vertical,
                            zoomSteps: 1,
                            //uncomment below line to preload all pages
                            // lazyLoad: false,
                            // uncomment below line to scroll vertically
                            // scrollDirection: Axis.vertical,

                            // enableSwipeNavigation: false,
                            showPicker: false,
                            showNavigation: true,
                            //uncomment below code to replace bottom navigation with your own
                            /* navigationBuilder:
                            (context, page, totalPages, jumpToPage, animateToPage) {
                          return ButtonBar(
                            alignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.first_page),
                                onPressed: () {
                                  jumpToPage()(page: 0);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: () {
                                  animateToPage(page: page - 2);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.arrow_forward),
                                onPressed: () {
                                  animateToPage(page: page);
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.last_page),
                                onPressed: () {
                                  jumpToPage(page: totalPages - 1);
                                },
                              ),
                            ],
                          );
                        }, */
                          ),
                  ),
                )
              : Expanded(
                  child: _isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : PDFListViewer(
                          document: document!,
                          preload: true,
                        ),
                ),
        ],
      ),
    );
  }
}
