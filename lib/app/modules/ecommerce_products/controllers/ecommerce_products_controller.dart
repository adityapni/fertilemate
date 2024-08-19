import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/products_by_category_id_model.dart';
import 'package:http/http.dart' as http;

class EcommerceProductsController extends GetxController {
  final count = 0.obs;

  TextEditingController searchController = TextEditingController();
  final inAsyncCall = false.obs;
  final isLike = false.obs;

  ProductsByCategoryIdModel? productsByCategoryIdModel;
  List<Category> category = [];
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  Map<String, dynamic> bodyParamsForAddCarts = {};

  String categoryId = '';
  String categoryName = '';
  String userId = '';

  List<Category> searchResult = [];

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    categoryId = parameters[ApiKeyConstants.categoryId].toString();
    categoryName = parameters[ApiKeyConstants.categoryName].toString();
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

  clickOnCard({required String productId}) {
    Map<String, String> parameter = {
      ApiKeyConstants.productId: productId.toString()
    };
    Get.toNamed(Routes.ECOMMERCE_DETAIL, parameters: parameter);
  }

  clickOnFavoriteIcon() {
    isLike.value = !isLike.value;
  }

  clickOnAddIcon({required int index}) async {
    inAsyncCall.value = true;
    bodyParamsForAddCarts = {
      ApiKeyConstants.cartQuantity: '1',
      ApiKeyConstants.userId: userId.toString(),
      ApiKeyConstants.productId: category[index].productId.toString(),
    };
    http.Response? response =
        await ApiMethods.addCarts(bodyParams: bodyParamsForAddCarts);
    if (response != null && response.statusCode == 200) {}
    inAsyncCall.value = false;
  }

  clickOFavoriteIcon() {}

  Future<void> onInitWork() async {
    await categoriesByMainCategoryIdApi();
  }

  Future<void> categoriesByMainCategoryIdApi() async {
    bodyParams = {ApiKeyConstants.categoryId: categoryId.toString()};
    productsByCategoryIdModel =
        await ApiMethods.productsByCategoryId(bodyParams: bodyParams);
    if (productsByCategoryIdModel != null &&
        productsByCategoryIdModel!.category!.isNotEmpty) {
      category = productsByCategoryIdModel!.category!;
    }
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    category.forEach((cat) {
      if (cat.productName!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(cat);
      }
    });
    increment();
  }
}
