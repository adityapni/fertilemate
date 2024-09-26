import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_pcos_assessment_question_model.dart';
import '../../../data/apis/api_models/quiz_result_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class PcosQuizAssessmentController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  String title = '';
  final pointLocal = 0.0.obs;
  final pointLocal1 = 0.0.obs;
  final pointLocal2 = 0.0.obs;
  final pointLocal3 = 0.0.obs;
  String id = '';
  Map<String, String?> parameters = Get.parameters;
  Map<String, String> bodyParams = {};
  List selectedIndexes = [];
  late PageController pageController;
  final currentPageIndex = 0.obs;
  final selectedValue = ''.obs;
  final stringValue = ''.obs;

  List<GetPcosAssessmentQuestionData> getPcosAssessmentQuestionData = [];
  GetPcosAssessmentQuestionModel? getPcosAssessmentQuestionModel;

  @override
  Future<void> onInit() async {
    id = parameters[ApiKeyConstants.id] ?? '';
    title = parameters[StringConstants.title] ?? '';
    pageController = PageController(initialPage: currentPageIndex.value);
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
    pageController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  clickOnSubmitButton() {
    Get.back();
  }

  void nextPage() {
    if (currentPageIndex.value < getPcosAssessmentQuestionData.length - 1) {
      currentPageIndex.value++;
      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  void previousPage() {
    if (currentPageIndex.value > 0) {
      currentPageIndex.value--;
      pageController.animateToPage(
        currentPageIndex.value,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  Future<void> onInitWork() async {
    await getPcosAssessmentQuestionApi();
  }

  Future<void> getPcosAssessmentQuestionApi({int value = 0}) async {
    getPcosAssessmentQuestionModel =
        await ApiMethods.getPcosAssessmentQuestion();
    if (getPcosAssessmentQuestionModel != null &&
        getPcosAssessmentQuestionModel?.data != null &&
        getPcosAssessmentQuestionModel!.data!.isNotEmpty) {
      getPcosAssessmentQuestionData = getPcosAssessmentQuestionModel!.data!;
    }
  }

  donePage() async {
    List<Map<String, dynamic>> val = [];
    getPcosAssessmentQuestionData.forEach((element) {
      val.add({
        '"question_id"': jsonEncode(element.id ?? ''),
        '"answer"': jsonEncode(element.answerLocal ?? 'false')
      });
    });
    QuizResultModel? quizResultModel = await ApiMethods.quizResult(bodyParams: {
      'result': {'"result"': val.toString()}.toString()
    });
    if (quizResultModel != null) {
      submitQuiz(
        one: quizResultModel.one ?? 0,
        two: quizResultModel.two ?? 0,
        three: quizResultModel.three ?? 0,
        four: quizResultModel.four ?? 0,
      );
    }
  }

  void submitQuiz({
    required int one,
    required int two,
    required int three,
    required int four,
  }) {
    showCupertinoModalPopup<void>(
      barrierDismissible: false,
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(
          'Your Quiz Result',
          style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontSize: 18.px, color: Theme.of(context).primaryColor),
        ),
        content: Column(
          children: [
            Text(
              'This result are showing base on your answer.',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 20.px,
            ),
            Text("Resistance Rintangan Insulin ${one} / 10.0",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor)),
            SizedBox(height: 8.px),
            Text("PCOS Adrenal ${two} / 11.0",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor)),
            SizedBox(height: 8.px),
            Text("Hormonal Birth  Pil Perancang ${three} / 1.0",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor)),
            SizedBox(height: 8.px),
            Text("Adrenal Type ${four} / 11.0",
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor)),
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              Map<String,String> saveAssessmentBody = {
                'user_id': sharedPreferences.getString(ApiKeyConstants.userId) ?? '',
                'insulin_resistance': 'Resistance Rintangan Insulin ${one} / 10.0',
                'inflammation' : 'PCOS Adrenal ${two} / 11.0',
                'post_hbc': 'Hormonal Birth  Pil Perancang ${three} / 1.0',
                'adrenal': 'Adrenal Type ${four} / 11.0'
              };
              await ApiMethods.saveHealthAssessment(bodyParams: saveAssessmentBody);
              Get.back();
              selectedIndex.value = 0;
              Get.offNamed(Routes.NAV_BAR);
            },
            child: Text('Go to home',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 14.px, color: Theme.of(context).primaryColor)),
          ),
        ],
      ),
    ).whenComplete(() {
      pointLocal.value = 0;
    });
  }
}
