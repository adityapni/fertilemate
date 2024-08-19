import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_workout_types_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_body_parts_model.dart';
import '../../../data/apis/api_models/get_workout_model.dart';

class ProgressWorkoutController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  GetWorkoutTypesModel? getWorkoutTypesModel;
  List<Data> data = [];

  GetBodyPartsModel? getBodyPartsModel;
  List<GetBodyPartsData> getBodyPartsData = [];
  GetWorkoutModel? getWorkoutModel;
  List<Result> result = [];

  final selectedTypeCard = 0.obs;
  final selectedPartCard = 0.obs;
  final workoutTypesId = ''.obs;
  final bodyPartsId = ''.obs;

  Map<String, String> queryParameters = {};

  @override
  Future<void> onInit() async {
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

  clickOnStartButton({required int index}) {
    Map<String, String> parameter = {
      // ApiKeyConstants.workoutId: data[index].wtId.toString()
      ApiKeyConstants.workoutId: result[index].id.toString()
    };
    Get.toNamed(Routes.WORKOUT_PLANS, parameters: parameter);
  }

  Future<void> onInitWork() async {
    await getWorkoutTypesApi();
  }

  Future<void> getWorkoutTypesApi() async {
    getWorkoutTypesModel = await ApiMethods.getWorkoutTypes();
    if (getWorkoutTypesModel != null &&
        getWorkoutTypesModel!.data != null &&
        getWorkoutTypesModel!.data!.isNotEmpty) {
      data = getWorkoutTypesModel!.data!;
      if (data.isNotEmpty) {
        workoutTypesId.value = data.first.wtId ?? '';
        await getBodyPartsApi();
      }
    }
  }

  Future<void> getBodyPartsApi() async {
    queryParameters.clear();
    getBodyPartsData.clear();
    result.clear();
    queryParameters = {
      ApiKeyConstants.workoutTypesId: workoutTypesId.value.toString()
    };
    getBodyPartsModel =
        await ApiMethods.getBodyPartsApi(queryParameters: queryParameters);
    if (getBodyPartsModel != null && getBodyPartsModel!.data!.isNotEmpty) {
      getBodyPartsData = getBodyPartsModel!.data!;
      if (getBodyPartsData.isNotEmpty) {
        bodyPartsId.value = getBodyPartsData.first.bpId ?? '';
        await getWorkoutApi();
      }
    }
  }

  Future<void> getWorkoutApi() async {
    queryParameters.clear();
    result.clear();
    queryParameters = {
      ApiKeyConstants.workoutTypesId: workoutTypesId.value,
      ApiKeyConstants.bodyPartsId: bodyPartsId.value,
    };
    getWorkoutModel =
        await ApiMethods.getWorkout(queryParameters: queryParameters);
    if (getWorkoutModel != null &&
        getWorkoutModel!.result != null &&
        getWorkoutModel!.result!.isNotEmpty) {
      result = getWorkoutModel!.result!;
    }
  }

  clickOnTypeCard({required int index}) async {
    selectedTypeCard.value = index;
    selectedPartCard.value = 0;
    workoutTypesId.value = data[index].wtId ?? '';
    inAsyncCall.value = true;
    await getBodyPartsApi();
    inAsyncCall.value = false;
    increment();
  }

  clickOnPartCard({required int index}) async {
    selectedPartCard.value = index;
    bodyPartsId.value = getBodyPartsData[index].bpId ?? '';
    inAsyncCall.value = true;
    await getWorkoutApi();
    inAsyncCall.value = false;
    increment();
  }
}
