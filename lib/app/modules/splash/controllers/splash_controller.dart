import 'dart:async';

import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_models/doctors_get_profile_model.dart';
import 'package:get/get.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../app_controller/ac.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/constants/string_constants.dart';
import '../../../routes/app_pages.dart';

final stepCount = 0.obs;

class SplashController extends AC {
  final count = 0.obs;
  SharedPreferences? prefs;
  Map<String, String> bodyParams = {};
  DoctorsGetProfileModel? doctorsGetProfileModel;
  String verifyStatus = '';

  bool isCounting = false;

  late Timer timer;

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    // Get the current time
    DateTime now = DateTime.now();
    // Calculate the duration until midnight
    Duration durationUntilMidnight = calculateDurationUntilMidnight(now);
    // Schedule the function to be called at midnight
    timer = Timer(durationUntilMidnight, callFunctionAtMidnight);
    super.onInit();
    // await initPlatformState();
    _startListening();
    await manageSession();
  }

  void callFunctionAtMidnight() {
    // Function to be called at midnight
    prefs?.setString(StringConstants.stepsCount, stepCount.value.toString());
    Get.snackbar('It is now midnight!', 'Clear Your daily step count');
    print('It is now midnight!');
    // You can call your desired function here
  }

  Duration calculateDurationUntilMidnight(DateTime dateTime) {
    // Calculate the duration until midnight
    DateTime midnight =
        DateTime(dateTime.year, dateTime.month, dateTime.day + 1);
    Duration durationUntilMidnight = midnight.difference(dateTime);
    return durationUntilMidnight;
  }

  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    dispose();
    super.onClose();
  }

  void increment() => count.value++;

  Future<void> manageSession() async {
    if (prefs?.getString(ApiKeyConstants.userId) != null &&
        prefs!.getString(ApiKeyConstants.userId)!.isNotEmpty &&
        prefs?.getString(ApiKeyConstants.type) != null &&
        prefs!.getString(ApiKeyConstants.type)!.isNotEmpty) {
      doctorsGetDoctorByIdApi(
        id: prefs!.getString(ApiKeyConstants.userId).toString(),
        type: prefs!.getString(ApiKeyConstants.type).toString(),
      ).whenComplete(() {
        if (prefs?.getString(ApiKeyConstants.token) != null &&
            prefs!.getString(ApiKeyConstants.token)!.isNotEmpty &&
            prefs?.getString(ApiKeyConstants.type) != null &&
            prefs!.getString(ApiKeyConstants.type)!.isNotEmpty) {
          prefs?.setString(ApiKeyConstants.token,
              prefs!.getString(ApiKeyConstants.token).toString());
          prefs?.setString(ApiKeyConstants.type,
              prefs!.getString(ApiKeyConstants.type).toString());
          prefs?.setString(ApiKeyConstants.userId,
              prefs!.getString(ApiKeyConstants.userId).toString());
          if (prefs!.getString(ApiKeyConstants.type) == ApiKeyConstants.user) {
            Get.offAllNamed(Routes.NAV_BAR);
          } else if (prefs!.getString(ApiKeyConstants.type) ==
              ApiKeyConstants.doctor) {
            if (verifyStatus == '0') {
              Get.offAllNamed(Routes.PRT_EDIT_PROFILE);
            } else if (verifyStatus == '1') {
              Get.offAllNamed(Routes.WAITING_FOR_APPROVAL);
            } else {
              Get.offAllNamed(Routes.TEL_DOC_HOME);
            }
          } else if (prefs!.getString(ApiKeyConstants.type) ==
              ApiKeyConstants.trainer) {
            if (verifyStatus == '0') {
              Get.offAllNamed(Routes.PRT_EDIT_PROFILE);
            } else if (verifyStatus == '1') {
              Get.offAllNamed(Routes.WAITING_FOR_APPROVAL);
            } else {
              Get.offAllNamed(Routes.TRAINER_NET_HOME);
            }
          } else {
            if (verifyStatus == '0') {
              Get.offAllNamed(Routes.PRT_EDIT_PROFILE);
            } else if (verifyStatus == '1') {
              Get.offAllNamed(Routes.WAITING_FOR_APPROVAL);
            } else {
              Get.offAllNamed(Routes.LABORATORY_AND_CLINIC_HOME);
            }
          }
        } else if (verifyStatus == '0') {
          Get.offAllNamed(Routes.PRT_EDIT_PROFILE);
        } else if (verifyStatus == '1') {
          Get.offAllNamed(Routes.WAITING_FOR_APPROVAL);
        } else {
          Get.offAllNamed(Routes.GET_START);
        }
      });
    } else {
      Get.offAllNamed(Routes.GET_START);
    }
  }

  Future<void> doctorsGetDoctorByIdApi(
      {required String id, required String type}) async {
    bodyParams = {
      ApiKeyConstants.id: id.toString(),
      ApiKeyConstants.type: type.toString()
    };
    doctorsGetProfileModel =
        await ApiMethods.doctorsGetProfile(bodyParams: bodyParams);
    if (doctorsGetProfileModel != null) {
      if (doctorsGetProfileModel!.userData != null &&
          doctorsGetProfileModel!.userData!.verifyStatus != null &&
          doctorsGetProfileModel!.userData!.verifyStatus!.isNotEmpty) {
        verifyStatus = doctorsGetProfileModel!.userData!.verifyStatus!;
        if (doctorsGetProfileModel!.token != null &&
            doctorsGetProfileModel!.token!.isNotEmpty) {
          prefs?.setString(
              ApiKeyConstants.token, doctorsGetProfileModel!.token.toString());
        }
      }
    }
  }

