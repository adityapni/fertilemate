import 'dart:convert';
import 'dart:io';

import 'package:fertility_boost/app/data/apis/api_models/SpermBannerModel.dart';
import 'package:fertility_boost/app/data/apis/api_models/TvsAppointmentModel.dart';
import 'package:fertility_boost/app/data/apis/api_models/blog_by_category.dart';
import 'package:fertility_boost/app/data/apis/api_models/blog_category.dart';
import 'package:fertility_boost/app/data/apis/api_models/carts_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_cervical_mucus_history_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_doctor_availability_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_peace_sub_category_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_period_symtoms_history_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/get_temperature_history_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/personal_trainer_category.dart';
import 'package:fertility_boost/app/data/apis/api_models/personal_trainer_list.dart';
import 'package:fertility_boost/app/data/apis/api_models/trainer_appointment_list.dart';
import 'package:http/http.dart' as http;

import '../../../../common/http_methods.dart';
import '../api_constants/api_url_constants.dart';
import '../api_models/ClinicDetailByClinicId.dart';
import '../api_models/SpermAssessmentModel.dart';
import '../api_models/TvsClinicList.dart';
import '../api_models/address_by_user_id_model.dart';
import '../api_models/available_clinics_get_available_clinics_by_id_model.dart';
import '../api_models/available_clinics_get_available_clinics_by_test_id_model.dart';
import '../api_models/available_clinics_get_clinic_detail_by_id_model.dart';
import '../api_models/available_clinics_model.dart';
import '../api_models/available_tests_model.dart';
import '../api_models/booking_data_model.dart';
import '../api_models/categories_by_main_category_id_model.dart';
import '../api_models/chats_chat_between_user_model.dart';
import '../api_models/chats_model.dart';
import '../api_models/count_doctor_upcoming_appointment_model.dart';
import '../api_models/cycle_tracking_option_model.dart';
import '../api_models/cycle_tracking_sub_option_model.dart';
import '../api_models/doctors_get_doctor_by_id_model.dart';
import '../api_models/doctors_get_profile_model.dart';
import '../api_models/doctors_model.dart';
import '../api_models/expert_consultation_get_expert_consultation_categories_model.dart';
import '../api_models/expert_consultation_get_expert_consultation_doctors_by_categories_model.dart';
import '../api_models/fertility_educations_get_fertility_report_model.dart';
import '../api_models/fertility_educations_get_fertility_test_kit_model.dart';
import '../api_models/get_admin_msg_count_model.dart';
import '../api_models/get_body_parts_model.dart';
import '../api_models/get_chat_model.dart';
import '../api_models/get_clinic_notification_details_model.dart';
import '../api_models/get_clinic_notification_model.dart';
import '../api_models/get_cycle_tracking_data_model.dart';
import '../api_models/get_discover_filters_model.dart';
import '../api_models/get_doctor_appointment_details_model.dart';
import '../api_models/get_doctor_upcoming_appointment_model.dart';
import '../api_models/get_e_book_by_category_model.dart';
import '../api_models/get_e_book_category_model.dart';
import '../api_models/get_expert_consultation_doctors_details_model.dart';
import '../api_models/get_fertility_education_banner_model.dart';
import '../api_models/get_fertility_educations_blogs_details.dart';
import '../api_models/get_fertility_educations_featured_saved_webinars_model.dart';
import '../api_models/get_fertility_educations_featured_webinars_model.dart';
import '../api_models/get_fertility_educations_saved_blog_model.dart';
import '../api_models/get_fertility_webinars_banner_model.dart';
import '../api_models/get_fertility_webinars_blogs_by_category_model.dart';
import '../api_models/get_fertility_webinars_details_model.dart';
import '../api_models/get_find_coach_category_model.dart';
import '../api_models/get_find_coach_model.dart';
import '../api_models/get_forum_category_model.dart';
import '../api_models/get_forum_discussion_model.dart';
import '../api_models/get_forum_question_answer_model.dart';
import '../api_models/get_forum_topic_model.dart';
import '../api_models/get_healthR_record_model.dart';
import '../api_models/get_home_banner_model.dart';
import '../api_models/get_insights_model.dart';
import '../api_models/get_intimacy_category_model.dart';
import '../api_models/get_intimacy_game_category_model.dart';
import '../api_models/get_intimacy_sub_category_model.dart';
import '../api_models/get_latest_question_model.dart';
import '../api_models/get_male_fertility_quiz_model.dart';
import '../api_models/get_male_fertility_quiz_range_model.dart';
import '../api_models/get_menopause_assessment_question_model.dart';
import '../api_models/get_next_video_list_discover_model.dart';
import '../api_models/get_payex_booking_payment_model.dart';
import '../api_models/get_payment_token_model.dart';
import '../api_models/get_pcos_assessment_question_model.dart';
import '../api_models/get_peace_category_model.dart';
import '../api_models/get_personal_trainer_details_model.dart';
import '../api_models/get_prediabetes_assessment_question_model.dart';
import '../api_models/get_recommendation_blogs_model.dart';
import '../api_models/get_recommended_soundtracks_model.dart';
import '../api_models/get_romantic_spot_category_model.dart';
import '../api_models/get_save_intimacy_management_blogs_model.dart';
import '../api_models/get_single_video_model.dart';
import '../api_models/get_sleep_management_categories_model.dart';
import '../api_models/get_sonography_ultrasounds_model.dart';
import '../api_models/get_soundtrack_categories_model.dart';
import '../api_models/get_suppliment_plan_model.dart';
import '../api_models/get_supportive_community_details_model.dart';
import '../api_models/get_supportive_community_model.dart';
import '../api_models/get_supportive_peace_by_id_model.dart';
import '../api_models/get_supportive_peace_model.dart';
import '../api_models/get_ultrasound_history_model.dart';
import '../api_models/get_upcoming_booking_appointment_model.dart';
import '../api_models/get_workout_blog_by_workout_week_id_model.dart';
import '../api_models/get_workout_model.dart';
import '../api_models/get_workout_types_model.dart';
import '../api_models/get_workout_week_model.dart';
import '../api_models/get_zen_book_location_category_model.dart';
import '../api_models/guides_get_guid_by_sub_categorie_id_model.dart';
import '../api_models/guides_get_menu_by_guide_id_model.dart';
import '../api_models/intimacy_game_get_intimacy_game_model.dart';
import '../api_models/intimacy_get_intimacy_insights_model.dart';
import '../api_models/love_language_get_love_language_model.dart';
import '../api_models/love_sub_language_get_love_sub_language_model.dart';
import '../api_models/main_categories_model.dart';
import '../api_models/nutritional_guidance_get_nutritional_guidance_blog_by_sub_categorie_id_model.dart';
import '../api_models/password_reset_model.dart';
import '../api_models/payex_payment_model.dart';
import '../api_models/personal_trainer_get_trainer_category.dart';
import '../api_models/posts_model.dart';
import '../api_models/privacy_policy_model.dart';
import '../api_models/products_by_category_id_model.dart';
import '../api_models/products_by_id_model.dart';
import '../api_models/questions_model.dart';
import '../api_models/quiz_result_model.dart';
import '../api_models/romantic_pot_get_romantic_spot_model.dart';
import '../api_models/sleep_management_favorites_sleep_management_sound_track_add_favourites_model.dart';
import '../api_models/sleep_management_get_sleep_management_categories_model.dart';
import '../api_models/sleep_management_get_sleep_management_sound_tracks_by_id_model.dart';
import '../api_models/sleep_management_get_sleep_management_sound_tracks_model.dart';
import '../api_models/sleep_management_intimacy_management_get_intimacy_management_categories_blogs_model.dart';
import '../api_models/sleep_management_zen_book_get_zen_book_nearest_providers_model.dart';
import '../api_models/sleep_management_zen_book_get_zen_book_packages_model.dart';
import '../api_models/sleep_management_zen_book_get_zen_book_providers_by_id.dart';
import '../api_models/sub_categories_by_category_id_model.dart';
import '../api_models/tvs_scan_get_trainer_type_list_model.dart';
import '../api_models/update_payex_booking_payment_model.dart';
import '../api_models/user_model.dart';

