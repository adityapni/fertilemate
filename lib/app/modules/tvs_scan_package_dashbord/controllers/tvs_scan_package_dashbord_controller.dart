import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/apis/api_models/TvsClinicList.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TvsScanPackageDashbordController extends GetxController {

  final count = 0.obs;

  final inAsyncCall = false.obs;
  TvsClinicList? tvsClinicList;
  List<Doctor> doctorList=[];
  getAvailableServices()async{
    tvsClinicList= await ApiMethods.GetScanClinicList();
    doctorList= tvsClinicList!.doctor!;
  }
  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value=true;
    await getAvailableServices();
    inAsyncCall.value=false;

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

  clickOnCard({required String id ,required String title}) {
    Get.toNamed(Routes.TVS_SCAN_PACKAGE_DETAIL,parameters: {ApiKeyConstants
        .clinicId:id,ApiKeyConstants.title:title});
  }

  clickOnAppointment() {
    Get.toNamed(Routes.TVS_SCAN_PACKAGE,parameters: {ApiKeyConstants.bookingType:"sperm_test"});
  }

  clickOnUpgrade() {}
}