/*
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  /// Handle step count changed
  void onStepCount(StepCount event) {
    int steps = event.steps;
    DateTime timeStamp = event.timeStamp;
    print('steps:::::::::::::::::${steps}');
    prefs?.setString(StringConstants.stepsCount, steps.toString());
    increment();
  }

  /// Handle status changed
  void onPedestrianStatusChanged(PedestrianStatus event) {
    String status = event.status;
    DateTime timeStamp = event.timeStamp;
  }

  /// Handle the error
  void onPedestrianStatusError(error) {
    print('onPedestrianStatusError::::::::::::::::${onPedestrianStatusError}');
    print('error::::::::::::::::onPedestrianStatusError${error}');
  }

  /// Handle the error
  void onStepCountError(error) {
    print('onStepCountError::::::::::::::::${onStepCountError}');
    print('error::::::::::::::::${error}');
  }

  Future<void> initPlatformState() async {
    print('initPlatformState::::::::::::::::${initPlatformState}');
    // Init streams
    _pedestrianStatusStream = await Pedometer.pedestrianStatusStream;
    _stepCountStream = await Pedometer.stepCountStream;
    // Listen to streams and handle errors
    print('_pedestrianStatusStream::::::::::::::::${_pedestrianStatusStream}');
    print('_stepCountStream::::::::::::::::${_stepCountStream}');
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);
  }
*/
/*  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;

  /// Handle step count changed
  void onStepCount(StepCount event) {
    int steps = event.steps;
    DateTime timeStamp = event.timeStamp;
    print('steps::::::::::::::::::::::::${steps}');
  }

  /// Handle status changed
  void onPedestrianStatusChanged(PedestrianStatus event) {
    String status = event.status;
    DateTime timeStamp = event.timeStamp;
    print('status::::::::::::::::::::::::${status}');
  }

  /// Handle the error
  void onPedestrianStatusError(error) {}

  /// Handle the error
  void onStepCountError(error) {}

  Future<void> initPlatformState() async {
    // Init streams
    _pedestrianStatusStream = await Pedometer.pedestrianStatusStream;
    _stepCountStream = await Pedometer.stepCountStream;

    // Listen to streams and handle errors
    _stepCountStream.listen(onStepCount).onError(onStepCountError);

    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);
  }*/

  void _startListening() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      // Assuming Z-axis is perpendicular to the ground
      // Check if the device is moving upwards (positive Z-axis values)
      if (event.z > 10 && !isCounting) {
        isCounting = true;
        stepCount.value++;
        print('steps:::::::::::::::::${stepCount.value}');
        prefs?.setString(
            StringConstants.stepsCount, stepCount.value.toString());
        increment();
      } else if (event.z < -10 && isCounting) {
        // Check if the device is moving downwards (negative Z-axis values)
        isCounting = false;
      }
    });
  }
}
