import 'package:get/get.dart';

class BookFavoritesController extends GetxController {

  final count = 0.obs;

  final selectedTab = 0.obs;

  List listOfTabs = ['All', 'Legs', 'Arms', 'Abs', 'Flex'];
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

  clickOnCard({required int index}) {}
}
