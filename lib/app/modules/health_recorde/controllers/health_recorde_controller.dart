import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_healthR_record_model.dart';

class HealthRecordeController extends GetxController {
  final count = 0.obs;
  Map<String, String> parameter = {};
  final selectedTab = 0.obs;
  final inAsyncCall = false.obs;
  Map<String, dynamic> bodyParams = {};
  String userId = '';
  GetHealthRecordModel? getHealthRecordModel;
  RxList<Data> bloodData = <Data>[].obs;
  RxList<Data> documentData = <Data>[].obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId)!;
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

  clickOnListTile({required int index}) async {
    /*
    parameter = {
      ApiKeyConstants.document: documentData[index].document.toString()
    };
    Get.toNamed(Routes.BLOOD_REPORT, parameters: parameter);*/
    if (selectedTab.value == 0) {
      if (!await launchUrl(Uri.parse(bloodData[index].document.toString()))) {
        throw Exception(
            'Could not launch ${bloodData[index].document.toString()}');
      }
    } else {
      if (!await launchUrl(
          Uri.parse(documentData[index].document.toString()))) {
        throw Exception(
            'Could not launch ${documentData[index].document.toString()}');
      }
    }
  }

  clickOnTabs({required int value}) async {
    getHealthRecordModel = null;
    documentData.clear();
    bloodData.clear();
    selectedTab.value = value;
    inAsyncCall.value = true;
    await subCategoriesByCategoryIdApi(value: selectedTab.value);
    inAsyncCall.value = false;
  }

  Future<void> onInitWork() async {
    await subCategoriesByCategoryIdApi();
  }

  Future<void> subCategoriesByCategoryIdApi({int value = 0}) async {
    bodyParams = {
      ApiKeyConstants.type:
          value == 0 ? ApiKeyConstants.blood : ApiKeyConstants.document,
      ApiKeyConstants.userId: userId,
    };
    getHealthRecordModel =
        await ApiMethods.getHealthRecord(bodyParams: bodyParams);
    if (getHealthRecordModel != null &&
        getHealthRecordModel!.data!.isNotEmpty) {
      value == 0
          ? (bloodData.value = getHealthRecordModel!.data!)
          : (documentData.value = getHealthRecordModel!.data!);
    }
  }
}
