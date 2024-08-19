import 'dart:convert';

import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/apis/api_models/user_model.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginController extends GetxController {
  final count = 0.obs;
  final hide = true.obs;

  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isEmail = false.obs;
  final isPassword = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParams = {};
  SharedPreferences? prefs;

  final inAsyncCall = false.obs;
  UserModel? userModel;

  @override
  Future<void> onInit() async {
    prefs = await SharedPreferences.getInstance();
    super.onInit();
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  void increment() => count.value++;

  clickOnLoginButton() async {
    inAsyncCall.value = true;
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      bodyParams = {
        ApiKeyConstants.email: emailController.text.toString(),
        ApiKeyConstants.password: passwordController.text.toString(),
        ApiKeyConstants.type: ApiKeyConstants.user
      };
      userModel = await ApiMethods.login(bodyParams: bodyParams);
      if (userModel != null) {
        if (userModel?.token != null &&
            userModel!.token!.isNotEmpty &&
            userModel!.userData != null &&
            userModel!.userData!.id != null &&
            userModel!.userData!.id!.isNotEmpty) {
          prefs?.setString(ApiKeyConstants.type, ApiKeyConstants.user);
          prefs?.setString(ApiKeyConstants.token, userModel!.token.toString());
          prefs?.setString(
              ApiKeyConstants.userId, userModel!.userData!.id.toString());
          prefs?.setString(ApiKeyConstants.userData,
              jsonEncode(userModel!.userData!.toJson().toString()));
          Get.offAllNamed(Routes.NAV_BAR);
        }
      }
    }
    inAsyncCall.value = false;
  }

  clickOnForgotYourPasswordButton() {
    Get.toNamed(Routes.RESET_PASSWORD,
        parameters: {ApiKeyConstants.type: ApiKeyConstants.user});
  }

  clickOnSignUpButton() {
    Get.toNamed(Routes.SIGN_UP);
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }

  googleLogin() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    final token = await userCredential.user?.getIdToken();
    await prefs?.setString(ApiKeyConstants.firebaseToken, token??'');
    bodyParams = {
      ApiKeyConstants.email: userCredential.user?.email,
    };
    inAsyncCall.value = true;
    final response = await ApiMethods.checkSocialMediaRegistered(
      bodyParams: bodyParams
    );
    if(response != null){
      final jsonResponse = jsonDecode(response.body);
      if(jsonResponse['exist'] == true){
        //login with existing user
        bodyParams = {
          ApiKeyConstants.email: userCredential.user?.email,
        };
        userModel = await ApiMethods.socialLogin(bodyParams: bodyParams);
        if (userModel != null) {
          if (userModel?.token != null &&
              userModel!.token!.isNotEmpty &&
              userModel!.userData != null &&
              userModel!.userData!.id != null &&
              userModel!.userData!.id!.isNotEmpty) {
            prefs?.setString(ApiKeyConstants.type, ApiKeyConstants.user);
            prefs?.setString(ApiKeyConstants.token, userModel!.token.toString());
            prefs?.setString(
                ApiKeyConstants.userId, userModel!.userData!.id.toString());
            prefs?.setString(ApiKeyConstants.userData,
                jsonEncode(userModel!.userData!.toJson().toString()));
            Get.offAllNamed(Routes.NAV_BAR);
          }
        }
      } else {
        //go to social media registration screen
        // print('email ${userCredential.user?.email}');
        // print('phone ${userCredential.user?.phoneNumber}');
        Get.toNamed(Routes.SOCIAL_SIGNUP,
            parameters: {ApiKeyConstants.email: '${userCredential.user?.email}',ApiKeyConstants.phone: '${userCredential.user?.phoneNumber}'});
      }
    }
    inAsyncCall.value = false;
  }

  facebookLogin() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);

    // Once signed in, return the UserCredential
    UserCredential userCredential = await  FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    final token = await userCredential.user?.getIdToken();
    await prefs?.setString(ApiKeyConstants.firebaseToken, token??'');
    bodyParams = {
      ApiKeyConstants.email: userCredential.user?.email,
    };
    inAsyncCall.value = true;
    final response = await ApiMethods.checkSocialMediaRegistered(
        bodyParams: bodyParams
    );
    if(response != null){
      final jsonResponse = jsonDecode(response.body);
      if(jsonResponse['exist'] == true){
        //login with existing user
        bodyParams = {
          ApiKeyConstants.email: userCredential.user?.email,
        };
        userModel = await ApiMethods.socialLogin(bodyParams: bodyParams);
        if (userModel != null) {
          if (userModel?.token != null &&
              userModel!.token!.isNotEmpty &&
              userModel!.userData != null &&
              userModel!.userData!.id != null &&
              userModel!.userData!.id!.isNotEmpty) {
            prefs?.setString(ApiKeyConstants.type, ApiKeyConstants.user);
            prefs?.setString(ApiKeyConstants.token, userModel!.token.toString());
            prefs?.setString(
                ApiKeyConstants.userId, userModel!.userData!.id.toString());
            prefs?.setString(ApiKeyConstants.userData,
                jsonEncode(userModel!.userData!.toJson().toString()));
            Get.offAllNamed(Routes.NAV_BAR);
          }
        }
      } else {
        //go to social media registration screen
        // print('email ${userCredential.user?.email}');
        // print('phone ${userCredential.user?.phoneNumber}');
        Get.toNamed(Routes.SOCIAL_SIGNUP,
            parameters: {ApiKeyConstants.email: '${userCredential.user?.email}',ApiKeyConstants.phone: '${userCredential.user?.phoneNumber}'});
      }
    }
    inAsyncCall.value = false;
  }
}