class ApiMethods {
  static Future<UserModel?> login({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfLogin,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<UserModel?> register({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel? userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfRegister,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<PasswordResetModel?> resetPassword({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfPasswordReset,
      checkResponse: checkResponse,
    );
    if (response != null) {
      PasswordResetModel passwordResetModel =
          PasswordResetModel.fromJson(jsonDecode(response.body));
      return passwordResetModel;
    }
    return null;
  }

  static Future<http.Response?> address({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddress,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<UserModel?> checkOtp({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCheckOtp,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<http.Response?> addCarts({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfAddCarts,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> deleteCarts({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfDeleteCartById,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> updateCartById({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfUpdateCartById,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<UserModel?> createNewPassword({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel userModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfCreateNewPassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<MainCategoriesModel?> mainCategories({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    MainCategoriesModel mainCategoriesModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfMainCategories,
      checkResponse: checkResponse,
    );
    if (response != null) {
      mainCategoriesModel =
          MainCategoriesModel.fromJson(jsonDecode(response.body));
      return mainCategoriesModel;
    }
    return null;
  }

  static Future<SleepManagementGetSleepManagementCategoriesModel?>
      sleepManagementGetSleepManagementCategories({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SleepManagementGetSleepManagementCategoriesModel
        sleepManagementGetSleepManagementCategoriesModel;
    http.Response? response = await MyHttp.getMethod(
      url:
          ApiUrlConstants.endPointOfSleepManagementGetSleepManagementCategories,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sleepManagementGetSleepManagementCategoriesModel =
          SleepManagementGetSleepManagementCategoriesModel.fromJson(
              jsonDecode(response.body));
      return sleepManagementGetSleepManagementCategoriesModel;
    }
    return null;
  }

  static Future<SleepManagementGetSleepManagementSoundTracksModel?>
      sleepManagementGetSleepManagementSoundTracks({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SleepManagementGetSleepManagementSoundTracksModel
        sleepManagementGetSleepManagementSoundTracksModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants
          .endPointOfSleepManagementGetSleepManagementSoundTracks,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sleepManagementGetSleepManagementSoundTracksModel =
          SleepManagementGetSleepManagementSoundTracksModel.fromJson(
              jsonDecode(response.body));
      return sleepManagementGetSleepManagementSoundTracksModel;
    }
    return null;
  }

  static Future<SleepManagementZenBookGetZenBookPackagesModel?>
      sleepManagementZenBookGetZenBookPackages({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SleepManagementZenBookGetZenBookPackagesModel
        sleepManagementZenBookGetZenBookPackagesModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfSleepManagementZenBookGetZenBookPackages,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sleepManagementZenBookGetZenBookPackagesModel =
          SleepManagementZenBookGetZenBookPackagesModel.fromJson(
              jsonDecode(response.body));
      return sleepManagementZenBookGetZenBookPackagesModel;
    }
    return null;
  }

  static Future<ExpertConsultationGetExpertConsultationCategoriesModel?>
      expertConsultationGetExpertConsultationCategories({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    ExpertConsultationGetExpertConsultationCategoriesModel
        expertConsultationGetExpertConsultationCategoriesModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants
          .endPointOfExpertConsultationGetExpertConsultationCategories,
      checkResponse: checkResponse,
    );
    if (response != null) {
      expertConsultationGetExpertConsultationCategoriesModel =
          ExpertConsultationGetExpertConsultationCategoriesModel.fromJson(
              jsonDecode(response.body));
      return expertConsultationGetExpertConsultationCategoriesModel;
    }
    return null;
  }

  static Future<
          ExpertConsultationGetExpertConsultationDoctorsByCategoriesModel?>
      expertConsultationGetExpertConsultationDoctorsByCategories({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    ExpertConsultationGetExpertConsultationDoctorsByCategoriesModel
        expertConsultationGetExpertConsultationDoctorsByCategoriesModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants
          .endPointOfExpertConsultationGetExpertConsultationDoctorsByCategories,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      expertConsultationGetExpertConsultationDoctorsByCategoriesModel =
          ExpertConsultationGetExpertConsultationDoctorsByCategoriesModel
              .fromJson(jsonDecode(response.body));
      return expertConsultationGetExpertConsultationDoctorsByCategoriesModel;
    }
    return null;
  }

  static Future<
          SleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel?>
      sleepManagementIntimacyManagementGetIntimacyManagementCategories({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    SleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel
        sleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants
          .endPointOfSleepManagementIntimacyManagementGetIntimacyManagementCategories,
      checkResponse: checkResponse,
    );
    if (response != null) {
      sleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel =
          SleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel
              .fromJson(jsonDecode(response.body));
      return sleepManagementIntimacyManagementGetIntimacyManagementCategoriesModel;
    }
    return null;
  }

  static Future<GetEBookCategoryModel?> getEbookCategory({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetEBookCategoryModel getEBookCategory;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetEbookCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getEBookCategory =
          GetEBookCategoryModel.fromJson(jsonDecode(response.body));
      return getEBookCategory;
    }
    return null;
  }

  static Future<IntimacyGetIntimacyInsightsModel?> intimacyGetIntimacyInsights({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    IntimacyGetIntimacyInsightsModel intimacyGetIntimacyInsightsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfIntimacyGetIntimacyInsights,
      checkResponse: checkResponse,
    );
    if (response != null) {
      intimacyGetIntimacyInsightsModel =
          IntimacyGetIntimacyInsightsModel.fromJson(jsonDecode(response.body));
      return intimacyGetIntimacyInsightsModel;
    }
    return null;
  }

  static Future<GetIntimacyCategoryModel?> intimacyCategoryGetIntimacyCategory({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetIntimacyCategoryModel getIntimacyCategory;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfIntimacyCategoryGetIntimacyCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getIntimacyCategory =
          GetIntimacyCategoryModel.fromJson(jsonDecode(response.body));
      return getIntimacyCategory;
    }
    return null;
  }

  static Future<GetWorkoutModel?> getWorkout({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetWorkoutModel getWorkoutModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetWorkout,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getWorkoutModel = GetWorkoutModel.fromJson(jsonDecode(response.body));
      return getWorkoutModel;
    }
    return null;
  }

  static Future<TvsScanGetTrainerTypeListModel?> getTrainerTypeList({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    TvsScanGetTrainerTypeListModel tvsScanGetTrainerTypeListModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetTrainerTypeList,
      checkResponse: checkResponse,
    );
    if (response != null) {
      tvsScanGetTrainerTypeListModel =
          TvsScanGetTrainerTypeListModel.fromJson(jsonDecode(response.body));
      return tvsScanGetTrainerTypeListModel;
    }
    return null;
  }

  static Future<GetIntimacyGameCategoryModel?> getIntimacyGameCategory({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetIntimacyGameCategoryModel getIntimacyGameCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url:
          ApiUrlConstants.endPointOfIntimacyGameCategoryGetIntimacyGameCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getIntimacyGameCategoryModel =
          GetIntimacyGameCategoryModel.fromJson(jsonDecode(response.body));
      return getIntimacyGameCategoryModel;
    }
    return null;
  }

  static Future<IntimacyGameGetIntimacyGameModel?> intimacyGameGetIntimacyGame({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    IntimacyGameGetIntimacyGameModel intimacyGameGetIntimacyGameModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfIntimacyGameGetIntimacyGame,
      checkResponse: checkResponse,
    );
    if (response != null) {
      intimacyGameGetIntimacyGameModel =
          IntimacyGameGetIntimacyGameModel.fromJson(jsonDecode(response.body));
      return intimacyGameGetIntimacyGameModel;
    }
    return null;
  }

  static Future<LoveLanguageGetLoveLanguageModel?> loveLanguageGetLoveLanguage({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    LoveLanguageGetLoveLanguageModel loveLanguageGetLoveLanguageModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfLoveLanguageGetLoveLanguage,
      checkResponse: checkResponse,
    );
    if (response != null) {
      loveLanguageGetLoveLanguageModel =
          LoveLanguageGetLoveLanguageModel.fromJson(jsonDecode(response.body));
      return loveLanguageGetLoveLanguageModel;
    }
    return null;
  }

  static Future<GetRomanticSpotCategoryModel?>
      romanticSpotCategoryGetRomanticSpotCategory({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetRomanticSpotCategoryModel getRomanticSpotCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url:
          ApiUrlConstants.endPointOfRomanticSpotCategoryGetRomanticSpotCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getRomanticSpotCategoryModel =
          GetRomanticSpotCategoryModel.fromJson(jsonDecode(response.body));
      return getRomanticSpotCategoryModel;
    }
    return null;
  }

  static Future<GetRecommendationBlogsModel?>
      sleepManagementIntimacyManagementGetRecommendationBlogs({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetRecommendationBlogsModel getRecommendationBlogsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants
          .endPointOfSleepManagementIntimacyManagementGetRecommendationBlogs,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getRecommendationBlogsModel =
          GetRecommendationBlogsModel.fromJson(jsonDecode(response.body));
      return getRecommendationBlogsModel;
    }
    return null;
  }

  static Future<GetDiscoverFiltersModel?> sleepManagementGetDiscoverFilters({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetDiscoverFiltersModel getDiscoverFiltersModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfSleepManagementGetDiscoverFilters,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getDiscoverFiltersModel =
          GetDiscoverFiltersModel.fromJson(jsonDecode(response.body));
      return getDiscoverFiltersModel;
    }
    return null;
  }

  static Future<GetSoundtrackCategoriesModel?>
      sleepManagementGetSoundtrackCategories({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetSoundtrackCategoriesModel getSoundtrackCategoriesModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfSleepManagementGetSoundtrackCategories,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getSoundtrackCategoriesModel =
          GetSoundtrackCategoriesModel.fromJson(jsonDecode(response.body));
      return getSoundtrackCategoriesModel;
    }
    return null;
  }

  static Future<GetRecommendedSoundtracksModel?>
      sleepManagementGetRecommendedSoundtracks({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetRecommendedSoundtracksModel getRecommendedSoundtracksModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfSleepManagementGetRecommendedSoundtracks,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getRecommendedSoundtracksModel =
          GetRecommendedSoundtracksModel.fromJson(jsonDecode(response.body));
      return getRecommendedSoundtracksModel;
    }
    return null;
  }

  static Future<RomanticSpotGetRomanticSpotModel?> romanticSpotGetRomanticSpot({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    RomanticSpotGetRomanticSpotModel romanticSpotGetRomanticSpotModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfRomanticSpotGetRomanticSpot,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      romanticSpotGetRomanticSpotModel =
          RomanticSpotGetRomanticSpotModel.fromJson(jsonDecode(response.body));
      return romanticSpotGetRomanticSpotModel;
    }
    return null;
  }

  static Future<GetSaveIntimacyManagementBlogsModel?>
      getSaveIntimacyManagementBlogs({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetSaveIntimacyManagementBlogsModel getSaveIntimacyManagementBlogsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetSaveIntimacyManagementBlogs,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getSaveIntimacyManagementBlogsModel =
          GetSaveIntimacyManagementBlogsModel.fromJson(
              jsonDecode(response.body));
      return getSaveIntimacyManagementBlogsModel;
    }
    return null;
  }

  static Future<GetEBookByCategoryModel?> getEBookByCategory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetEBookByCategoryModel getEBookByCategoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetEBookByCategory,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getEBookByCategoryModel =
          GetEBookByCategoryModel.fromJson(jsonDecode(response.body));
      return getEBookByCategoryModel;
    }
    return null;
  }

  static Future<PersonalTrainerGetTrainerCategoryModel?>
      personalTrainerGetTrainerCategory({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    PersonalTrainerGetTrainerCategoryModel
        personalTrainerGetTrainerCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfPersonalTrainerGetTrainerCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      personalTrainerGetTrainerCategoryModel =
          PersonalTrainerGetTrainerCategoryModel.fromJson(
              jsonDecode(response.body));
      return personalTrainerGetTrainerCategoryModel;
    }
    return null;
  }

  static Future<PrivacyPolicyModel?> privacyPolicy({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
    required String endPoint,
  }) async {
    PrivacyPolicyModel privacyPolicyModel;
    http.Response? response = await MyHttp.getMethod(
      url: endPoint,
      checkResponse: checkResponse,
    );
    if (response != null) {
      privacyPolicyModel =
          PrivacyPolicyModel.fromJson(jsonDecode(response.body));
      return privacyPolicyModel;
    }
    return null;
  }

  static Future<GetSupportiveCommunityModel?> getSupportiveCommunity({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetSupportiveCommunityModel getSupportiveCommunityModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetSupportiveCommunity,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getSupportiveCommunityModel =
          GetSupportiveCommunityModel.fromJson(jsonDecode(response.body));
      return getSupportiveCommunityModel;
    }
    return null;
  }

  static Future<GetNextVideoListDiscoverModel?> getNextVideoListDiscover({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetNextVideoListDiscoverModel getNextVideoListDiscoverModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetNextVideoListDiscover,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getNextVideoListDiscoverModel =
          GetNextVideoListDiscoverModel.fromJson(jsonDecode(response.body));
      return getNextVideoListDiscoverModel;
    }
    return null;
  }

  static Future<GetWorkoutWeekModel?> getWorkoutWeek({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetWorkoutWeekModel getWorkoutWeekModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetWorkoutWeek,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getWorkoutWeekModel =
          GetWorkoutWeekModel.fromJson(jsonDecode(response.body));
      return getWorkoutWeekModel;
    }
    return null;
  }

  static Future<GetSingleVideoModel?> getSingleVideo({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetSingleVideoModel getSingleVideoModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetSingleVideo,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getSingleVideoModel =
          GetSingleVideoModel.fromJson(jsonDecode(response.body));
      return getSingleVideoModel;
    }
    return null;
  }

  static Future<GetIntimacySubCategoryModel?>
      intimacySubCategoryGetIntimacySubcategory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetIntimacySubCategoryModel getIntimacySubCategoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri:
          ApiUrlConstants.endPointOfIntimacySubCategoryGetIntimacySubcategory,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getIntimacySubCategoryModel =
          GetIntimacySubCategoryModel.fromJson(jsonDecode(response.body));
      return getIntimacySubCategoryModel;
    }
    return null;
  }

  static Future<LoveSubLanguageGetLoveSubLanguageModel?>
      loveSubLanguageGetLoveSubLanguage({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    LoveSubLanguageGetLoveSubLanguageModel
        loveSubLanguageGetLoveSubLanguageModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfLoveSubLanguageGetLoveSubLanguage,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      loveSubLanguageGetLoveSubLanguageModel =
          LoveSubLanguageGetLoveSubLanguageModel.fromJson(
              jsonDecode(response.body));
      return loveSubLanguageGetLoveSubLanguageModel;
    }
    return null;
  }

  static Future<SleepManagementGetSleepManagementSoundTracksByIdModel?>
      sleepManagementGetSleepManagementSoundTracksById({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    SleepManagementGetSleepManagementSoundTracksByIdModel
        sleepManagementGetSleepManagementSoundTracksByIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants
          .endPointOfSleepManagementGetSleepManagementSoundTracksById,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      sleepManagementGetSleepManagementSoundTracksByIdModel =
          SleepManagementGetSleepManagementSoundTracksByIdModel.fromJson(
              jsonDecode(response.body));
      return sleepManagementGetSleepManagementSoundTracksByIdModel;
    }
    return null;
  }

  static Future<GetDoctorUpcomingAppointmentModel?>
      getDoctorUpcomingAppointment({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetDoctorUpcomingAppointmentModel getDoctorUpcomingAppointmentModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetDoctorUpcomingAppointment,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getDoctorUpcomingAppointmentModel =
          GetDoctorUpcomingAppointmentModel.fromJson(jsonDecode(response.body));
      return getDoctorUpcomingAppointmentModel;
    }
    return null;
  }

  static Future<DoctorAvailabilityModel?> getDoctorAvailability({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    DoctorAvailabilityModel doctorAvailabilityModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetDoctorAvailability,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      doctorAvailabilityModel =
          DoctorAvailabilityModel.fromJson(jsonDecode(response.body));
      return doctorAvailabilityModel;
    }
    return null;
  }

  static Future<http.Response?> editDoctorAvailability({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfEditDoctorAvailability,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> saveIntimacySubcategory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfSaveIntimacySubcategory,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> saveIntimacyManagementBlogs({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfSaveIntimacyManagementBlogs,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<
          SleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel?>
      sleepManagementFavoritesSleepManagementSoundTrackAddFavourites({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    SleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel
        getWorkoutWeekModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants
          .endPointOfSleepManagementFavoritesSleepManagementSoundTrackAddFavourites,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getWorkoutWeekModel =
          SleepManagementFavoritesSleepManagementSoundTrackAddFavouritesModel
              .fromJson(jsonDecode(response.body));
      return getWorkoutWeekModel;
    }
    return null;
  }

  static Future<
          SleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel?>
      sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogs({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    SleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel
        sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants
          .endPointOfSleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogs,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel =
          SleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel
              .fromJson(jsonDecode(response.body));
      return sleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogsModel;
    }
    return null;
  }

  static Future<FertilityEducationsGetFertilityTestKitModel?>
      fertilityEducationsGetFertilityTestKit({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    FertilityEducationsGetFertilityTestKitModel
        fertilityEducationsGetFertilityTestKitModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri:
          ApiUrlConstants.endPointOfFertilityEducationsGetFertilityTestKit,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      fertilityEducationsGetFertilityTestKitModel =
          FertilityEducationsGetFertilityTestKitModel.fromJson(
              jsonDecode(response.body));
      return fertilityEducationsGetFertilityTestKitModel;
    }
    return null;
  }

  static Future<SleepManagementZenBookGetZenBookProvidersByIdModel?>
      sleepManagementZenBookGetZenBookProvidersById({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    SleepManagementZenBookGetZenBookProvidersByIdModel
        sleepManagementZenBookGetZenBookProvidersByIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants
          .endPointOfSleepManagementZenBookGetZenBookProvidersById,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      sleepManagementZenBookGetZenBookProvidersByIdModel =
          SleepManagementZenBookGetZenBookProvidersByIdModel.fromJson(
              jsonDecode(response.body));
      return sleepManagementZenBookGetZenBookProvidersByIdModel;
    }
    return null;
  }

  static Future<http.Response?> sleepManagementZenBookGetZenBookAddBookings({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri:
          ApiUrlConstants.endPointOfSleepManagementZenBookGetZenBookAddBookings,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<ProductsByIdModel?> productsById({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    ProductsByIdModel productsByIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfProductsById,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      productsByIdModel = ProductsByIdModel.fromJson(jsonDecode(response.body));
      return productsByIdModel;
    }
    return null;
  }

  static Future<CategoriesByMainCategoryIdModel?> categoriesByMainCategoryId({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    CategoriesByMainCategoryIdModel categoriesByMainCategoryIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfCategoriesByMainCategoryId,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {;
      categoriesByMainCategoryIdModel =
          CategoriesByMainCategoryIdModel.fromJson(jsonDecode(response.body));
      return categoriesByMainCategoryIdModel;
    }
    return null;
  }

  static Future<SubCategoriesByCategoryIdModel?> subCategoriesByCategoryId({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    SubCategoriesByCategoryIdModel subCategoriesByCategoryIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfSubCategoriesByCategoryId,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      subCategoriesByCategoryIdModel =
          SubCategoriesByCategoryIdModel.fromJson(jsonDecode(response.body));
      return subCategoriesByCategoryIdModel;
    }
    return null;
  }

  static Future<GetSupportiveCommunityDetailsModel?>
      getSupportiveCommunityDetails({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetSupportiveCommunityDetailsModel getSupportiveCommunityDetailsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetSupportiveCommunityDetails,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getSupportiveCommunityDetailsModel =
          GetSupportiveCommunityDetailsModel.fromJson(
              jsonDecode(response.body));
      return getSupportiveCommunityDetailsModel;
    }
    return null;
  }

  static Future<GuidesGetGuidBySubCategoryIdModel?>
      guidesGetGuidBySubCategorieId({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GuidesGetGuidBySubCategoryIdModel guidesGetGuidBySubCategoryIdModel;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfGuidesGetGuidBySubCategorieId,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      guidesGetGuidBySubCategoryIdModel =
          GuidesGetGuidBySubCategoryIdModel.fromJson(jsonDecode(response.body));
      return guidesGetGuidBySubCategoryIdModel;
    }
    return null;
  }

  static Future<http.Response?> fertilityEducationsAddFertilityReport({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    File? image,
    String? imageKey,
  }) async {
    http.Response? response = await MyHttp.multipart(
      imageKey: imageKey,
      image: image,
      url: ApiUrlConstants.endPointOfFertilityEducationsAddFertilityReport,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<FertilityEducationsGetFertilityReportModel?>
      fertilityEducationsGetFertilityReport({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    File? image,
    String? imageKey,
  }) async {
    FertilityEducationsGetFertilityReportModel?
        fertilityEducationsGetFertilityReportModel;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfFertilityEducationsGetFertilityReport,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      fertilityEducationsGetFertilityReportModel =
          FertilityEducationsGetFertilityReportModel.fromJson(
              jsonDecode(response.body));
      return fertilityEducationsGetFertilityReportModel;
    }
    return null;
  }

  static Future<http.Response?> doctorsBookingExtraBookingAdd({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfDoctorsBookingExtraBookingAdd,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> guidesUploadMenuByGuideId({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    File? image,
    String? imageKey,
  }) async {
    http.Response? response = await MyHttp.multipart(
      image: image,
      imageKey: imageKey,
      url: ApiUrlConstants.endPointOfGuidesUploadMenuByGuideId,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<GuidesGetMenuByGuideIdModel?> guidesGetMenuByGuideId(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> bodyParams,
      String url = ''}) async {
    GuidesGetMenuByGuideIdModel guidesGetGuidBySubCategoryIdModel;
    http.Response? response = await MyHttp.postMethod(
      url: url,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      guidesGetGuidBySubCategoryIdModel =
          GuidesGetMenuByGuideIdModel.fromJson(jsonDecode(response.body));
      return guidesGetGuidBySubCategoryIdModel;
    }
    return null;
  }

  static Future<GetSonographyUltrasoundsModel?> getSonographyUltrasounds({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetSonographyUltrasoundsModel getSonographyUltrasoundsModel;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfGetSonographyUltrasounds,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      getSonographyUltrasoundsModel =
          GetSonographyUltrasoundsModel.fromJson(jsonDecode(response.body));
      return getSonographyUltrasoundsModel;
    }
    return null;
  }

  static Future<http.Response?> uploadSonographyUltrasounds({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    File? image,
    String? imageKey,
  }) async {
    http.Response? response = await MyHttp.multipart(
      image: image,
      imageKey: imageKey,
      url: ApiUrlConstants.endPointOfUploadSonographyUltrasounds,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<ProductsByCategoryIdModel?> productsByCategoryId({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    ProductsByCategoryIdModel productsByCategoryIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfProductsByCategoryId,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      productsByCategoryIdModel =
          ProductsByCategoryIdModel.fromJson(jsonDecode(response.body));
      return productsByCategoryIdModel;
    }
    return null;
  }

  static Future<GetWorkoutBlogByWorkoutWeekIdModel?>
      getWorkoutBlogByWorkoutWeekId({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetWorkoutBlogByWorkoutWeekIdModel getWorkoutBlogByWorkoutWeekIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetWorkoutBlogByWorkoutWeekId,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getWorkoutBlogByWorkoutWeekIdModel =
          GetWorkoutBlogByWorkoutWeekIdModel.fromJson(
              jsonDecode(response.body));
      return getWorkoutBlogByWorkoutWeekIdModel;
    }
    return null;
  }

  static Future<GetSupplementPlanModel?> getSupplementPlan({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetSupplementPlanModel getSupplementPlanModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetSupplimentPlan,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getSupplementPlanModel =
          GetSupplementPlanModel.fromJson(jsonDecode(response.body));
      return getSupplementPlanModel;
    }
    return null;
  }

  static Future<GuidanceGetNutritionalGuidanceBlogBySubCategorieIdModel?>
      guidanceGetNutritionalGuidanceBlogBySubCategorieId({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GuidanceGetNutritionalGuidanceBlogBySubCategorieIdModel
        guidanceGetNutritionalGuidanceBlogBySubCategorieIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants
          .endPointOfNutritionalGuidanceGetNutritionalGuidanceBlogBySubCategorieId,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      guidanceGetNutritionalGuidanceBlogBySubCategorieIdModel =
          GuidanceGetNutritionalGuidanceBlogBySubCategorieIdModel.fromJson(
              jsonDecode(response.body));
      return guidanceGetNutritionalGuidanceBlogBySubCategorieIdModel;
    }
    return null;
  }

  static Future<AddressByUserIdModel?> addressByUserId({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    AddressByUserIdModel addressByUserIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfAddressByUserId,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      addressByUserIdModel =
          AddressByUserIdModel.fromJson(jsonDecode(response.body));
      return addressByUserIdModel;
    }
    return null;
  }

  static Future<CartsModel?> carts({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    CartsModel cartsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfCarts,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      cartsModel = CartsModel.fromJson(jsonDecode(response.body));
      return cartsModel;
    }
    return null;
  }

  static Future<CycleTrackingOptionModel?> cycleTrackingOption({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    CycleTrackingOptionModel cycleTrackingOptionModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfCycleTrackingOption,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      cycleTrackingOptionModel =
          CycleTrackingOptionModel.fromJson(jsonDecode(response.body));
      return cycleTrackingOptionModel;
    }
    return null;
  }

  static Future<CycleTrackingSubOptionModel?> cycleTrackingSubOption({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    CycleTrackingSubOptionModel cycleTrackingSubOptionModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfCycleTrackingSubOption,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      cycleTrackingSubOptionModel =
          CycleTrackingSubOptionModel.fromJson(jsonDecode(response.body));
      return cycleTrackingSubOptionModel;
    }
    return null;
  }

  static Future<ChatsModel?> chats({
    void Function(int)? checkResponse,
  }) async {
    ChatsModel chatsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfChats,
      checkResponse: checkResponse,
    );
    if (response != null) {
      chatsModel = ChatsModel.fromJson(jsonDecode(response.body));
      return chatsModel;
    }
    return null;
  }

  static Future<GetInsightsModel?> getInsights({
    void Function(int)? checkResponse,
  }) async {
    GetInsightsModel getInsightsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetInsights,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getInsightsModel = GetInsightsModel.fromJson(jsonDecode(response.body));
      return getInsightsModel;
    }
    return null;
  }

  static Future<ChatsChatBetweenUserModel?> chatsChatBetweenUser(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    ChatsChatBetweenUserModel chatsChatBetweenUserModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChatsChatBetweenUser,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      chatsChatBetweenUserModel =
          ChatsChatBetweenUserModel.fromJson(jsonDecode(response.body));
      return chatsChatBetweenUserModel;
    }
    return null;
  }

  static Future<GetChatModel?> getChat(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    GetChatModel getChatModel;
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfGetChat,
      checkResponse: checkResponse,
      wantSnackBar: wantSnackBar,
    );
    if (response != null) {
      getChatModel = GetChatModel.fromJson(jsonDecode(response.body));
      return getChatModel;
    }
    return null;
  }

  static Future<http.Response?> insertChats(
      {void Function(int)? checkResponse,
      Map<String, dynamic>? bodyParams,
      bool wantSnackBar = true}) async {
    http.Response? response = await MyHttp.postMethod(
      wantSnackBar: wantSnackBar,
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfInsertChats,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<GetAdminMsgCountModel?> getAdminMsgCount({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetAdminMsgCountModel getAdminMsgCountModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetAdminMsgCount,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getAdminMsgCountModel =
          GetAdminMsgCountModel.fromJson(jsonDecode(response.body));
      return getAdminMsgCountModel;
    }
    return null;
  }

  static Future<http.Response?> insertChat(
      {void Function(int)? checkResponse,
      required Map<String, dynamic> bodyParams,
      File? image,
      String? imageKey,
      bool wantSnackBar = true}) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfInsertChat,
      image: image,
      imageKey: imageKey,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<PostsModel?> posts({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    PostsModel postsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfPosts,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      postsModel = PostsModel.fromJson(jsonDecode(response.body));
      return postsModel;
    }
    return null;
  }

  static Future<GetHealthRecordModel?> getHealthRecord({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetHealthRecordModel getHealthRecordModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetHealthRecord,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getHealthRecordModel =
          GetHealthRecordModel.fromJson(jsonDecode(response.body));
      return getHealthRecordModel;
    }
    return null;
  }

/*  static Future<GetProfileModel?> getProfile({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetProfileModel getProfileModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetProfile,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getProfileModel = GetProfileModel.fromJson(jsonDecode(response.body));
      return getProfileModel;
    }
    return null;
  }*/

  static Future<http.Response?> addRates({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfAddRates,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> deleteAccount({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfDeleteAccount,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> changePassword({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfChangePassword,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<DoctorsModel?> doctors({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    DoctorsModel doctorsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfDoctors,
      checkResponse: checkResponse,
    );
    if (response != null) {
      doctorsModel = DoctorsModel.fromJson(jsonDecode(response.body));
      return doctorsModel;
    }
    return null;
  }

  static Future<GetWorkoutTypesModel?> getWorkoutTypes({
    void Function(int)? checkResponse,
  }) async {
    GetWorkoutTypesModel getWorkoutTypesModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetWorkoutTypes,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getWorkoutTypesModel =
          GetWorkoutTypesModel.fromJson(jsonDecode(response.body));
      return getWorkoutTypesModel;
    }
    return null;
  }

  static Future<GetBodyPartsModel?> getBodyPartsApi({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetBodyPartsModel getBodyPartsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetBodyParts,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getBodyPartsModel = GetBodyPartsModel.fromJson(jsonDecode(response.body));
      return getBodyPartsModel;
    }
    return null;
  }

  static Future<DoctorsGetDoctorByIdModel?> doctorsGetDoctorById({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    DoctorsGetDoctorByIdModel doctorsGetDoctorByIdModel;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfDoctorDetail,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      doctorsGetDoctorByIdModel =
          DoctorsGetDoctorByIdModel.fromJson(jsonDecode(response.body));
      return doctorsGetDoctorByIdModel;
    }
    return null;
  }

  static Future<AvailableTestsModel?> availableTests({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AvailableTestsModel availableTestsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfAvailableTests,
      checkResponse: checkResponse,
    );
    if (response != null) {
      availableTestsModel =
          AvailableTestsModel.fromJson(jsonDecode(response.body));
      return availableTestsModel;
    }
    return null;
  }

  static Future<AvailableTestsModel?> generalAvailableTests({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    AvailableTestsModel availableTestsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGeneralAvailableTests,
      checkResponse: checkResponse,
    );
    if (response != null) {
      availableTestsModel =
          AvailableTestsModel.fromJson(jsonDecode(response.body));
      return availableTestsModel;
    }
    return null;
  }

  static Future<AvailableClinicsModel?> availableClinics({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    AvailableClinicsModel availableClinicsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfAvailableClinics,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      availableClinicsModel =
          AvailableClinicsModel.fromJson(jsonDecode(response.body));
      return availableClinicsModel;
    }
    return null;
  }

  static Future<GetPeaceCategoryModel?> getPeaceCategory({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetPeaceCategoryModel getPeaceCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetPeaceCategory,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPeaceCategoryModel =
          GetPeaceCategoryModel.fromJson(jsonDecode(response.body));
      return getPeaceCategoryModel;
    }
    return null;
  }

  static Future<GetForumCategoryModel?> getForumCategory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetForumCategoryModel getForumCategoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetForumCategory,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getForumCategoryModel =
          GetForumCategoryModel.fromJson(jsonDecode(response.body));
      return getForumCategoryModel;
    }
    return null;
  }

  static Future<GetFertilityEducationBannerModel?> getFertilityEducationBanner({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetFertilityEducationBannerModel getFertilityEducationBannerModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetFertilityEducationBanner,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getFertilityEducationBannerModel =
          GetFertilityEducationBannerModel.fromJson(jsonDecode(response.body));
      return getFertilityEducationBannerModel;
    }
    return null;
  }

  static Future<GetForumTopicModel?> getForumTopic({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetForumTopicModel getForumTopicModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetForumTopic,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getForumTopicModel =
          GetForumTopicModel.fromJson(jsonDecode(response.body));
      return getForumTopicModel;
    }
    return null;
  }

  static Future<AvailableClinicsGetAvailableClinicsByTestIdModel?>
      availableClinicsGetAvailableClinicsByTestId({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    AvailableClinicsGetAvailableClinicsByTestIdModel
        availableClinicsGetAvailableClinicsByTestIdModel;
    http.Response? response = await MyHttp.postMethod(
      url:
          ApiUrlConstants.endPointOfAvailableClinicsGetAvailableClinicsByTestId,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      availableClinicsGetAvailableClinicsByTestIdModel =
          AvailableClinicsGetAvailableClinicsByTestIdModel.fromJson(
              jsonDecode(response.body));
      return availableClinicsGetAvailableClinicsByTestIdModel;
    }
    return null;
  }

  static Future<AvailableClinicsGetAvailableClinicsByIdModel?>
      availableClinicsGetAvailableClinicsById({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    AvailableClinicsGetAvailableClinicsByIdModel
        availableClinicsGetAvailableClinicsById;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfAvailableClinicsGetAvailableClinicsById,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      availableClinicsGetAvailableClinicsById =
          AvailableClinicsGetAvailableClinicsByIdModel.fromJson(
              jsonDecode(response.body));
      return availableClinicsGetAvailableClinicsById;
    }
    return null;
  }

  static Future<http.Response?> testDataFromClinic({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfTestDataFromClinic,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<QuestionsModel?> questions({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    QuestionsModel questionsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfQuestions,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      questionsModel = QuestionsModel.fromJson(jsonDecode(response.body));
      return questionsModel;
    }
    return null;
  }

  static Future<GetPeaceSubCategoryModel?> getPeaceSubCategory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetPeaceSubCategoryModel getPeaceSubCategoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetPeaceSubCategory,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getPeaceSubCategoryModel =
          GetPeaceSubCategoryModel.fromJson(jsonDecode(response.body));
      return getPeaceSubCategoryModel;
    }
    return null;
  }

  static Future<TrainerAppointmentListModel?> getAppointment({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    TrainerAppointmentListModel? appointment;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfGetTrainerAppointment,
      // endPointUri: ApiUrlConstants.endPointOfQuestions,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      appointment =
          TrainerAppointmentListModel.fromJson(jsonDecode(response.body));
      return appointment;
    }
    return null;
  }

  static Future<http.Response?> updateBookingAppointment({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfUpdateBookingAppointment,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<DoctorsGetProfileModel?> doctorsGetProfile({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    Map<String, File>? imageMap,
  }) async {
    DoctorsGetProfileModel? doctorsGetProfileModel;
    http.Response? response = await MyHttp.postMethod(
      url: ApiUrlConstants.endPointOfDoctorsGetProfile,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      doctorsGetProfileModel =
          DoctorsGetProfileModel.fromJson(jsonDecode(response.body));
      return doctorsGetProfileModel;
    }
    return null;
  }

  static Future<http.Response?> doctorsUpdateDoctorProfile({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    Map<String, File>? imageMap,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfDoctorsUpdateDoctorProfile,
      imageMap: imageMap,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> updateUserProfile({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    Map<String, File>? imageMap,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfUpdateUserProfile,
      imageMap: imageMap,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> contactForum({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    File? image,
    String? imageKey,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfContactForum,
      image: image,
      imageKey: imageKey,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<PersonalTrainerGetPersonalTrainerCategoryModel?>
      getPersonalTrainerCategory({
    required Map<String, dynamic> queryParameters,
  }) async {
    PersonalTrainerGetPersonalTrainerCategoryModel?
        personalTrainerGetPersonalTrainerCategoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfPersonalTrainerCategories,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      personalTrainerGetPersonalTrainerCategoryModel =
          PersonalTrainerGetPersonalTrainerCategoryModel.fromJson(
              jsonDecode(response.body));
      return personalTrainerGetPersonalTrainerCategoryModel;
    }
    return null;
  }

  static Future<GetSupportivePeaceModel?> getSupportivePeace({
    required Map<String, dynamic> queryParameters,
  }) async {
    GetSupportivePeaceModel? getSupportivePeaceModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfGetSupportivePeace,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      getSupportivePeaceModel =
          GetSupportivePeaceModel.fromJson(jsonDecode(response.body));
      return getSupportivePeaceModel;
    }
    return null;
  }

  static Future<GetSupportivePeaceByIdModel?> getSupportivePeaceById({
    required Map<String, dynamic> queryParameters,
  }) async {
    GetSupportivePeaceByIdModel? getSupportivePeaceByIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfGetSupportivePeaceById,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      getSupportivePeaceByIdModel =
          GetSupportivePeaceByIdModel.fromJson(jsonDecode(response.body));
      return getSupportivePeaceByIdModel;
    }
    return null;
  }

  static Future<GetPayexBookingPaymentModel?> getPayexBookingPayment({
    required Map<String, dynamic> queryParameters,
  }) async {
    GetPayexBookingPaymentModel? getPayexBookingPaymentModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfGetPayexBookingPayment,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      getPayexBookingPaymentModel =
          GetPayexBookingPaymentModel.fromJson(jsonDecode(response.body));
      return getPayexBookingPaymentModel;
    }
    return null;
  }

  static Future<CountDoctorUpcomingAppointmentModel?>
      countDoctorUpcomingAppointment({
    required Map<String, dynamic> queryParameters,
  }) async {
    CountDoctorUpcomingAppointmentModel? countDoctorUpcomingAppointmentModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfCountDoctorUpcomingAppointment,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      countDoctorUpcomingAppointmentModel =
          CountDoctorUpcomingAppointmentModel.fromJson(
              jsonDecode(response.body));
      return countDoctorUpcomingAppointmentModel;
    }
    return null;
  }

  static Future<PersonalTrainerGetPersonalTrainerModel?>
      getPersonalTrainerList({
    required Map<String, dynamic> queryParameters,
  }) async {
    PersonalTrainerGetPersonalTrainerModel?
        personalTrainerGetPersonalTrainerModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfPersonalTrainerList,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      personalTrainerGetPersonalTrainerModel =
          PersonalTrainerGetPersonalTrainerModel.fromJson(
              jsonDecode(response.body));
      return personalTrainerGetPersonalTrainerModel;
    }
    return null;
  }

  static Future<GetExpertConsultationDoctorsDetailsModel?>
      getExpertConsultationDoctorsDetails({
    required Map<String, dynamic> queryParameters,
  }) async {
    GetExpertConsultationDoctorsDetailsModel?
        getExpertConsultationDoctorsDetailsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri:
          ApiUrlConstants.endPointOfGetExpertConsultationDoctorsDetails,
    );
    if (response != null) {
      getExpertConsultationDoctorsDetailsModel =
          GetExpertConsultationDoctorsDetailsModel.fromJson(
              jsonDecode(response.body));
      return getExpertConsultationDoctorsDetailsModel;
    }
    return null;
  }

  static Future<BlogCategoryModel?> getBlogCategory() async {
    BlogCategoryModel? blogCategorylist;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetBlogCategory,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      blogCategorylist = BlogCategoryModel.fromJson(jsonDecode(response.body));
      return blogCategorylist;
    }
    return null;
  }

  static Future<GetFindCoachCategoryModel?> getFindCoachCategory() async {
    GetFindCoachCategoryModel? getFindCoachCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetFindCoachCategory,
    );
    if (response != null) {
      getFindCoachCategoryModel =
          GetFindCoachCategoryModel.fromJson(jsonDecode(response.body));
      return getFindCoachCategoryModel;
    }
    return null;
  }

  static Future<GetPersonalTrainerDetailsModel?> getPersonalTrainerDetails(
      {required Map<String, dynamic> queryParameters}) async {
    GetPersonalTrainerDetailsModel? getPersonalTrainerDetailsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfGetPersonalTrainerDetails,
    );
    if (response != null) {
      getPersonalTrainerDetailsModel =
          GetPersonalTrainerDetailsModel.fromJson(jsonDecode(response.body));
      return getPersonalTrainerDetailsModel;
    }
    return null;
  }

  static Future<GetDoctorAppointmentDetailsModel?> getDoctorAppointmentDetails(
      {required Map<String, dynamic> queryParameters}) async {
    GetDoctorAppointmentDetailsModel? getDoctorAppointmentDetailsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfGetDoctorAppointmentDetails,
    );
    if (response != null) {
      getDoctorAppointmentDetailsModel =
          GetDoctorAppointmentDetailsModel.fromJson(jsonDecode(response.body));
      return getDoctorAppointmentDetailsModel;
    }
    return null;
  }

  static Future<GetClinicNotificationModel?> getClinicNotification(
      {required Map<String, dynamic> queryParameters}) async {
    GetClinicNotificationModel? getClinicNotificationModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfGetClinicNotification,
    );
    if (response != null) {
      getClinicNotificationModel =
          GetClinicNotificationModel.fromJson(jsonDecode(response.body));
      return getClinicNotificationModel;
    }
    return null;
  }

  static Future<GetClinicNotificationDetailsModel?>
      getClinicNotificationDetails(
          {required Map<String, dynamic> queryParameters}) async {
    GetClinicNotificationDetailsModel? getClinicNotificationDetailsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfGetClinicNotificationDetails,
    );
    if (response != null) {
      getClinicNotificationDetailsModel =
          GetClinicNotificationDetailsModel.fromJson(jsonDecode(response.body));
      return getClinicNotificationDetailsModel;
    }
    return null;
  }

  static Future<ZenBookLocationCategoryGetZenBookLocationCategoryModel?>
      zenBookLocationCategoryGetZenBookLocationCategory() async {
    ZenBookLocationCategoryGetZenBookLocationCategoryModel?
        zenBookLocationCategoryGetZenBookLocationCategoryModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants
          .endPointOfZenBookLocationCategoryGetZenBookLocationCategory,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      zenBookLocationCategoryGetZenBookLocationCategoryModel =
          ZenBookLocationCategoryGetZenBookLocationCategoryModel.fromJson(
              jsonDecode(response.body));
      return zenBookLocationCategoryGetZenBookLocationCategoryModel;
    }
    return null;
  }

  static Future<BlogByCategoryModel?> getBlogCategorywise({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    BlogByCategoryModel blogByCategory;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetBlogByCategory,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      blogByCategory = BlogByCategoryModel.fromJson(jsonDecode(response.body));
      return blogByCategory;
    }
    return null;
  }

  static Future<GetFertilityWebinarsBlogsByCategoryModel?>
      getFertilityWebinarsBlogsByCategory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetFertilityWebinarsBlogsByCategoryModel
        getFertilityWebinarsBlogsByCategoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri:
          ApiUrlConstants.endPointOfGetFertilityWebinarsBlogsByCategory,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getFertilityWebinarsBlogsByCategoryModel =
          GetFertilityWebinarsBlogsByCategoryModel.fromJson(
              jsonDecode(response.body));
      return getFertilityWebinarsBlogsByCategoryModel;
    }
    return null;
  }

  static Future<GetFertilityWebinarsDetailsModel?> getFertilityWebinarsDetails({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetFertilityWebinarsDetailsModel getFertilityWebinarsDetailsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetFertilityWebinarsDetails,
      checkResponse: checkResponse,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getFertilityWebinarsDetailsModel =
          GetFertilityWebinarsDetailsModel.fromJson(jsonDecode(response.body));
      return getFertilityWebinarsDetailsModel;
    }
    return null;
  }

  static Future<GetFertilityEducationsBlogsDetailsModel?>
      getFertilityEducationsBlogsDetails({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetFertilityEducationsBlogsDetailsModel
        getFertilityEducationsBlogsDetailsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants
          .endPointOfFertilityEducationsGetFertilityEducationsBlogsDetails,
      checkResponse: checkResponse,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getFertilityEducationsBlogsDetailsModel =
          GetFertilityEducationsBlogsDetailsModel.fromJson(
              jsonDecode(response.body));
      return getFertilityEducationsBlogsDetailsModel;
    }
    return null;
  }

  static Future<BlogByCategoryModel?> GetBlogPopular() async {
    BlogByCategoryModel? blogCategorylist;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetBlogPopular,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      blogCategorylist =
          BlogByCategoryModel.fromJson(jsonDecode(response.body));
      return blogCategorylist;
    }
    return null;
  }

  static Future<BlogByCategoryModel?> GetBlogFeatured() async {
    BlogByCategoryModel? blogCategorylist;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetBlogFeatured,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      blogCategorylist =
          BlogByCategoryModel.fromJson(jsonDecode(response.body));
      return blogCategorylist;
    }
    return null;
  }

  static Future<GetFertilityEducationsFeaturedWebinarsModel?>
      getFertilityEducationsFeaturedWebinars() async {
    GetFertilityEducationsFeaturedWebinarsModel?
        getFertilityEducationsFeaturedWebinarsModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetFertilityEducationsFeaturedWebinars,
    );
    if (response != null) {
      getFertilityEducationsFeaturedWebinarsModel =
          GetFertilityEducationsFeaturedWebinarsModel.fromJson(
              jsonDecode(response.body));
      return getFertilityEducationsFeaturedWebinarsModel;
    }
    return null;
  }

  static Future<GetFertilityEducationsSavedBlogModel?> getBlogSaved({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetFertilityEducationsSavedBlogModel? getFertilityEducationsSavedBlogModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetBlogSaved,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getFertilityEducationsSavedBlogModel =
          GetFertilityEducationsSavedBlogModel.fromJson(
              jsonDecode(response.body));
      return getFertilityEducationsSavedBlogModel;
    }
    return null;
  }

  static Future<GetFertilityEducationsFeaturedSavedWebinarsModel?>
      getFertilityEducationsFeaturedSavedWebinars({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetFertilityEducationsFeaturedSavedWebinarsModel?
        getFertilityEducationsFeaturedSavedWebinarsModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri:
          ApiUrlConstants.endPointOfGetFertilityEducationsFeaturedSavedWebinars,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getFertilityEducationsFeaturedSavedWebinarsModel =
          GetFertilityEducationsFeaturedSavedWebinarsModel.fromJson(
              jsonDecode(response.body));
      return getFertilityEducationsFeaturedSavedWebinarsModel;
    }
    return null;
  }

  static Future<SpermBannerModel?> GetSpermBanner() async {
    SpermBannerModel? SpermBannerlist;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetSpermBanner,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      SpermBannerlist = SpermBannerModel.fromJson(jsonDecode(response.body));
      return SpermBannerlist;
    }
    return null;
  }

  static Future<GetHomeBannerModel?> getHomeBanner() async {
    GetHomeBannerModel? getHomeBannerModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetHomeBanner,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      getHomeBannerModel =
          GetHomeBannerModel.fromJson(jsonDecode(response.body));
      return getHomeBannerModel;
    }
    return null;
  }

  static Future<GetFertilityWebinarsBannerModel?>
      getFertilityWebinarsBanner() async {
    GetFertilityWebinarsBannerModel? getFertilityWebinarsBannerModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetFertilityWebinarsBanner,
    );
    if (response != null) {
      getFertilityWebinarsBannerModel =
          GetFertilityWebinarsBannerModel.fromJson(jsonDecode(response.body));
      return getFertilityWebinarsBannerModel;
    }
    return null;
  }

  static Future<SpermAssessmentModel?> GetSpermAssessment() async {
    SpermAssessmentModel? Spermassessmentlist;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetSpermAssessment,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      Spermassessmentlist =
          SpermAssessmentModel.fromJson(jsonDecode(response.body));
      return Spermassessmentlist;
    }
    return null;
  }

  static Future<GetFindCoachModel?> getFindCoach() async {
    GetFindCoachModel? getFindCoachModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetFindCoach,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      getFindCoachModel = GetFindCoachModel.fromJson(jsonDecode(response.body));
      return getFindCoachModel;
    }
    return null;
  }

  static Future<ClinicDetailByClinicIdModel?> GetClinicDetailById({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    ClinicDetailByClinicIdModel? clinicDetail;
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfEetClinicDetailById,
        bodyParams: bodyParams
        // baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
        // endPointUri: ApiUrlConstants.endPointOfEetClinicDetailById,
        // checkResponse: checkResponse,
        // queryParameters: bodyParams,
        );
    if (response != null) {
      clinicDetail =
          ClinicDetailByClinicIdModel.fromJson(jsonDecode(response.body));
      return clinicDetail;
    }
    return null;
  }

  static Future<http.Response?> addDeleteFertilityBlogEducation({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfAddDeleteFertilityBlogEducation,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<TvsClinicList?> GetScanClinicList() async {
    TvsClinicList? tvsClinicList;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetScanClinicList,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      tvsClinicList = TvsClinicList.fromJson(jsonDecode(response.body));
      return tvsClinicList;
    }
    return null;
  }

  static Future<GetLatestQuestionModel?> getLatestQuestion() async {
    GetLatestQuestionModel? getLatestQuestionModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetLatestQuestion,
    );
    if (response != null) {
      getLatestQuestionModel =
          GetLatestQuestionModel.fromJson(jsonDecode(response.body));
      return getLatestQuestionModel;
    }
    return null;
  }

  static Future<AvailableClinicsGetClinicDetailByIdModel?> getTvsClinicDetail({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    AvailableClinicsGetClinicDetailByIdModel
        availableClinicsGetClinicDetailByIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetTVSClinicDetail,
      queryParameters: bodyParams,
    );
    if (response != null) {
      availableClinicsGetClinicDetailByIdModel =
          AvailableClinicsGetClinicDetailByIdModel.fromJson(
              jsonDecode(response.body));
      return availableClinicsGetClinicDetailByIdModel;
    }
    return null;
  }

  static Future<GetForumDiscussionModel?> getForumDiscussion({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetForumDiscussionModel getForumDiscussionModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetForumDiscussion,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getForumDiscussionModel =
          GetForumDiscussionModel.fromJson(jsonDecode(response.body));
      return getForumDiscussionModel;
    }
    return null;
  }

  static Future<GetLatestQuestionModel?> getForumQuestion({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetLatestQuestionModel getLatestQuestionModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetForumQuestion,
      queryParameters: bodyParams,
    );
    if (response != null) {
      getLatestQuestionModel =
          GetLatestQuestionModel.fromJson(jsonDecode(response.body));
      return getLatestQuestionModel;
    }
    return null;
  }

  static Future<AppointmentModel?> getTVSBookingAppointment({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    AppointmentModel availableClinicsGetClinicDetailByIdModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetTVSBookingAppointment,
      queryParameters: bodyParams,
    );
    if (response != null) {
      availableClinicsGetClinicDetailByIdModel =
          AppointmentModel.fromJson(jsonDecode(response.body));
      return availableClinicsGetClinicDetailByIdModel;
    }
    return null;
  }

  static Future<SleepManagementZenBookGetZenBookNearestProvidersModel?>
      sleepManagementZenBookGetZenBookNearestProviders({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    SleepManagementZenBookGetZenBookNearestProvidersModel
        sleepManagementZenBookGetZenBookNearestProvidersModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants
          .endPointOfSleepManagementZenBookGetZenBookNearestProviders,
      queryParameters: bodyParams,
    );
    if (response != null) {
      sleepManagementZenBookGetZenBookNearestProvidersModel =
          SleepManagementZenBookGetZenBookNearestProvidersModel.fromJson(
              jsonDecode(response.body));
      return sleepManagementZenBookGetZenBookNearestProvidersModel;
    }
    return null;
  }

  static Future<GetUpcomingBookingAppointmentModel?>
      getUpcomingBookingAppointment({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    GetUpcomingBookingAppointmentModel getUpcomingBookingAppointmentModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetUpcomingBookingAppointment,
      queryParameters: queryParameters,
    );
    if (response != null) {
      getUpcomingBookingAppointmentModel =
          GetUpcomingBookingAppointmentModel.fromJson(
              jsonDecode(response.body));
      return getUpcomingBookingAppointmentModel;
    }
    return null;
  }

  static Future<BookingDataModel?> booking({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    BookingDataModel? bookingDataModel;
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfBooking, bodyParams: bodyParams);
    if (response != null) {
      bookingDataModel = BookingDataModel.fromJson(jsonDecode(response.body));
      return bookingDataModel;
    }
    return null;
  }

  static Future<GetPaymentTokenModel?> getPaymentToken({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetPaymentTokenModel? getPaymentTokenModel;
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfGetPaymentToken, bodyParams: bodyParams);
    if (response != null) {
      getPaymentTokenModel =
          GetPaymentTokenModel.fromJson(jsonDecode(response.body));
      return getPaymentTokenModel;
    }
    return null;
  }

  static Future<PayexPaymentModel?> payexPayment({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    PayexPaymentModel? payexPaymentModel;
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfPayexPayment, bodyParams: bodyParams);
    if (response != null) {
      payexPaymentModel = PayexPaymentModel.fromJson(jsonDecode(response.body));
      return payexPaymentModel;
    }
    return null;
  }

  static Future<http.Response?> addDoctorAvailability({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfAddDoctorAvailability,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<UpdatePayexBookingPaymentModel?> updatePayexBookingPayment({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    UpdatePayexBookingPaymentModel? updatePayexBookingPaymentModel;
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfUpdatePayexBookingPayment,
        bodyParams: bodyParams);
    if (response != null) {
      updatePayexBookingPaymentModel =
          UpdatePayexBookingPaymentModel.fromJson(jsonDecode(response.body));
      return updatePayexBookingPaymentModel;
    }
    return null;
  }

  static Future<http.Response?> cycleTrackingAddCycleData({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfGetCycleTrackingAddCycleData,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> cycleTrackingAddTemperature({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfGetCycleTrackingAddTemperature,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> cycleTrackingDeleteTemperature({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfGetCycleTrackingDeleteTemperature,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> cycleTrackingAddUltraSoundImage({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    Map<String, File>? imageMap,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfCycleTrackingAddUltraSoundImage,
      imageMap: imageMap,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> cycleTrackingUpdateUltraSoundImage({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    Map<String, File>? imageMap,
  }) async {
    http.Response? response = await MyHttp.multipart(
        url: ApiUrlConstants.endPointOfCycleTrackingUpdateUltraSoundImage,
        imageMap: imageMap,
        checkResponse: checkResponse,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<UltrasoundImageHistoryModel?>
      getCycleTrackingUltrasoundImageHistory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    UltrasoundImageHistoryModel ultrasoundImageHistoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri:
          ApiUrlConstants.endPointOfGetCyclerTrackingUltrasoundImageData,
      queryParameters: queryParameters,
    );
    if (response != null) {
      ultrasoundImageHistoryModel =
          UltrasoundImageHistoryModel.fromJson(jsonDecode(response.body));
      return ultrasoundImageHistoryModel;
    }
    return null;
  }

  static Future<TemperatureHistoryModel?> getCycleTrackingTemperatureHistory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    TemperatureHistoryModel temperatureHistoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfGetCyclerTrackingTemperatureData,
      queryParameters: queryParameters,
    );
    if (response != null) {
      temperatureHistoryModel =
          TemperatureHistoryModel.fromJson(jsonDecode(response.body));
      return temperatureHistoryModel;
    }
    return null;
  }

  static Future<GetCycleTrackingDataModel?> getCycleTrackingDataHistory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetCycleTrackingDataModel getCycleTrackingDataModel;
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfGetCyclerTrackingData,
        bodyParams: bodyParams);
    if (response != null) {
      getCycleTrackingDataModel =
          GetCycleTrackingDataModel.fromJson(jsonDecode(response.body));
      return getCycleTrackingDataModel;
    }
    return null;
  }

  static Future<http.Response?> cycleTrackingAddSymptomTracker({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfCycleTrackingAddSymptomsTracker,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> cycleTrackingAddCervicalMucusEgg({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfCycleTrackingAddCervicalMucus,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<GetCervicalMucusHistoryModel?>
      getCycleTrackingAddCervicalMucusEggHistory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    GetCervicalMucusHistoryModel getCervicalMucusHistoryModel;
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfCycleTrackingGetCervicalMucusHistory,
        bodyParams: bodyParams);
    if (response != null) {
      getCervicalMucusHistoryModel =
          GetCervicalMucusHistoryModel.fromJson(jsonDecode(response.body));
      return getCervicalMucusHistoryModel;
    }
    return null;
  }

  static Future<PeriodSymtomsHistoryModel?>
      getCycleTrackingPeriodSymptomHistory({
    void Function(int)? checkResponse,
    required Map<String, dynamic> queryParameters,
  }) async {
    PeriodSymtomsHistoryModel periodSymtomsHistoryModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri:
          ApiUrlConstants.endPointOfGetCycleTrackingSymptomsTrackerHistory,
      queryParameters: queryParameters,
    );
    if (response != null) {
      periodSymtomsHistoryModel =
          PeriodSymtomsHistoryModel.fromJson(jsonDecode(response.body));
      return periodSymtomsHistoryModel;
    }
    return null;
  }

  static Future<GetMaleFertilityQuizModel?> getMaleFertilityQuiz({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetMaleFertilityQuizModel getMaleFertilityQuizModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetMaleFertilityQuiz,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getMaleFertilityQuizModel =
          GetMaleFertilityQuizModel.fromJson(jsonDecode(response.body));
      return getMaleFertilityQuizModel;
    }
    return null;
  }

  static Future<GetMaleFertilityQuizRangeModel?> getPrediabetesAssessmentRange({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetMaleFertilityQuizRangeModel getMaleFertilityQuizRangeModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetPrediabetesAssessmentRange,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getMaleFertilityQuizRangeModel =
          GetMaleFertilityQuizRangeModel.fromJson(jsonDecode(response.body));
      return getMaleFertilityQuizRangeModel;
    }
    return null;
  }

  static Future<GetPrediabetesAssessmentQuestionModel?>
      getPrediabetesAssessmentQuestion({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetPrediabetesAssessmentQuestionModel getPrediabetesAssessmentQuestionModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetPrediabetesAssessmentQuestion,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPrediabetesAssessmentQuestionModel =
          GetPrediabetesAssessmentQuestionModel.fromJson(
              jsonDecode(response.body));
      return getPrediabetesAssessmentQuestionModel;
    }
    return null;
  }

  static Future<GetMaleFertilityQuizRangeModel?> getMenopauseAssessmentRange({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetMaleFertilityQuizRangeModel getMaleFertilityQuizRangeModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetMenopauseAssessmentRange,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getMaleFertilityQuizRangeModel =
          GetMaleFertilityQuizRangeModel.fromJson(jsonDecode(response.body));
      return getMaleFertilityQuizRangeModel;
    }
    return null;
  }

  static Future<GetMenopauseAssessmentQuestionModel?>
      getMenopauseAssessmentQuestion({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetMenopauseAssessmentQuestionModel getMenopauseAssessmentQuestionModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetMenopauseAssessmentQuestion,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getMenopauseAssessmentQuestionModel =
          GetMenopauseAssessmentQuestionModel.fromJson(
              jsonDecode(response.body));
      return getMenopauseAssessmentQuestionModel;
    }
    return null;
  }

  static Future<GetPcosAssessmentQuestionModel?> getPcosAssessmentQuestion({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetPcosAssessmentQuestionModel getPcosAssessmentQuestionModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetPcosAssessmentQuestion,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getPcosAssessmentQuestionModel =
          GetPcosAssessmentQuestionModel.fromJson(jsonDecode(response.body));
      return getPcosAssessmentQuestionModel;
    }
    return null;
  }

  static Future<GetMaleFertilityQuizRangeModel?> getMaleFertilityQuizRange({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    GetMaleFertilityQuizRangeModel getMaleFertilityQuizRangeModel;
    http.Response? response = await MyHttp.getMethod(
      url: ApiUrlConstants.endPointOfGetMaleFertilityQuizRange,
      checkResponse: checkResponse,
    );
    if (response != null) {
      getMaleFertilityQuizRangeModel =
          GetMaleFertilityQuizRangeModel.fromJson(jsonDecode(response.body));
      return getMaleFertilityQuizRangeModel;
    }
    return null;
  }

  static Future<http.Response?> addForumQuestion({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    File? image,
    String? imageKey,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfAddForumQuestion,
      image: image,
      imageKey: imageKey,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> deleteForumQuestion({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    File? image,
    String? imageKey,
  }) async {
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      endPointUri: ApiUrlConstants.endPointOfDeleteForumQuestion,
      queryParameters: bodyParams,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> addForumQuestionAnswer({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    File? image,
    String? imageKey,
  }) async {
    http.Response? response = await MyHttp.multipart(
      url: ApiUrlConstants.endPointOfAddForumQuestionAnswer,
      image: image,
      imageKey: imageKey,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<GetForumQuestionAnswerModel?> getForumQuestionAnswer({
    required Map<String, dynamic> queryParameters,
  }) async {
    GetForumQuestionAnswerModel? getForumQuestionAnswerModel;
    http.Response? response = await MyHttp.getMethodParams(
      baseUri: ApiUrlConstants.baseUrlForGetMethodParams,
      queryParameters: queryParameters,
      endPointUri: ApiUrlConstants.endPointOfGetForumQuestionAnswer,
      // checkResponse: checkResponse,
    );
    if (response != null) {
      getForumQuestionAnswerModel =
          GetForumQuestionAnswerModel.fromJson(jsonDecode(response.body));
      return getForumQuestionAnswerModel;
    }
    return null;
  }

  static Future<http.Response?> cycleTrackingDeleteSymtomTracker({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfGetCycleTrackingDeleteSymtomPeriod,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> cycleTrackingDeleteCervicalMucusEgg({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfGetCycleTrackingDeleteCervicalMucus,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<QuizResultModel?> quizResult({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    QuizResultModel? quizResultModel;
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfQuizResult, bodyParams: bodyParams);
    if (response != null) {
      quizResultModel = QuizResultModel.fromJson(jsonDecode(response.body));
      return quizResultModel;
    }
    return null;
  }

  static Future<http.Response?> checkSocialMediaRegistered({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethodSocial(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSocialMediaRegistered,
      checkResponse: checkResponse,
    );
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<UserModel?> socialLogin({
    void Function(int)? checkResponse,
    Map<String, dynamic>? bodyParams,
  }) async {
    UserModel userModel;
    http.Response? response = await MyHttp.postMethodSocial(
      bodyParams: bodyParams,
      url: ApiUrlConstants.endPointOfSocialLogin,
      checkResponse: checkResponse,
    );
    if (response != null) {
      userModel = UserModel.fromJson(jsonDecode(response.body));
      return userModel;
    }
    return null;
  }

  static Future<http.Response?> saveHealthAssessment({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfSaveHealthAssessment,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }

  static Future<http.Response?> sendHealthAssessmentReport({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
    File? image,
    String? imageKey,
  }) async {
    http.Response? response = await MyHttp.multipart(
      imageKey: imageKey,
      image: image,
      url: ApiUrlConstants.endPointOfSaveHealthRecord,
      checkResponse: checkResponse,
      bodyParams: bodyParams,
    );
    if (response != null) {
      print('response ${response.body}');
      return response;
    }
    return null;
  }

  static Future<http.Response?> saveFCMToken({
    void Function(int)? checkResponse,
    required Map<String, dynamic> bodyParams,
  }) async {
    http.Response? response = await MyHttp.postMethod(
        url: ApiUrlConstants.endPointOfSaveFCMToken,
        bodyParams: bodyParams);
    if (response != null) {
      return response;
    }
    return null;
  }
}
