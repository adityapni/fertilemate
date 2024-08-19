import 'package:fertility_boost/app/data/apis/api_models/get_romantic_spot_category_model.dart';
import 'package:get/get.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/blog_by_category.dart';
import '../../../data/apis/api_models/get_intimacy_game_category_model.dart';
import '../../../data/apis/api_models/intimacy_game_get_intimacy_game_model.dart';
import '../../../data/constants/icons_constant.dart';

class IntimacyGamesController extends GetxController {
  final count = 0.obs;

/*  List listOfCards = [
    {'title': 'Pregnancy', 'icon': IconConstants.icPregnancy},
    {'title': "Men's Health", 'icon': IconConstants.icMensHealth},
    {'title': 'Infertility', 'icon': IconConstants.icInfertility},
    {'title': 'Technology', 'icon': IconConstants.icTechnology},
  ];

  List listOfListTile = [
    {
      'title': 'Fertility Predictions',
      'subtitle': '3 min read',
    },
    {
      'title': 'New Webinars to Watch',
      'subtitle': '5 min watch',
    },
    {
      'title': 'Meet the Fertility Experts',
      'subtitle': '3 min read',
    },
    {
      'title': 'Technology',
      'subtitle': 'Pregnancy',
    },
  ];*/
  final inAsyncCall = false.obs;
  GetIntimacyGameCategoryModel? getIntimacyGameCategoryModel;
  BlogByCategoryModel? blogfeaturedList;
  BlogByCategoryModel? blogSavedList;

  List<Result> result = [];
  List<GameModelResult> gameModelResult = [];

  GetRomanticSpotCategoryModel? getRomanticSpotCategoryModel;

  List<ResultData> resultData = [];

  IntimacyGameGetIntimacyGameModel? intimacyGameGetIntimacyGameModel;

  getIntimacyGameCategoryApi() async {
    getIntimacyGameCategoryModel = await ApiMethods.getIntimacyGameCategory();
    if (getIntimacyGameCategoryModel != null &&
        getIntimacyGameCategoryModel!.result != null &&
        getIntimacyGameCategoryModel!.result!.isNotEmpty) {
      result = getIntimacyGameCategoryModel!.result!;
    }
    increment();
  }

  intimacyGameGetIntimacyGameApi() async {
    intimacyGameGetIntimacyGameModel = await ApiMethods.intimacyGameGetIntimacyGame();
    if (intimacyGameGetIntimacyGameModel != null &&
        intimacyGameGetIntimacyGameModel!.result != null &&
        intimacyGameGetIntimacyGameModel!.result!.isNotEmpty) {
      gameModelResult = intimacyGameGetIntimacyGameModel!.result!;
    }
    increment();
  }

  romanticSpotCategoryGetRomanticSpotCategoryApi() async {
    getRomanticSpotCategoryModel = await ApiMethods.romanticSpotCategoryGetRomanticSpotCategory();
    if (getRomanticSpotCategoryModel != null &&
        getRomanticSpotCategoryModel!.resultData != null &&
        getRomanticSpotCategoryModel!.resultData!.isNotEmpty) {
      resultData = getRomanticSpotCategoryModel!.resultData!;
    }
    increment();
  }

  String title = '';

  @override
  Future<void> onInit() async {
    super.onInit();
    inAsyncCall.value = true;
    await intimacyGameGetIntimacyGameApi();
    await getIntimacyGameCategoryApi();
    // await romanticSpotCategoryGetRomanticSpotCategoryApi();
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

  clickOnBuyNowButton() {}

  clickOnCard({required CatId, required title}) {}
}
