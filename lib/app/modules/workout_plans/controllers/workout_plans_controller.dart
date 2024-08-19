import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_workout_week_model.dart';

class WorkoutPlansController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  GetWorkoutWeekModel? getWorkoutWeekModel;
  List<Result> result = [];
  Map<String, String?> parameters = Get.parameters;
  String workoutId = '';

  @override
  Future<void> onInit() async {
    workoutId = parameters[ApiKeyConstants.workoutId] ?? '';
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

  clickOnCard({required int index}) {
    Map<String, String> parameter = {
      ApiKeyConstants.workoutWeekId: result[index].id.toString(),
      ApiKeyConstants.workoutId: workoutId.toString(),
    };
    Get.toNamed(Routes.WORKOUT_PLAN_LIST, parameters: parameter);
  }

  Future<void> onInitWork() async {
    await getWorkoutApi();
  }

  Future<void> getWorkoutApi() async {
    Map<String, String> queryParameters = {
      ApiKeyConstants.workoutId: workoutId.toString()
    };
    getWorkoutWeekModel =
        await ApiMethods.getWorkoutWeek(queryParameters: queryParameters);
    if (getWorkoutWeekModel != null &&
        getWorkoutWeekModel!.result != null &&
        getWorkoutWeekModel!.result!.isNotEmpty) {
      result = getWorkoutWeekModel!.result!;
    }
  }
}
