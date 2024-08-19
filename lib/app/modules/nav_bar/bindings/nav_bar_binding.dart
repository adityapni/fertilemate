import 'package:fertility_boost/app/modules/Profile/controllers/profile_controller.dart';
import 'package:fertility_boost/app/modules/cart/controllers/cart_controller.dart';
import 'package:fertility_boost/app/modules/home/controllers/home_controller.dart';
import 'package:fertility_boost/app/modules/search/controllers/search_controller.dart';
import 'package:get/get.dart';
import '../controllers/nav_bar_controller.dart';

class NavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavBarController>(
      () => NavBarController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SearchController>(
      () => SearchController(),
    );
    Get.lazyPut<CartController>(
      () => CartController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
