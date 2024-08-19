class ApiUrlConstants {
  static const String baseUrlMain = 'https://fertilemate.com';
  static const String baseUrl = '$baseUrlMain/api/';
  static const String baseUrlForGetMethodParams =
       'fertilemate.com';
  static const String endPointOfRegister = '${baseUrl}register';
  static const String endPointOfLogin = '${baseUrl}login';
  static const String endPointOfAddress = '${baseUrl}address';
  static const String endPointOfPasswordReset = '${baseUrl}password_reset';
  static const String endPointOfCheckOtp = '${baseUrl}check_otp';
  static const String endPointOfAddCarts = '${baseUrl}carts';
  static const String endPointOfDeleteCartById =
      '${baseUrl}carts/delete-cart-by-id';
  static const String endPointOfUpdateCartById =
      '${baseUrl}carts/update-cart-by-id';
  static const String endPointOfChangePassword = '${baseUrl}change_password';
  static const String endPointOfCreateNewPassword =
      '${baseUrl}create_new_password';
  static const String endPointOfMainCategories = '${baseUrl}main-categories';
  static const String endPointOfProductsById = '/api/products-by-id';
  static const String endPointOfCategoriesByMainCategoryId =
      '/api/categories-by-main-category-id';
  static const String endPointOfSubCategoriesByCategoryId =
      '/api/sub-categories-by-category-id';
  static const String endPointOfGetSupportiveCommunityDetails =
      '/api/SupportiveCommunity/get-supportive-community-details';
  static const String endPointOfGuidesGetGuidBySubCategorieId =
      '${baseUrl}guides/get-guid-by-sub-categorie-id';
  static const String endPointOfDoctorsBookingExtraBookingAdd =
      '${baseUrl}doctors/booking/extra-booking-add';
  static const String endPointOfGuidesUploadMenuByGuideId =
      '${baseUrl}guides/upload-menu-by-guide-id';
  static const String endPointOfGuidesGetMenuByGuideId =
      '${baseUrl}guides/get-menu-by-guide-id';
  static const String endPointOfGuidesGetMenuByAdmin =
      '${baseUrl}guides/get_menu_by_admin';
  static const String endPointOfGetEbookCategory =
      '${baseUrl}EbookCategory/get-ebook-category';
  static const String endPointOfGetSonographyUltrasounds =
      '${baseUrl}get-sonography-ultrasounds';
  static const String endPointOfUploadSonographyUltrasounds =
      '${baseUrl}upload-sonography-ultrasounds';
  static const String endPointOfGetWorkout = '/api/get-workout';
  static const String endPointOfGetWorkoutWeek = '/api/get-workout-week';
  static const String endPointOfGetSingleVideo =
      '/api/sleep-management/get-single-video';
  static const String endPointOfIntimacySubCategoryGetIntimacySubcategory =
      '/api/IntimacysubCategory/get-intimacy-subcategory';
  static const String
      endPointOfExpertConsultationGetExpertConsultationDoctorsByCategories =
      '/api/expert-consultation/get-expert-consultation-doctors-by-categories';
  static const String endPointOfLoveSubLanguageGetLoveSubLanguage =
      '/api/LovesubLanguage/get-love-sublanguage';
  static const String endPointOfProductsByCategoryId =
      '/api/products-by-category-id';
  static const String endPointOfGetWorkoutBlogByWorkoutWeekId =
      '/api/get-workout-blog-by-workout-week-id';
  static const String endPointOfGetSupplimentPlan =
      '/api/get-suppliment-plan';
  static const String
      endPointOfNutritionalGuidanceGetNutritionalGuidanceBlogBySubCategorieId =
      '/api/nutritional-guidance/get-nutritional-guidance-blog-by-sub-categorie-id';
  static const String endPointOfAddressByUserId =
      '/api/address-by-user-id';
  static const String endPointOfCarts = '/api/carts';
  static const String endPointOfCycleTrackingOption =
      '/api/cycle-tracking-option';
  static const String endPointOfCycleTrackingSubOption =
      '/api/cycle-tracking-sub-option';
  static const String endPointOfChats = '${baseUrl}chats';
  static const String endPointOfGetInsights = '${baseUrl}get-insights';
  static const String endPointOfDoctors = '${baseUrl}doctors';
  static const String endPointOfGetWorkoutTypes = '${baseUrl}get-workout-types';
  static const String endPointOfGetBodyParts = '/api/get-body-parts';
  static const String endPointOfChatsChatBetweenUser =
      '${baseUrl}chats/chat-between-user';
  static const String endPointOfGetChat = '${baseUrl}get_chat';
  static const String endPointOfInsertChats = '${baseUrl}chats';
  static const String endPointOfInsertChat = '${baseUrl}insert_chat';
  static const String endPointOfPosts = '/api/posts';
  static const String endPointOfGetHealthRecord = '/api/get_health_record';
  static const String endPointOfGetProfile = '/api/get_profile';
  static const String endPointOfQuestions = '/api/questions';
  static const String endPointOfAvailableClinicsGetAvailableClinicsById =
      '${baseUrl}available-clinics/get-available-clinics-by-id';
  static const String endPointOfTestDataFromClinic =
      '${baseUrl}test-data-from-clinic';
  static const String endPointOfAvailableClinicsGetAvailableClinicsByTestId =
      '${baseUrl}available-clinics/get-available-clinics-by-test-id';
  static const String endPointOfAddRates = '${baseUrl}add_rates';
  static const String endPointOfDeleteAccount =
      '${baseUrl}doctors/delete-account';
  static const String endPointOfAvailableTests = '${baseUrl}available-tests';
  static const String endPointOfGeneralAvailableTests =
      '${baseUrl}general-available-tests';
  static const String endPointOfAvailableClinics =
      '/api/available-clinics';

  static const String endPointOfSleepManagementGetSleepManagementCategories =
      '${baseUrl}sleep-management/get-sleep-management-categories';
  static const String
      endPointOfSleepManagementIntimacyManagementGetIntimacyManagementCategories =
      '${baseUrl}sleep-management/intimacy-management/get-intimacy-management-categories';
  static const String endPointOfSleepManagementGetSleepManagementSoundTracks =
      '${baseUrl}sleep-management/get-sleep-management-sound-tracks';
  static const String endPointOfSleepManagementZenBookGetZenBookPackages =
      '${baseUrl}sleep-management/zen-book/get-zen-book-packages';
  static const String
      endPointOfExpertConsultationGetExpertConsultationCategories =
      '${baseUrl}expert-consultation/get-expert-consultation-categories';
  static const String endPointOfFertilityEducationsAddFertilityReport =
      '${baseUrl}fertility-educations/add-fertility-report';
  static const String endPointOfFertilityEducationsGetFertilityReport =
      '${baseUrl}fertility-educations/get-fertility-report';
  static const String endPointOfIntimacyGetIntimacyInsights =
      '${baseUrl}intimacy/get-intimacy-insights';
  static const String endPointOfIntimacyCategoryGetIntimacyCategory =
      '${baseUrl}IntimacyCategory/get-intimacy-category';
  static const String endPointOfGetTrainerTypeList =
      '${baseUrl}tvsscan/get-trainer-type-list';
  static const String endPointOfIntimacyGameCategoryGetIntimacyGameCategory =
      '${baseUrl}IntimacygameCategory/get-intimacy-gamecategory';
  static const String endPointOfIntimacyGameGetIntimacyGame =
      '${baseUrl}IntimacyGame/get-intimacy-game';
  static const String endPointOfLoveLanguageGetLoveLanguage =
      '${baseUrl}LoveLanguage/get-love-language';
  static const String endPointOfRomanticSpotCategoryGetRomanticSpotCategory =
      '${baseUrl}RomanticspotCategory/get-romantic-spotcategory';
  static const String
      endPointOfSleepManagementIntimacyManagementGetRecommendationBlogs =
      '${baseUrl}sleep-management/intimacy-management/get-recommendation-blogs';
  static const String endPointOfSleepManagementGetDiscoverFilters =
      '${baseUrl}sleep-management/get-discover-filters';
  static const String endPointOfSleepManagementGetSoundtrackCategories =
      '${baseUrl}sleep-management/get-soundtrack-categories';
  static const String endPointOfSleepManagementGetRecommendedSoundtracks =
      '${baseUrl}sleep-management/get-recommended-soundtracks';
  static const String endPointOfRomanticSpotGetRomanticSpot =
      '/api/RomanticSpot/get-romantic-spot';
  static const String endPointOfGetEBookByCategory =
      '/api/EbookCategory/get-ebook-by-category';
  static const String endPointOfGetSaveIntimacyManagementBlogs =
      '/api/sleep-management/intimacy-management/get-save-intimacy-management-blogs';
  static const String endPointOfPersonalTrainerGetTrainerCategory =
      '${baseUrl}personal-trainer/get-trainer-category';
  static const String endPointOfPrivacyPolicy = '${baseUrl}privacy_policy';
  static const String endPointOfTermsAndConditions =
      '${baseUrl}terms_and_conditions';
  static const String endPointOfGetSupportiveCommunity =
      '${baseUrl}SupportiveCommunity/get-supportive-community';
  static const String endPointOfGetPrediabetesAssessmentQuestion =
      '${baseUrl}get_prediabetes_assessment_question';
  static const String endPointOfGetMaleFertilityQuiz =
      '${baseUrl}get_male_fertility_quiz';
  static const String endPointOfGetMaleFertilityQuizRange =
      '${baseUrl}get_male_fertility_quiz_range';
  static const String endPointOfGetPrediabetesAssessmentRange =
      '${baseUrl}get_prediabetes_assessment_range';
  static const String endPointOfGetMenopauseAssessmentQuestion =
      '${baseUrl}get_menopause_assessment_question';
  static const String endPointOfGetMenopauseAssessmentRange =
      '${baseUrl}get_menopause_assessment_range';
  static const String endPointOfGetPcosAssessmentQuestion =
      '${baseUrl}get_quiz_pcos_type_question'; /*
  static const String endPointOfGetMaleQuizRange =
      '${baseUrl}get_male_fertility_quiz_range';*/
  static const String endPointOfGetNextVideoListDiscover =
      '/api/sleep-management/get-next-video-list-discover';
  static const String
      endPointOfSleepManagementGetSleepManagementSoundTracksById =
      '/api/sleep-management/get-sleep-management-sound-tracks-by-id';
  static const String endPointOfGetDoctorUpcomingAppointment =
      '/api/GetbookingAppointment/get-doctor-upcoming-appointment';
  static const String endPointOfGetDoctorAvailability =
      '/api/GetbookingAppointment/get_doctor_availability';
  static const String endPointOfEditDoctorAvailability =
      '/api/GetbookingAppointment/edit_doctor_availability';
  static const String endPointOfSaveIntimacyManagementBlogs =
      '/api/sleep-management/intimacy-management/save-intimacy-management-blogs';
  static const String endPointOfSaveIntimacySubcategory =
      '/api/IntimacysubCategory/save-intimacy-subcategory';
  static const String
      endPointOfSleepManagementFavoritesSleepManagementSoundTrackAddFavourites =
      '/api/sleep-management/favorites/sleep-management-sound-track-add-favourites';
  static const String endPointOfSleepManagementZenBookGetZenBookProvidersById =
      '/api/sleep-management/zen-book/get-zen-book-providers-by-id';
  static const String endPointOfSleepManagementZenBookGetZenBookAddBookings =
      '/api/sleep-management/zen-book/get-zen-book-add-bookings';
  static const String
      endPointOfSleepManagementIntimacyManagementGetIntimacyManagementCategoriesBlogs =
      '/api/sleep-management/intimacy-management/get-intimacy-management-categories-blogs';
  static const String endPointOfFertilityEducationsGetFertilityTestKit =
      '/api/fertility-educations/get-fertility-test-kit';
  static const String endPointOfPersonalTrainerCategories =
      '/api/personal-trainer/get-personal-trainer-category';
  static const String endPointOfGetForumQuestionAnswer =
      '/api/get_forum_question_answer';
  static const String endPointOfPersonalTrainerList =
      '/api/personal-trainer/get-personal-trainer';
  static const String endPointOfDoctorDetail =
      '${baseUrl}doctors/get-doctor-by-id';
  static const String endPointOfGetExpertConsultationDoctorsDetails =
      '/api/expert-consultation/get-expert-consultation-doctors-details';
  static const String endPointOfGetTrainerAppointment =
      '${baseUrl}doctors/booking/get-extra-booking-by-doctors-id';
  static const String endPointOfUpdateBookingAppointment =
      '${baseUrl}bookingAppointment/update-booking-appointment';
  static const String endPointOfDoctorsGetProfile =
      '${baseUrl}doctors/get-profile';
  static const String endPointOfDoctorsUpdateDoctorProfile =
      '${baseUrl}doctors/update-doctor-profile';
  static const String endPointOfUpdateUserProfile =
      '${baseUrl}doctors/update-user-profile';
  static const String endPointOfGetBlogCategory =
      '${baseUrl}fertility-educations/get-fertility-educations-category';
  static const String endPointOfGetFindCoachCategory =
      '${baseUrl}expert-consultation/get-find-coach-category';
  static const String endPointOfGetPersonalTrainerDetails =
      '/api/personal-trainer/get-personal-trainer-details';
  static const String endPointOfGetClinicNotification =
      '/api/ClinicNotification/get-clinic-notification';
  static const String endPointOfGetClinicNotificationDetails =
      '/api/ClinicNotification/get-clinic-notification-details';
  static const String endPointOfGetDoctorAppointmentDetails =
      '/api/GetbookingAppointment/get-doctor-appointment-details';
  static const String endPointOfGetBlogPopular =
      '${baseUrl}fertility-educations/get-fertility-educations-popular-blog';
  static const String endPointOfGetBlogFeatured =
      '${baseUrl}fertility-educations/get-fertility-educations-featured-blog';
  static const String endPointOfGetFertilityEducationsFeaturedWebinars =
      '${baseUrl}get_fertility_educations_featured_webinars';
  static const String endPointOfGetBlogSaved =
      '/api/fertility-educations/get-fertility-educations-saved-blog';
  static const String endPointOfGetFertilityEducationsFeaturedSavedWebinars =
      '/api/get_fertility_educations_featured_saved_webinars';
  static const String endPointOfGetBlogByCategory =
      '/api/fertility-educations/get-fertility-educations-blogs-by-category';
  static const String endPointOfGetFertilityWebinarsBlogsByCategory =
      '/api/fertility-educations/get-fertility-webinars-blogs-by-category';
  static const String endPointOfGetFertilityWebinarsDetails =
      '/api/fertility-educations/get-fertility-webinars-details';
  static const String
      endPointOfFertilityEducationsGetFertilityEducationsBlogsDetails =
      '/api/fertility-educations/get-fertility-educations-blogs-details';
  static const String endPointOfGetSpermBanner =
      '${baseUrl}fertility-educations/get-banner-fertility';
  static const String endPointOfGetHomeBanner =
      '${baseUrl}home-banner/get-home-banner';
  static const String endPointOfGetFertilityWebinarsBanner =
      '${baseUrl}fertility-educations/get-fertility-webinars-banner';
  static const String endPointOfGetSpermAssessment =
      '${baseUrl}fertility-educations/get-sperm-assessment';
  static const String endPointOfGetFindCoach =
      '${baseUrl}expert-consultation/get-find-coach';
  static const String endPointOfEetClinicDetailById =
      '${baseUrl}available-clinics/get-clinic-detail-by-id';
  static const String endPointOfAddDeleteFertilityBlogEducation =
      '${baseUrl}add_delete_fertility_blog_education';
  static const String endPointOfGetScanClinicList =
      '${baseUrl}tvsscan/get-scan-clinic-List';
  static const String endPointOfGetLatestQuestion =
      '${baseUrl}get_latest_question';
  static const String endPointOfBooking =
      '${baseUrl}bookingAppointment/add-booking-appointment';
  static const String endPointOfGetPaymentToken =
      '${baseUrl}payex/get-payment-token';
  static const String endPointOfPayexPayment = '${baseUrl}payex/payex-payment';
  static const String endPointOfAddDoctorAvailability =
      '${baseUrl}doctors/booking/add-doctor-availability';
  static const String endPointOfUpdatePayexBookingPayment =
      '${baseUrl}payex/update-payex-booking-payment';
  static const String endPointOfGetPayexBookingPayment =
      '/api/payex/get-payex-booking-payment';
  static const String endPointOfGetPeaceCategory =
      '${baseUrl}SupportiveCommunity/get-peace-category';
  static const String endPointOfGetSupportivePeace =
      '/api/SupportiveCommunity/get-supportive-peace';
  static const String endPointOfGetSupportivePeaceById =
      '/api/SupportiveCommunity/get-supportive-peace-by-id';
  static const String endPointOfCountDoctorUpcomingAppointment =
      '/api/GetbookingAppointment/count-doctor-upcoming-appointment';
  static const String endPointOfContactForum =
      '${baseUrl}sleep-management/contact-forum';
  static const String endPointOfAddForumQuestion =
      '${baseUrl}add_forum_question';
  static const String endPointOfDeleteForumQuestion =
      '/api/delete_forum_question';
  static const String endPointOfAddForumQuestionAnswer =
      '${baseUrl}add_forum_question_answer';
  static const String endPointOfGetForumCategory =
      '/api/sleep-management/get-forum-category';
  static const String endPointOfGetFertilityEducationBanner =
      '${baseUrl}EducationBanner/get-fertility-education-banner';
  static const String endPointOfGetForumTopic =
      '${baseUrl}sleep-management/get-forum-topic';
  static const String
      endPointOfZenBookLocationCategoryGetZenBookLocationCategory =
      '${baseUrl}ZenbooklocationCategory/get-zenbook-locationcategory';
  static const String endPointOfGetTVSClinicDetail =
      '/api/tvsscan/get-scan-clinic-detail-by-id';
  static const String endPointOfGetAdminMsgCount =
      '/api/get_admin_msg_count';
  static const String endPointOfGetForumDiscussion =
      '/api/sleep-management/get-forum-discussion';
  static const String endPointOfGetForumQuestion =
      '/api/get_forum_question';
  static const String endPointOfGetTVSBookingAppointment =
      '/api/GetbookingAppointment/get-booking-appointment';
  static const String endPointOfGetPeaceSubCategory =
      '/api/SupportiveCommunity/get-peace-sub-category';
  static const String
      endPointOfSleepManagementZenBookGetZenBookNearestProviders =
      '/api/sleep-management/zen-book/get-zen-book-nearest-providers';
  static const String endPointOfGetUpcomingBookingAppointment =
      '/api/GetbookingAppointment/get-upcoming-booking-appointment';
  static const String endPointOfGetCycleTrackingAddCycleData =
      '${baseUrl}cycle/add_cycle_data';
  static const String endPointOfGetCycleTrackingAddTemperature =
      '${baseUrl}cycle/add_cycle_tracking_temperature';
  static const String endPointOfGetCycleTrackingDeleteTemperature =
      '${baseUrl}cycle/delete_cycle_tracking_temperature ';
  static const String endPointOfCycleTrackingAddUltraSoundImage =
      '${baseUrl}cycle/add_cycle_tracking_ultra_sound_data';
  static const String endPointOfCycleTrackingUpdateUltraSoundImage =
      '${baseUrl}cycle/update_cycle_tracking_ultra_sound_data';
  static const String endPointOfGetCyclerTrackingUltrasoundImageData =
      '/api/cycle/get_cycle_tracking_ultra_sound_data';
  static const String endPointOfGetCyclerTrackingTemperatureData =
      '/api/cycle/get_cycle_tracking_temperature';
  static const String endPointOfCycleTrackingAddSymptomsTracker =
      '${baseUrl}cycle/add_symptoms_tracker';
  static const String endPointOfCycleTrackingAddCervicalMucus =
      '${baseUrl}cycle/add_cervical_mucus';
  static const String endPointOfQuizResult = '${baseUrl}quiz_pcos/quiz_result';
  static const String endPointOfCycleTrackingGetCervicalMucusHistory =
      '${baseUrl}cycle/get_cervical_mucus';
  static const String endPointOfGetCycleTrackingSymptomsTrackerHistory =
      '/api/cycle/get_symptoms_tracker_history';
  static const String endPointOfGetCycleTrackingDeleteSymtomPeriod =
      '${baseUrl}cycle/delete_symptoms_tracker';
  static const String endPointOfGetCycleTrackingDeleteCervicalMucus =
      '${baseUrl}cycle/delete_cervical_mucus';
  static const String endPointOfGetCyclerTrackingData =
      '${baseUrl}cycle/get_cycle_data';

  static const String endPointOfSocialMediaRegistered =
      '${baseUrl}check_social_media_registered';
  static const String endPointOfSocialLogin =
      '${baseUrl}social_login';
}
