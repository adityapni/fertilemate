import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/sleep_management_favorites_sleep_management_sound_track_add_favourites_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/sleep_management_get_sleep_management_categories_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../routes/app_pages.dart';

class SleepManagementFavoriteSleepSoundTracksController extends GetxController {
  final count = 0.obs;

  List selectedList = [];
  List selectedListOfIds = [];
  final inAsyncCall = false.obs;

  SleepManagementGetSleepManagementCategoriesModel?
      sleepManagementGetSleepManagementCategoriesModel;
  List<Result> result = [];

  SleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel?
      sleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel;
  String userId = '';

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

  clickOnContinue() {
    if (selectedList.isNotEmpty) {
      selectedListOfIds.clear();
      selectedList.forEach((element) {
        selectedListOfIds.add(element.smcId);
      });
      sleepManagementFavoritesSleepManagementSoundTrackAddFavouritesApi();
    } else {
      selectedListOfIds.clear();
    }
  }

  clickOnCard({required int index}) {
    if (selectedList.contains(result[index])) {
      selectedList.remove(result[index]);
    } else {
      selectedList.add(result[index]);
    }
    increment();
  }

  Future<void> onInitWork() async {
    await sleepManagementGetSleepManagementCategoriesApi();
  }

  Future<void> sleepManagementGetSleepManagementCategoriesApi() async {
    sleepManagementGetSleepManagementCategoriesModel =
        await ApiMethods.sleepManagementGetSleepManagementCategories();
    if (sleepManagementGetSleepManagementCategoriesModel != null &&
        sleepManagementGetSleepManagementCategoriesModel!.result != null &&
        sleepManagementGetSleepManagementCategoriesModel!.result!.isNotEmpty) {
      result = sleepManagementGetSleepManagementCategoriesModel!.result!;
    }
  }

  Future<void>
      sleepManagementFavoritesSleepManagementSoundTrackAddFavouritesApi() async {
    inAsyncCall.value = true;
    Map<String, dynamic> queryParameters = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.sleepManagementCategoriesId: selectedListOfIds.toString(),
    };
    sleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel =
        await ApiMethods
            .sleepManagementFavoritesSleepManagementSoundTrackAddFavourites(
                queryParameters: queryParameters);
    if (sleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel !=
            null /*&&
        sleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel!
                .result !=
            null &&
        sleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel!
            .result!.isNotEmpty*/) {
      Get.toNamed(Routes.SLEEP_MANAGEMENT_DASHBOARD);
      /* result =
      sleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel!
          .result!;*/

    }
    inAsyncCall.value = false;
  }
}
