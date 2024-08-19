import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/data/apis/api_models/available_clinics_get_clinic_detail_by_id_model.dart';
import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TvsScanPackageDetailController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  AvailableClinicsGetClinicDetailByIdModel?
      availableClinicsGetClinicDetailByIdModel;
  Data? data;
  String clinicId = '';
  String title = '';

  List listOfCards = [
    {'title': StringConstants.info, 'icon': IconConstants.icInfo},
    {'title': StringConstants.photos, 'icon': IconConstants.icPhotos},
    {'title': StringConstants.reviews, 'icon': IconConstants.icReviews},
  ];

  Map<String, String> parameters = {};

  @override
  Future<void> onInit() async {
    clinicId = Get.parameters[ApiKeyConstants.clinicId] ?? '';
    title = Get.parameters[ApiKeyConstants.title] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getClinicDetail();
    inAsyncCall.value = false;
  }

  getClinicDetail() async {
    availableClinicsGetClinicDetailByIdModel =
        await ApiMethods.getTvsClinicDetail(bodyParams: {
      ApiKeyConstants.clinicId: Get.parameters[ApiKeyConstants.clinicId]
    });
    if (availableClinicsGetClinicDetailByIdModel != null &&
        availableClinicsGetClinicDetailByIdModel!.data != null) {
      data = availableClinicsGetClinicDetailByIdModel!.data!;
    }
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

  clickOnMakeReservation() {
    parameters = {
      ApiKeyConstants.bookingType: ApiKeyConstants.tvsScan,
      ApiKeyConstants.clinicId: clinicId,
      ApiKeyConstants.title: title,
      ApiKeyConstants.subTitle: StringConstants.packagePremium,
      ApiKeyConstants.description: data?.clinicAddress ?? '',
      ApiKeyConstants.consultantfee: data?.consultanFees ?? '',
    };
    Get.toNamed(Routes.BOOKING_BY_CALENDAR, parameters: parameters);
  }

  clickOnBackIcon() {
    Get.back();
  }
}
