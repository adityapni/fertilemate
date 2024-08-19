import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SpermTestPackageHospitalSerdangController extends GetxController {
  final count = 0.obs;

  DateTime selectTime = DateTime.now();

  final selectedTab = 0.obs;

  List listOfTime = [
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
  ];

  @override
  void onInit() {
    super.onInit();
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

  clickOnConfirmBookingButton() {}

  clickOnBookNowButton() {
    Get.toNamed(Routes.SPERM_TEST_PACKAGE_PAYMENT);
  }

  clickOnCard({required int index}) {}
}
