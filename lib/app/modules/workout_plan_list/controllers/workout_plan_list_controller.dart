import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_workout_blog_by_workout_week_id_model.dart';

class WorkoutPlanListController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  GetWorkoutBlogByWorkoutWeekIdModel? getWorkoutBlogByWorkoutWeekIdModel;
  List<Result> result = [];
  Map<String, String?> parameters = Get.parameters;

  Map<String, dynamic> bodyParams = {};
  String workoutWeekId = '';
  String workoutId = '';

  @override
  Future<void> onInit() async {
    workoutWeekId = parameters[ApiKeyConstants.workoutWeekId] ?? '';
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
    Get.toNamed(Routes.PROGRESS_WORKOUT_DETAIL, arguments: result[index]);
  }

  Future<void> onInitWork() async {
    await getWorkoutBlogByWorkoutWeekIdApi();
  }

  Future<void> getWorkoutBlogByWorkoutWeekIdApi() async {
    bodyParams = {
      ApiKeyConstants.workoutWeekId: workoutWeekId.toString(),
      ApiKeyConstants.workoutId: workoutId.toString()
    };
    getWorkoutBlogByWorkoutWeekIdModel =
        await ApiMethods.getWorkoutBlogByWorkoutWeekId(bodyParams: bodyParams);
    if (getWorkoutBlogByWorkoutWeekIdModel != null &&
        getWorkoutBlogByWorkoutWeekIdModel!.result != null &&
        getWorkoutBlogByWorkoutWeekIdModel!.result!.isNotEmpty) {
      result = getWorkoutBlogByWorkoutWeekIdModel!.result!;
    }
  }
}
