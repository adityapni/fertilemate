import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_google_maps_webservices/places.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter_api/google_places_flutter_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/apis/api_models/personal_trainer_list.dart';
import '../../../data/constants/string_constants.dart';

class PersonalTrainerBookController extends GetxController {
  final count = 0.obs;
  PersonalTrainerGetPersonalTrainerModel?
      personalTrainerGetPersonalTrainerModel;
  final inAsyncCall = false.obs;
  List<PersonalTrainerData> personalTrainerData = [];

  Map<String, String?> parameters = Get.parameters;
  Map<String, String> parameter = {};

  Map<String, String> queryParameters = {};

  TextEditingController allLocationsController = TextEditingController();

  String lat = '';

  String long = '';

  getPersonalTrainerList() async {
    queryParameters = {
      ApiKeyConstants.personalTrainerCategoryId:
          personalTrainerCategoryId.value,
      ApiKeyConstants.lat: lat,
      ApiKeyConstants.long: long,
    };
    personalTrainerGetPersonalTrainerModel =
        await ApiMethods.getPersonalTrainerList(
            queryParameters: queryParameters);
    personalTrainerData.clear();
    if (personalTrainerGetPersonalTrainerModel != null &&
        personalTrainerGetPersonalTrainerModel!.personalTrainerData != null &&
        personalTrainerGetPersonalTrainerModel!
            .personalTrainerData!.isNotEmpty) {
      personalTrainerData =
          personalTrainerGetPersonalTrainerModel!.personalTrainerData!;
    }
    increment();
  }

  SharedPreferences? sharedPreferences;

  final expertConsultation = ''.obs;
  final personalTrainerCategoryId = ''.obs;

  @override
  Future<void> onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    expertConsultation.value =
        sharedPreferences?.getString(StringConstants.expertConsultation) ?? '';
    personalTrainerCategoryId.value =
        parameters[ApiKeyConstants.personalTrainerCategoryId] ?? '';
    super.onInit();
    inAsyncCall.value = true;
    await getPersonalTrainerList();
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

  clickOnCard({required int index}) {}

  clickOnBookButton({required int index}) {
    parameter = {
      ApiKeyConstants.personalTrainerId:
          personalTrainerData[index].id.toString()
    };
    Get.toNamed(Routes.PERSONAL_TRAINER_DASHBOARD, parameters: parameter);
  }

  clickOnAllLocationsTextField() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: Get.context!,
      apiKey: "AIzaSyAUNuNPORcPgdycUwzGTEXU-PCyt2hVKtA",
      mode: Mode.overlay,
    );
    if (p != null) {
      allLocationsController.text = p.description ?? '';
      final locations = await locationFromAddress(p.description ?? '');
      lat = locations.first.latitude.toString();
      long = locations.first.longitude.toString();
      inAsyncCall.value = true;
      await getPersonalTrainerList();
      inAsyncCall.value = false;
    }
  }
}
