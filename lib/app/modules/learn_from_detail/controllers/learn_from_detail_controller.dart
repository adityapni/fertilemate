import 'package:fertility_boost/app/data/apis/api_models/get_supportive_community_details_model.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';

class LearnFromDetailController extends GetxController {
  final count = 0.obs;
  Map<String, String?> parameters = Get.parameters;
  String id = '';

  final inAsyncCall = false.obs;

  GetSupportiveCommunityDetailsModel? getSupportiveCommunityDetailsModel;
  List<Result> result = [];

  @override
  Future<void> onInit() async {
    id = parameters[ApiKeyConstants.id] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await onInitWorking();
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

  onInitWorking() async {
    await getSupportiveCommunityDetailsApi();
  }

  Future<void> getSupportiveCommunityDetailsApi() async {
    Map<String, dynamic> bodyParams = {ApiKeyConstants.communityId: id};
    getSupportiveCommunityDetailsModel =
        await ApiMethods.getSupportiveCommunityDetails(bodyParams: bodyParams);
    if (getSupportiveCommunityDetailsModel != null &&
        getSupportiveCommunityDetailsModel!.result != null &&
        getSupportiveCommunityDetailsModel!.result!.isNotEmpty) {
      result = getSupportiveCommunityDetailsModel!.result!;
    }
  }
}
