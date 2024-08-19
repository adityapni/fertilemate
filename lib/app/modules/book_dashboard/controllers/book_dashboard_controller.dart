import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_zen_book_location_category_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/sleep_management_zen_book_get_zen_book_nearest_providers_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/sleep_management_zen_book_get_zen_book_packages_model.dart';
import '../../../data/constants/icons_constant.dart';

class BookDashboardController extends GetxController {
  final count = 0.obs;

  List listOfCards = [
    {'title': 'Zumba', 'icon': IconConstants.icZumba},
    {'title': 'Pilates', 'icon': IconConstants.icPilates},
    {'title': 'Spa', 'icon': IconConstants.icSpa},
    {'title': 'Special', 'icon': IconConstants.icSpecial},
  ];

  TextEditingController searchController = TextEditingController();
  SleepManagementZenBookGetZenBookPackagesModel?
      sleepManagementZenBookGetZenBookPackagesModel;
  List<Result> result = [];
  final inAsyncCall = false.obs;

  SleepManagementZenBookGetZenBookNearestProvidersModel?
      sleepManagementZenBookGetZenBookNearestProvidersModel;

  List<ResultData> resultDate = [];

  Map<String, dynamic> bodyParams = {};
  Map<String, dynamic> parameters = Get.parameters;
  SharedPreferences? prefs;

  String userId = "";
  String id = "";
  String lat = "";
  String long = "";

  Location location = Location();
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

  String distance = '';

  ZenBookLocationCategoryGetZenBookLocationCategoryModel?
      zenBookLocationCategoryGetZenBookLocationCategoryModel;
  List<ResultZenBookLocationCategory> resultZenBookLocationCategory = [];

  List<ResultData> searchResult = [];


  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    id = parameters[ApiKeyConstants.id] ?? '';
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

  clickOnCard({required int index}) {
    // Get.toNamed(Routes.BOOK_FAVORITES);
  }

  clickOnNearbyClassesAndSpas({required int index}) {
    Map<String, String> parameter = {
      ApiKeyConstants.smzbpProvidersId:
          resultDate[index].smzbpProvidersId.toString(),
    };
    Get.toNamed(Routes.BOOK_LIST_OVERVIEW, parameters: parameter);
  }

  Future<void> onInitWork() async {
    await checkLocationPermission();
    // await sleepManagementZenBookGetZenBookPackagesApi();
    await zenBookLocationCategoryGetZenBookLocationCategoryApi();
    await sleepManagementZenBookGetZenBookNearestProvidersApi();
  }

  Future<void> sleepManagementZenBookGetZenBookPackagesApi() async {
    sleepManagementZenBookGetZenBookPackagesModel =
        await ApiMethods.sleepManagementZenBookGetZenBookPackages();
    if (sleepManagementZenBookGetZenBookPackagesModel != null &&
        sleepManagementZenBookGetZenBookPackagesModel!.result != null &&
        sleepManagementZenBookGetZenBookPackagesModel!.result!.isNotEmpty) {
      result = sleepManagementZenBookGetZenBookPackagesModel!.result!;
    }
  }

  Future<void> zenBookLocationCategoryGetZenBookLocationCategoryApi() async {
    zenBookLocationCategoryGetZenBookLocationCategoryModel =
        await ApiMethods.zenBookLocationCategoryGetZenBookLocationCategory();
    if (zenBookLocationCategoryGetZenBookLocationCategoryModel != null &&
        zenBookLocationCategoryGetZenBookLocationCategoryModel!
                .resultZenBookLocationCategory !=
            null &&
        zenBookLocationCategoryGetZenBookLocationCategoryModel!
            .resultZenBookLocationCategory!.isNotEmpty) {
      resultZenBookLocationCategory =
          zenBookLocationCategoryGetZenBookLocationCategoryModel!
              .resultZenBookLocationCategory!;
    }
  }

  Future<void> sleepManagementZenBookGetZenBookNearestProvidersApi() async {
    bodyParams = {
      ApiKeyConstants.userId:
          prefs?.getString(ApiKeyConstants.userId).toString(),
      ApiKeyConstants.lat: lat.toString(),
      ApiKeyConstants.long: long.toString(),
      ApiKeyConstants.distance: distance,
      ApiKeyConstants.zenBookPackagesId: id.toString(),
    };
    sleepManagementZenBookGetZenBookNearestProvidersModel =
        await ApiMethods.sleepManagementZenBookGetZenBookNearestProviders(
            bodyParams: bodyParams);
    if (sleepManagementZenBookGetZenBookNearestProvidersModel != null &&
        sleepManagementZenBookGetZenBookNearestProvidersModel!.resultDate !=
            null &&
        sleepManagementZenBookGetZenBookNearestProvidersModel!
            .resultDate!.isNotEmpty) {
      resultDate =
          sleepManagementZenBookGetZenBookNearestProvidersModel!.resultDate!;
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

  searchMethod({required String value}) {
    searchResult.clear();
    if (searchController.text.isEmpty) {
      increment();
      return;
    }
    resultDate.forEach((res) {
      if (res.smzbpProvidersName!
          .toUpperCase()
          .contains(searchController.text.toUpperCase())) {
        searchResult.add(res);
      }
    });
    increment();
  }
}
