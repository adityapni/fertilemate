import 'package:fertility_boost/app/data/apis/api_models/get_pcos_assessment_question_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_male_fertility_quiz_range_model.dart';
import '../../../data/apis/api_models/questions_model.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';
import '../../nav_bar/controllers/nav_bar_controller.dart';

class QuizAssesmentController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;
  String title = '';
  String id = '';
  Map<String, String?> parameters = Get.parameters;
  Map<String, String> bodyParams = {};
  QuestionsModel? questionsModel;
  List<Questions> questions = [];
  final checkBoxValue = false.obs;
  List<Options> options = [];
  List<Map<String, dynamic>> obj = [];
  List<Map<String, dynamic>> objectOfQuiz = [];
  List<Map<String, dynamic>> objectOfQuizCheckBox = [];
  List selectedIndexes = [];
  List<GetPcosAssessmentQuestionData> getPcosAssessmentQuestionData = [];
  // List<GetMaleFertilityQuizRangeData> getMaleFertilityQuizRangeData = [];
  late PageController pageController;
  final currentPageIndex = 0.obs;
  final selectedValue = ''.obs;

  List<Map<String, String>> answerList = [];

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
    // print(objectOfQuiz);
    // print(objectOfQuizCheckBox);
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

  void submitQuiz() {
    showCupertinoModalPopup<void>(
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
            Text(checkAnswerAnswer(),
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    fontSize: 20.px, color: Theme.of(context).primaryColor)),
          ],
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDestructiveAction: true,
            onPressed: () {
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
    );
  }

  String checkAnswerAnswer() {
    double obtainPoints = 0.0;
    for (int i = 0; i < answerList.length; i++) {
      if (answerList[i]['answer'] == getPcosAssessmentQuestionData[i].answer) {
        obtainPoints +=
            double.parse(getPcosAssessmentQuestionData[i].point ?? '1');
      }
    }
    return obtainPoints.toString();
    /*if (obtainPoints <
        double.parse(getMaleFertilityQuizRangeData[0].range ?? '5')) {
      return getMaleFertilityQuizRangeData[0].name ?? 'Low';
    } else {
      return getMaleFertilityQuizRangeData[1].name ?? 'High';
    }*/
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
    // await getPrediabetesAssessmentRangeApi();
  }

  Future<void> getPrediabetesAssessmentRangeApi() async {
    GetMaleFertilityQuizRangeModel? getMaleFertilityQuizRangeModel =
        await ApiMethods.getPrediabetesAssessmentRange();
    if (getMaleFertilityQuizRangeModel != null &&
        getMaleFertilityQuizRangeModel.data != null &&
        getMaleFertilityQuizRangeModel.data!.isNotEmpty) {
      // getMaleFertilityQuizRangeData = getMaleFertilityQuizRangeModel.data!;
    }
  }

  Future<void> getPcosAssessmentQuestionApi({int value = 0}) async {
    GetPcosAssessmentQuestionModel? getPcosAssessmentQuestionModel =
        await ApiMethods.getPcosAssessmentQuestion();
    if (getPcosAssessmentQuestionModel != null &&
        getPcosAssessmentQuestionModel.data != null &&
        getPcosAssessmentQuestionModel.data!.isNotEmpty) {
      getPcosAssessmentQuestionData = getPcosAssessmentQuestionModel.data!;
      generateAnswerList(getPcosAssessmentQuestionData);
    }
  }

  generateAnswerList(List<GetPcosAssessmentQuestionData> list) {
    for (int i = 0; i < list.length; i++) {
      answerList.add({
        "question_id": list[i].id.toString(),
        "answer": '',
        "point": list[i].point.toString()
      });
    }
  }

  changeAnswer(String? answer, int index) {
    answerList[index] = {
      "question_id": getPcosAssessmentQuestionData[index].id.toString(),
      "answer": answer ?? '',
      "point": getPcosAssessmentQuestionData[index].point.toString()
    };
    print('Answer:-$answer');
    increment();
  }
}
