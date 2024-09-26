import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_male_fertility_quiz_range_model.dart';
import '../../../data/apis/api_models/get_menopause_assessment_question_model.dart';
import '../../../data/apis/api_models/get_prediabetes_assessment_question_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class MenopauseQuizAssesmentController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  String title = '';
  final point = 0.obs;
  String id = '';
  Map<String, String?> parameters = Get.parameters;
  Map<String, String> bodyParams = {};
  List selectedIndexes = [];
  List<GetMenopauseAssessmentQuestionData> getMenopauseAssessmentQuestionData =
      [];
  late PageController pageController;
  final currentPageIndex = 0.obs;
  final selectedValue = ''.obs;
  List<GetPrediabetesAssessmentQuestionDataOption> selectedValueList1 = [];
  final stringValue = ''.obs;

  List<GetMaleFertilityQuizRangeData> getMenopauseAssessmentRangeData = [];

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
    if (currentPageIndex.value <
        getMenopauseAssessmentQuestionData.length - 1) {
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
    await getMenopauseAssessmentQuestionApi();
    await getMenopauseAssessmentRangeApi();
  }

  Future<void> getMenopauseAssessmentQuestionApi() async {
    GetMenopauseAssessmentQuestionModel? getMenopauseAssessmentQuestionModel =
        await ApiMethods.getMenopauseAssessmentQuestion();
    if (getMenopauseAssessmentQuestionModel != null &&
        getMenopauseAssessmentQuestionModel.data != null &&
        getMenopauseAssessmentQuestionModel.data!.isNotEmpty) {
      getMenopauseAssessmentQuestionData =
          getMenopauseAssessmentQuestionModel.data!;
    }
  }

  Future<void> getMenopauseAssessmentRangeApi() async {
    GetMaleFertilityQuizRangeModel? getMenopauseAssessmentRangeModel =
        await ApiMethods.getMenopauseAssessmentRange();
    if (getMenopauseAssessmentRangeModel != null &&
        getMenopauseAssessmentRangeModel.data != null &&
        getMenopauseAssessmentRangeModel.data!.isNotEmpty) {
      getMenopauseAssessmentRangeData = getMenopauseAssessmentRangeModel.data!;
    }
  }

  donePage() {
    getMenopauseAssessmentQuestionData.forEach((element) {
      if (element.point != null && element.point!.isNotEmpty) {
        point.value = int.parse(element.point!) + point.value;
      }
    });
    /*if (point.value <
        double.parse(getMenopauseAssessmentRangeData[0].range ?? '5')) {
      stringValue.value = getMenopauseAssessmentRangeData[0].name ?? 'Low';
    } else {
      stringValue.value = getMenopauseAssessmentRangeData[1].name ?? 'High';
    }*/
    if (point.value <=
        double.parse(getMenopauseAssessmentRangeData[0].range ?? '')) {
      stringValue.value =
          getMenopauseAssessmentRangeData[0].name ?? 'No menopausal';
    } else if (point.value >=
            double.parse(getMenopauseAssessmentRangeData[1].range ?? '') ||
        point.value <=
            double.parse(getMenopauseAssessmentRangeData[1].rangeTo ?? '')) {
      stringValue.value =
          getMenopauseAssessmentRangeData[1].name ?? 'Menopausal';
    } else if (point.value >=
            double.parse(getMenopauseAssessmentRangeData[2].range ?? '') ||
        point.value <=
            double.parse(getMenopauseAssessmentRangeData[2].rangeTo ?? '')) {
      stringValue.value =
          getMenopauseAssessmentRangeData[2].name ?? '(copy)Menopausal';
    }
    submitQuiz();
  }

  void submitQuiz() {
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
            Text(stringValue.value,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20.px, color: Theme.of(context).primaryColor)),
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () async {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              Map<String,String> saveAssessmentBody = {
                'user_id': sharedPreferences.getString(ApiKeyConstants.userId) ?? '',
                'menopause': stringValue.value
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
      point.value = 0;
    });
  }
}
