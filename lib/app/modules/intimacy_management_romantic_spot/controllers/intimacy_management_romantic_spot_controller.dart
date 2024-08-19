import 'package:fertility_boost/app/data/apis/api_models/romantic_pot_get_romantic_spot_model.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/get_romantic_spot_category_model.dart';
import '../../../routes/app_pages.dart';

class IntimacyManagementRomanticSpotController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  TextEditingController searchController = TextEditingController();

  RomanticSpotGetRomanticSpotModel? romanticSpotGetRomanticSpotModel;

  List<RomanticSpotGetRomanticSpotResult> result = [];
  List<RomanticSpotGetRomanticSpotResult> searchResult = [];

  GetRomanticSpotCategoryModel? getRomanticSpotCategoryModel;

  List<ResultData> resultData = [];
  Map<String, dynamic> params = {};
  Map<String, dynamic> queryParameters = {};

  Location location = Location();
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  String userId = "";
  String lat = "";
  String long = "";

  Future<void> loveLanguageGetLoveLanguageApi() async {
    queryParameters = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.lat: lat,
      ApiKeyConstants.long: long,
      // ApiKeyConstants.distance: '100',
    };
    romanticSpotGetRomanticSpotModel =
        await ApiMethods.romanticSpotGetRomanticSpot(
            queryParameters: queryParameters);
    if (romanticSpotGetRomanticSpotModel != null &&
        romanticSpotGetRomanticSpotModel!.result!.isNotEmpty) {
      result = romanticSpotGetRomanticSpotModel!.result!;
    }
  }

  Future<void> checkLocationPermission() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled!) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled!) {
        // Handle the case where the user denied access to location services
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // Handle the case where the user denied the location permission
        return;
      }
    }

    await getLocation();
  }

  Future<void> getLocation() async {
    try {
      locationData = await location.getLocation();
      lat = locationData?.latitude.toString() ?? '';
      long = locationData?.longitude.toString() ?? '';
      print("Latitude: ${locationData?.latitude}");
      print("Longitude: ${locationData?.longitude}");
    } catch (e) {
      // Handle exceptions and errors here
      print("Error getting location: $e");
    }
  }

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await checkLocationPermission();
    await loveLanguageGetLoveLanguageApi();
    await romanticSpotCategoryGetRomanticSpotCategoryApi();
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

  clickOnCard({required int index}) {
    CommonWidgets.snackBarView(title: 'Data Not found');
  }

  romanticSpotCategoryGetRomanticSpotCategoryApi() async {
    getRomanticSpotCategoryModel =
        await ApiMethods.romanticSpotCategoryGetRomanticSpotCategory();
    if (getRomanticSpotCategoryModel != null &&
        getRomanticSpotCategoryModel!.resultData != null &&
        getRomanticSpotCategoryModel!.resultData!.isNotEmpty) {
      resultData = getRomanticSpotCategoryModel!.resultData!;
    }
    increment();
  }

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    result.forEach((res) {
      if (res.name!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }

  clickOnCardNearBy({required RomanticSpotGetRomanticSpotResult result}) {
    Get.toNamed(Routes.INTIMACY_MANAGEMENT_ROMANTIC_SPOT_DETAIL,
        arguments: result);
  }
}
