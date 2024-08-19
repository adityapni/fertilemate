import 'package:fertility_boost/app/data/apis/api_models/fertility_educations_get_fertility_test_kit_model.dart';
import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class FertilityHomeTestKitController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  final selectedCard = 0.obs;

  Map<String, String> bodyParams = {};
  Map<String, String?> parameters = Get.parameters;

  String catSpermId = '';

  FertilityEducationsGetFertilityTestKitModel?
      fertilityEducationsGetFertilityTestKitModel;

  List<Data> data = [];

  @override
  Future<void> onInit() async {
    catSpermId = parameters[ApiKeyConstants.categoryId] ?? '';
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
    selectedCard.value = index;
    Map<String, String> parameter = {
      StringConstants.title: data[index].name.toString(),
      ApiKeyConstants.fertilityKitId: data[index].id.toString(),
    };
    Get.toNamed(Routes.TEST_KIT_UPLOAD, parameters: parameter);
  }

  Future<void> onInitWork() async {
    await fertilityEducationsGetFertilityTestKitApi();
  }

  Future<void> fertilityEducationsGetFertilityTestKitApi() async {
    bodyParams = {ApiKeyConstants.catSpermId: catSpermId.toString()};
    fertilityEducationsGetFertilityTestKitModel =
        await ApiMethods.fertilityEducationsGetFertilityTestKit(
      queryParameters: bodyParams,
    );
    if (fertilityEducationsGetFertilityTestKitModel != null &&
        fertilityEducationsGetFertilityTestKitModel!.data!.isNotEmpty) {
      data = fertilityEducationsGetFertilityTestKitModel!.data!;
    }
  }
}
