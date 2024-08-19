import 'package:fertility_boost/app/modules/social_sign_up/bindings/social_sign_up_binding.dart';
import 'package:fertility_boost/app/modules/social_sign_up/views/social_sign_up_view.dart';
import 'package:get/get.dart';

import '../modules/Result/bindings/result_binding.dart';
import '../modules/Result/views/result_view.dart';
import '../modules/add_address/bindings/add_address_binding.dart';
import '../modules/add_address/views/add_address_view.dart';
import '../modules/ask_question_forum/bindings/ask_question_forum_binding.dart';
import '../modules/ask_question_forum/views/ask_question_forum_view.dart';
import '../modules/ask_questions/bindings/ask_questions_binding.dart';
import '../modules/ask_questions/views/ask_questions_view.dart';
import '../modules/back_to_forum/bindings/back_to_forum_binding.dart';
import '../modules/back_to_forum/views/back_to_forum_view.dart';
import '../modules/blood_report/bindings/blood_report_binding.dart';
import '../modules/blood_report/views/blood_report_view.dart';
import '../modules/book_cart/bindings/book_cart_binding.dart';
import '../modules/book_cart/views/book_cart_view.dart';
import '../modules/book_dashboard/bindings/book_dashboard_binding.dart';
import '../modules/book_dashboard/views/book_dashboard_view.dart';
import '../modules/book_favorites/bindings/book_favorites_binding.dart';
import '../modules/book_favorites/views/book_favorites_view.dart';
import '../modules/book_list_overview/bindings/book_list_overview_binding.dart';
import '../modules/book_list_overview/views/book_list_overview_view.dart';
import '../modules/book_order/bindings/book_order_binding.dart';
import '../modules/book_order/views/book_order_view.dart';
import '../modules/book_well_come/bindings/book_well_come_binding.dart';
import '../modules/book_well_come/views/book_well_come_view.dart';
import '../modules/book_your_class/bindings/book_your_class_binding.dart';
import '../modules/book_your_class/views/book_your_class_view.dart';
import '../modules/booking_by_calendar/bindings/booking_by_calendar_binding.dart';
import '../modules/booking_by_calendar/views/booking_by_calendar_view.dart';
import '../modules/cancel_booking/bindings/cancel_booking_binding.dart';
import '../modules/cancel_booking/views/cancel_booking_view.dart';
import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/chat_with_admin/bindings/chat_with_admin_binding.dart';
import '../modules/chat_with_admin/views/chat_with_admin_view.dart';
import '../modules/check_your_mail/bindings/check_your_mail_binding.dart';
import '../modules/check_your_mail/views/check_your_mail_view.dart';
import '../modules/clinic_detail/bindings/clinic_detail_binding.dart';
import '../modules/clinic_detail/views/clinic_detail_view.dart';
import '../modules/clinics/bindings/clinics_binding.dart';
import '../modules/clinics/views/clinics_view.dart';
import '../modules/confirm_booking/bindings/confirm_booking_binding.dart';
import '../modules/confirm_booking/views/confirm_booking_view.dart';
import '../modules/create_new_password/bindings/create_new_password_binding.dart';
import '../modules/create_new_password/views/create_new_password_view.dart';
import '../modules/cycle_tracking/bindings/cycle_tracking_binding.dart';
import '../modules/cycle_tracking/views/cycle_tracking_view.dart';
import '../modules/cycle_tracking_add_cycleData/bindings/cycle_tracking_add_cycle_data_binding.dart';
import '../modules/cycle_tracking_add_cycleData/views/cycle_tracking_add_cycle_data_view.dart';
import '../modules/cycle_tracking_add_symtopm_tracker/bindings/cycle_tracking_add_symtopm_tracker_binding.dart';
import '../modules/cycle_tracking_add_symtopm_tracker/views/cycle_tracking_add_symtopm_tracker_view.dart';
import '../modules/cycle_tracking_add_temperature/bindings/cycle_tracking_add_temperature_binding.dart';
import '../modules/cycle_tracking_add_temperature/views/cycle_tracking_add_temperature_view.dart';
import '../modules/cycle_tracking_calendar_detail/bindings/cycle_tracking_calendar_detail_binding.dart';
import '../modules/cycle_tracking_calendar_detail/views/cycle_tracking_calendar_detail_view.dart';
import '../modules/cycle_tracking_cervical_mucus_egg/bindings/cycle_tracking_cervical_mucus_egg_binding.dart';
import '../modules/cycle_tracking_cervical_mucus_egg/views/cycle_tracking_cervical_mucus_egg_view.dart';
import '../modules/cycle_tracking_dashboard/bindings/cycle_tracking_dashboard_binding.dart';
import '../modules/cycle_tracking_dashboard/views/cycle_tracking_dashboard.dart';
import '../modules/cycle_tracking_eighth/bindings/cycle_tracking_eighth_binding.dart';
import '../modules/cycle_tracking_eighth/views/cycle_tracking_eighth_view.dart';
import '../modules/cycle_tracking_fifth/bindings/cycle_tracking_fifth_binding.dart';
import '../modules/cycle_tracking_fifth/views/cycle_tracking_fifth_view.dart';
import '../modules/cycle_tracking_forth/bindings/cycle_tracking_forth_binding.dart';
import '../modules/cycle_tracking_forth/views/cycle_tracking_forth_view.dart';
import '../modules/cycle_tracking_history_ultrasoundimage/bindings/cycle_tracking_history_ultrasoundimage_binding.dart';
import '../modules/cycle_tracking_history_ultrasoundimage/views/cycle_tracking_history_ultrasoundimage_view.dart';
import '../modules/cycle_tracking_ninth/bindings/cycle_tracking_ninth_binding.dart';
import '../modules/cycle_tracking_ninth/views/cycle_tracking_ninth_view.dart';
import '../modules/cycle_tracking_second/bindings/cycle_tracking_second_binding.dart';
import '../modules/cycle_tracking_second/views/cycle_tracking_second_view.dart';
import '../modules/cycle_tracking_seventh/bindings/cycle_tracking_seventh_binding.dart';
import '../modules/cycle_tracking_seventh/views/cycle_tracking_seventh_view.dart';
import '../modules/cycle_tracking_sixth/bindings/cycle_tracking_sixth_binding.dart';
import '../modules/cycle_tracking_sixth/views/cycle_tracking_sixth_view.dart';
import '../modules/cycle_tracking_symtopm_tracker_history/bindings/cycle_tracking_symtopm_tracker_history_binding.dart';
import '../modules/cycle_tracking_symtopm_tracker_history/views/cycle_tracking_symtopm_tracker_history_view.dart';
import '../modules/cycle_tracking_tenth/bindings/cycle_tracking_tenth_binding.dart';
import '../modules/cycle_tracking_tenth/views/cycle_tracking_tenth_view.dart';
import '../modules/cycle_tracking_third/bindings/cycle_tracking_third_binding.dart';
import '../modules/cycle_tracking_third/views/cycle_tracking_third_view.dart';
import '../modules/cycle_tracking_ultrasound_edit/bindings/cycle_tracking_ultrasound_edit_binding.dart';
import '../modules/cycle_tracking_ultrasound_edit/views/cycle_tracking_ultrasound_edit_view.dart';
import '../modules/cycle_tracking_ultrasoundimage/bindings/cycle_tracking_ultrasoundimage_binding.dart';
import '../modules/cycle_tracking_ultrasoundimage/views/cycle_tracking_ultrasoundimage_view.dart';
import '../modules/ecommerce_category/bindings/ecommerce_category_binding.dart';
import '../modules/ecommerce_category/views/ecommerce_category_view.dart';
import '../modules/ecommerce_detail/bindings/ecommerce_detail_binding.dart';
import '../modules/ecommerce_detail/views/ecommerce_detail_view.dart';
import '../modules/ecommerce_products/bindings/ecommerce_products_binding.dart';
import '../modules/ecommerce_products/views/ecommerce_products_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/expert_consultation/bindings/expert_consultation_binding.dart';
import '../modules/expert_consultation/views/expert_consultation_view.dart';
import '../modules/expert_consultation_booking_details/bindings/expert_consultation_booking_details_binding.dart';
import '../modules/expert_consultation_booking_details/views/expert_consultation_booking_details_view.dart';
import '../modules/expert_consultation_coach_profile/bindings/expert_consultation_coach_profile_binding.dart';
import '../modules/expert_consultation_coach_profile/views/expert_consultation_coach_profile_view.dart';
import '../modules/expert_consultation_dashboard/bindings/expert_consultation_dashboard_binding.dart';
import '../modules/expert_consultation_dashboard/views/expert_consultation_dashboard_view.dart';
import '../modules/expert_consultation_discover/bindings/expert_consultation_discover_binding.dart';
import '../modules/expert_consultation_discover/views/expert_consultation_discover_view.dart';
import '../modules/expert_consultation_get_start/bindings/expert_consultation_get_start_binding.dart';
import '../modules/expert_consultation_get_start/views/expert_consultation_get_start_view.dart';
import '../modules/expert_consultation_payment/bindings/expert_consultation_payment_binding.dart';
import '../modules/expert_consultation_payment/views/expert_consultation_payment_view.dart';
import '../modules/expert_consultation_success/bindings/expert_consultation_success_binding.dart';
import '../modules/expert_consultation_success/views/expert_consultation_success_view.dart';
import '../modules/expert_consultation_well_come/bindings/expert_consultation_well_come_binding.dart';
import '../modules/expert_consultation_well_come/views/expert_consultation_well_come_view.dart';
import '../modules/fertility_assessment/bindings/fertility_assessment_binding.dart';
import '../modules/fertility_assessment/views/fertility_assessment_view.dart';
import '../modules/fertility_education/bindings/fertility_education_binding.dart';
import '../modules/fertility_education/views/fertility_education_view.dart';
import '../modules/fertility_education_blog/bindings/fertility_education_blog_binding.dart';
import '../modules/fertility_education_blog/views/fertility_education_blog_view.dart';
import '../modules/fertility_education_category/bindings/fertility_education_category_binding.dart';
import '../modules/fertility_education_category/views/fertility_education_category_view.dart';
import '../modules/fertility_education_discover/bindings/fertility_education_discover_binding.dart';
import '../modules/fertility_education_discover/views/fertility_education_discover_view.dart';
import '../modules/fertility_education_ebooks/bindings/fertility_education_ebooks_binding.dart';
import '../modules/fertility_education_ebooks/views/fertility_education_ebooks_view.dart';
import '../modules/fertility_education_explore_our_e_book/bindings/fertility_education_explore_our_e_book_binding.dart';
import '../modules/fertility_education_explore_our_e_book/views/fertility_education_explore_our_e_book_view.dart';
import '../modules/fertility_education_explore_our_e_book_detail/bindings/fertility_education_explore_our_e_book_detail_binding.dart';
import '../modules/fertility_education_explore_our_e_book_detail/views/fertility_education_explore_our_e_book_detail_view.dart';
import '../modules/fertility_education_now_playing/bindings/fertility_education_now_playing_binding.dart';
import '../modules/fertility_education_now_playing/views/fertility_education_now_playing_view.dart';
import '../modules/fertility_education_webinars/bindings/fertility_education_webinars_binding.dart';
import '../modules/fertility_education_webinars/views/fertility_education_webinars_view.dart';
import '../modules/fertility_education_well_come/bindings/fertility_education_well_come_binding.dart';
import '../modules/fertility_education_well_come/views/fertility_education_well_come_view.dart';
import '../modules/fertility_home_test_kit/bindings/fertility_home_test_kit_binding.dart';
import '../modules/fertility_home_test_kit/views/fertility_home_test_kit_view.dart';
import '../modules/fertility_specialist/bindings/fertility_specialist_binding.dart';
import '../modules/fertility_specialist/views/fertility_specialist_view.dart';
import '../modules/fertility_specialist_Payment/bindings/fertility_specialist_payment_binding.dart';
import '../modules/fertility_specialist_Payment/views/fertility_specialist_payment_view.dart';
import '../modules/fertility_specialist_booking_date/bindings/fertility_specialist_booking_date_binding.dart';
import '../modules/fertility_specialist_booking_date/views/fertility_specialist_booking_date_view.dart';
import '../modules/fertility_specialist_confirm_booking/bindings/fertility_specialist_confirm_booking_binding.dart';
import '../modules/fertility_specialist_confirm_booking/views/fertility_specialist_confirm_booking_view.dart';
import '../modules/fertility_specialist_details/bindings/fertility_specialist_details_binding.dart';
import '../modules/fertility_specialist_details/views/fertility_specialist_details_view.dart';
import '../modules/find_peace/bindings/find_peace_binding.dart';
import '../modules/find_peace/views/find_peace_view.dart';
import '../modules/find_peace_detail/bindings/find_peace_detail_binding.dart';
import '../modules/find_peace_detail/views/find_peace_detail_view.dart';
import '../modules/find_peace_detail_two/bindings/find_peace_detail_two_binding.dart';
import '../modules/find_peace_detail_two/views/find_peace_detail_two_view.dart';
import '../modules/forum/bindings/forum_binding.dart';
import '../modules/forum/views/forum_view.dart';
import '../modules/forum_topics/bindings/forum_topics_binding.dart';
import '../modules/forum_topics/views/forum_topics_view.dart';
import '../modules/forum_topics_list/bindings/forum_topics_list_binding.dart';
import '../modules/forum_topics_list/views/forum_topics_list_view.dart';
import '../modules/general_wellness_blood_test/bindings/general_wellness_blood_test_binding.dart';
import '../modules/general_wellness_blood_test/views/general_wellness_blood_test_view.dart';
import '../modules/get_expert/bindings/get_expert_binding.dart';
import '../modules/get_expert/views/get_expert_view.dart';
import '../modules/get_start/bindings/get_start_binding.dart';
import '../modules/get_start/views/get_start_view.dart';
import '../modules/health_assessment/bindings/health_assessment_binding.dart';
import '../modules/health_assessment/views/health_assessment_view.dart';
import '../modules/health_assessment_sub_category/bindings/health_assessment_sub_category_binding.dart';
import '../modules/health_assessment_sub_category/views/health_assessment_sub_category_view.dart';
import '../modules/health_recorde/bindings/health_recorde_binding.dart';
import '../modules/health_recorde/views/health_recorde_view.dart';
import '../modules/healthcare_provider/bindings/healthcare_provider_binding.dart';
import '../modules/healthcare_provider/views/healthcare_provider_view.dart';
import '../modules/healthcare_provider_chat/bindings/healthcare_provider_chat_binding.dart';
import '../modules/healthcare_provider_chat/views/healthcare_provider_chat_view.dart';
import '../modules/healthcare_provider_chat_list/bindings/healthcare_provider_chat_list_binding.dart';
import '../modules/healthcare_provider_chat_list/views/healthcare_provider_chat_list_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/hormone_blood_test/bindings/hormone_blood_test_binding.dart';
import '../modules/hormone_blood_test/views/hormone_blood_test_view.dart';
import '../modules/intimacy_games/bindings/intimacy_games_binding.dart';
import '../modules/intimacy_games/views/intimacy_games_view.dart';
import '../modules/intimacy_management/bindings/intimacy_management_binding.dart';
import '../modules/intimacy_management/views/intimacy_management_view.dart';
import '../modules/intimacy_management_calendar/bindings/intimacy_management_calendar_binding.dart';
import '../modules/intimacy_management_calendar/views/intimacy_management_calendar_view.dart';
import '../modules/intimacy_management_communication_tips/bindings/intimacy_management_communication_tips_binding.dart';
import '../modules/intimacy_management_communication_tips/views/intimacy_management_communication_tips_view.dart';
import '../modules/intimacy_management_communication_tips_detail/bindings/intimacy_management_communication_tips_detail_binding.dart';
import '../modules/intimacy_management_communication_tips_detail/views/intimacy_management_communication_tips_detail_view.dart';
import '../modules/intimacy_management_conversation_starters/bindings/intimacy_management_conversation_starters_binding.dart';
import '../modules/intimacy_management_conversation_starters/views/intimacy_management_conversation_starters_view.dart';
import '../modules/intimacy_management_conversation_starters_explore/bindings/intimacy_management_conversation_starters_explore_binding.dart';
import '../modules/intimacy_management_conversation_starters_explore/views/intimacy_management_conversation_starters_explore_view.dart';
import '../modules/intimacy_management_conversation_starters_explore_detail/bindings/intimacy_management_conversation_starters_explore_detail_binding.dart';
import '../modules/intimacy_management_conversation_starters_explore_detail/views/intimacy_management_conversation_starters_explore_detail_view.dart';
import '../modules/intimacy_management_insights/bindings/intimacy_management_insights_binding.dart';
import '../modules/intimacy_management_insights/views/intimacy_management_insights_view.dart';
import '../modules/intimacy_management_language_of_love_quotes/bindings/intimacy_management_language_of_love_quotes_binding.dart';
import '../modules/intimacy_management_language_of_love_quotes/views/intimacy_management_language_of_love_quotes_view.dart';
import '../modules/intimacy_management_love_language_sub_category/bindings/intimacy_management_love_language_sub_category_binding.dart';
import '../modules/intimacy_management_love_language_sub_category/views/intimacy_management_love_language_sub_category_view.dart';
import '../modules/intimacy_management_love_language_sub_category_detail/bindings/intimacy_management_love_language_sub_category_detail_binding.dart';
import '../modules/intimacy_management_love_language_sub_category_detail/views/intimacy_management_love_language_sub_category_detail_view.dart';
import '../modules/intimacy_management_romantic_spot/bindings/intimacy_management_romantic_spot_binding.dart';
import '../modules/intimacy_management_romantic_spot/views/intimacy_management_romantic_spot_view.dart';
import '../modules/intimacy_management_romantic_spot_detail/bindings/intimacy_management_romantic_spot_detail_binding.dart';
import '../modules/intimacy_management_romantic_spot_detail/views/intimacy_management_romantic_spot_detail_view.dart';
import '../modules/laboratory_and_clinic_home/bindings/laboratory_and_clinic_home_binding.dart';
import '../modules/laboratory_and_clinic_home/views/laboratory_and_clinic_home_view.dart';
import '../modules/laboratory_and_clinic_map/bindings/laboratory_and_clinic_map_binding.dart';
import '../modules/laboratory_and_clinic_map/views/laboratory_and_clinic_map_view.dart';
import '../modules/laboratory_and_clinic_order_status/bindings/laboratory_and_clinic_order_status_binding.dart';
import '../modules/laboratory_and_clinic_order_status/views/laboratory_and_clinic_order_status_view.dart';
import '../modules/laboratory_and_clinic_success/bindings/laboratory_and_clinic_success_binding.dart';
import '../modules/laboratory_and_clinic_success/views/laboratory_and_clinic_success_view.dart';
import '../modules/learn_from/bindings/learn_from_binding.dart';
import '../modules/learn_from/views/learn_from_view.dart';
import '../modules/learn_from_detail/bindings/learn_from_detail_binding.dart';
import '../modules/learn_from_detail/views/learn_from_detail_view.dart';
import '../modules/lifestyle_optimisation/bindings/lifestyle_optimisation_binding.dart';
import '../modules/lifestyle_optimisation/views/lifestyle_optimisation_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/menopause_quiz_assesment/bindings/menopause_quiz_assesment_binding.dart';
import '../modules/menopause_quiz_assesment/views/menopause_quiz_assesment_view.dart';
import '../modules/my_profile/bindings/my_profile_binding.dart';
import '../modules/my_profile/views/my_profile_view.dart';
import '../modules/nav_bar/bindings/nav_bar_binding.dart';
import '../modules/nav_bar/views/nav_bar_view.dart';
import '../modules/nutritional_guidance/bindings/nutritional_guidance_binding.dart';
import '../modules/nutritional_guidance/views/nutritional_guidance_view.dart';
import '../modules/nutritional_guidance_detail/bindings/nutritional_guidance_detail_binding.dart';
import '../modules/nutritional_guidance_detail/views/nutritional_guidance_detail_view.dart';
import '../modules/nutritional_guidance_detail_blog/bindings/nutritional_guidance_detail_blog_binding.dart';
import '../modules/nutritional_guidance_detail_blog/views/nutritional_guidance_detail_blog_view.dart';
import '../modules/nutritional_guidance_detail_blog_detail/bindings/nutritional_guidance_detail_blog_detail_binding.dart';
import '../modules/nutritional_guidance_detail_blog_detail/views/nutritional_guidance_detail_blog_detail_view.dart';
import '../modules/nutritional_guidance_detail_dashboard/bindings/nutritional_guidance_detail_dashboard_binding.dart';
import '../modules/nutritional_guidance_detail_dashboard/views/nutritional_guidance_detail_dashboard_view.dart';
import '../modules/nutritional_guidance_detail_dashboard_detail/bindings/nutritional_guidance_detail_dashboard_detail_binding.dart';
import '../modules/nutritional_guidance_detail_dashboard_detail/views/nutritional_guidance_detail_dashboard_detail_view.dart';
import '../modules/nutritional_guidance_detail_meal_plan_week_day_detail/bindings/nutritional_guidance_detail_meal_plan_week_day_detail_binding.dart';
import '../modules/nutritional_guidance_detail_meal_plan_week_day_detail/views/nutritional_guidance_detail_meal_plan_week_day_detail_view.dart';
import '../modules/nutritional_guidance_detail_meal_plan_weeks/bindings/nutritional_guidance_detail_meal_plan_weeks_binding.dart';
import '../modules/nutritional_guidance_detail_meal_plan_weeks/views/nutritional_guidance_detail_meal_plan_weeks_view.dart';
import '../modules/nutritional_guidance_detail_menu_upload/bindings/nutritional_guidance_detail_menu_upload_binding.dart';
import '../modules/nutritional_guidance_detail_menu_upload/views/nutritional_guidance_detail_menu_upload_view.dart';
import '../modules/nutritional_guidance_detail_summary_your_meal_time/bindings/nutritional_guidance_detail_summary_your_meal_time_binding.dart';
import '../modules/nutritional_guidance_detail_summary_your_meal_time/views/nutritional_guidance_detail_summary_your_meal_time_view.dart';
import '../modules/nutritional_guidance_detail_supplement/bindings/nutritional_guidance_detail_supplement_binding.dart';
import '../modules/nutritional_guidance_detail_supplement/views/nutritional_guidance_detail_supplement_view.dart';
import '../modules/nutritional_guidance_detail_time_for_meal/bindings/nutritional_guidance_detail_time_for_meal_binding.dart';
import '../modules/nutritional_guidance_detail_time_for_meal/views/nutritional_guidance_detail_time_for_meal_view.dart';
import '../modules/nutritional_guidance_quiz/bindings/nutritional_guidance_quiz_binding.dart';
import '../modules/nutritional_guidance_quiz/views/nutritional_guidance_quiz_view.dart';
import '../modules/nutritional_guidance_sub_category/bindings/nutritional_guidance_sub_category_binding.dart';
import '../modules/nutritional_guidance_sub_category/views/nutritional_guidance_sub_category_view.dart';
import '../modules/payment_success/bindings/payment_success_binding.dart';
import '../modules/payment_success/views/payment_success_view.dart';
import '../modules/pcos_quiz_assessment/bindings/pcos_quiz_assessment_binding.dart';
import '../modules/pcos_quiz_assessment/views/pcos_quiz_assessment_view.dart';
import '../modules/pdf_ebook/bindings/pdf_ebook_binding.dart';
import '../modules/pdf_ebook/views/pdf_ebook_view.dart';
import '../modules/personal_trainer/bindings/personal_trainer_binding.dart';
import '../modules/personal_trainer/views/personal_trainer_view.dart';
import '../modules/personal_trainer_book/bindings/personal_trainer_book_binding.dart';
import '../modules/personal_trainer_book/views/personal_trainer_book_view.dart';
import '../modules/personal_trainer_chat/bindings/personal_trainer_chat_binding.dart';
import '../modules/personal_trainer_chat/views/personal_trainer_chat_view.dart';
import '../modules/personal_trainer_dashboard/bindings/personal_trainer_dashboard_binding.dart';
import '../modules/personal_trainer_dashboard/views/personal_trainer_dashboard_view.dart';
import '../modules/personal_trainer_fill_out_your_details/bindings/personal_trainer_fill_out_your_details_binding.dart';
import '../modules/personal_trainer_fill_out_your_details/views/personal_trainer_fill_out_your_details_view.dart';
import '../modules/personal_trainer_find/bindings/personal_trainer_find_binding.dart';
import '../modules/personal_trainer_find/views/personal_trainer_find_view.dart';
import '../modules/personal_trainer_training_session/bindings/personal_trainer_training_session_binding.dart';
import '../modules/personal_trainer_training_session/views/personal_trainer_training_session_view.dart';
import '../modules/play_audio_stress_management/bindings/play_audio_stress_management_binding.dart';
import '../modules/play_audio_stress_management/views/play_audio_stress_management_view.dart';
import '../modules/play_video_stress_management/bindings/play_video_stress_management_binding.dart';
import '../modules/play_video_stress_management/views/play_video_stress_management_view.dart';
import '../modules/prediabetes_quiz_assesment/bindings/prediabetes_quiz_assesment_binding.dart';
import '../modules/prediabetes_quiz_assesment/views/prediabetes_quiz_assesment_view.dart';
import '../modules/privacy_policy/bindings/privacy_policy_binding.dart';
import '../modules/privacy_policy/views/privacy_policy_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/progress_workout/bindings/progress_workout_binding.dart';
import '../modules/progress_workout/views/progress_workout_view.dart';
import '../modules/progress_workout_detail/bindings/progress_workout_detail_binding.dart';
import '../modules/progress_workout_detail/views/progress_workout_detail_view.dart';
import '../modules/prt_edit_profile/bindings/prt_edit_profile_binding.dart';
import '../modules/prt_edit_profile/views/prt_edit_profile_view.dart';
import '../modules/prt_login/bindings/prt_login_binding.dart';
import '../modules/prt_login/views/prt_login_view.dart';
import '../modules/prt_my_profile/bindings/prt_my_profile_binding.dart';
import '../modules/prt_my_profile/views/prt_my_profile_view.dart';
import '../modules/prt_nav_bar/bindings/prt_nav_bar_binding.dart';
import '../modules/prt_nav_bar/views/prt_nav_bar_view.dart';
import '../modules/prt_profile/bindings/prt_profile_binding.dart';
import '../modules/prt_profile/views/prt_profile_view.dart';
import '../modules/prt_reset_password/bindings/prt_reset_password_binding.dart';
import '../modules/prt_reset_password/views/prt_reset_password_view.dart';
import '../modules/prt_sign_up/bindings/prt_sign_up_binding.dart';
import '../modules/prt_sign_up/views/prt_sign_up_view.dart';
import '../modules/quiz/bindings/quiz_binding.dart';
import '../modules/quiz/views/quiz_view.dart';
import '../modules/quiz_assesment/bindings/quiz_assesment_binding.dart';
import '../modules/quiz_assesment/views/quiz_assesment_view.dart';
import '../modules/rate_us/bindings/rate_us_binding.dart';
import '../modules/rate_us/views/rate_us_view.dart';
import '../modules/reset_password/bindings/reset_password_binding.dart';
import '../modules/reset_password/views/reset_password_view.dart';
import '../modules/search/bindings/search_binding.dart';
import '../modules/search/views/search_view.dart';
import '../modules/sign_up/bindings/sign_up_binding.dart';
import '../modules/sign_up/views/sign_up_view.dart';
import '../modules/sleep_management_dashboard/bindings/sleep_management_dashboard_binding.dart';
import '../modules/sleep_management_dashboard/views/sleep_management_dashboard_view.dart';
import '../modules/sleep_management_discover/bindings/sleep_management_discover_binding.dart';
import '../modules/sleep_management_discover/views/sleep_management_discover_view.dart';
import '../modules/sleep_management_favorite_sleep_sound_tracks/bindings/sleep_management_favorite_sleep_sound_tracks_binding.dart';
import '../modules/sleep_management_favorite_sleep_sound_tracks/views/sleep_management_favorite_sleep_sound_tracks_view.dart';
import '../modules/sleep_management_media_player/bindings/sleep_management_media_player_binding.dart';
import '../modules/sleep_management_media_player/views/sleep_management_media_player_view.dart';
import '../modules/sleep_management_notification/bindings/sleep_management_notification_binding.dart';
import '../modules/sleep_management_notification/views/sleep_management_notification_view.dart';
import '../modules/sleep_management_splash/bindings/sleep_management_splash_binding.dart';
import '../modules/sleep_management_splash/views/sleep_management_splash_view.dart';
import '../modules/sperm_test_package/bindings/sperm_test_package_binding.dart';
import '../modules/sperm_test_package/views/sperm_test_package_view.dart';
import '../modules/sperm_test_package_booking_is_confirmed/bindings/sperm_test_package_booking_is_confirmed_binding.dart';
import '../modules/sperm_test_package_booking_is_confirmed/views/sperm_test_package_booking_is_confirmed_view.dart';
import '../modules/sperm_test_package_hospital_serdang/bindings/sperm_test_package_hospital_serdang_binding.dart';
import '../modules/sperm_test_package_hospital_serdang/views/sperm_test_package_hospital_serdang_view.dart';
import '../modules/sperm_test_package_nearby_clinics/bindings/sperm_test_package_nearby_clinics_binding.dart';
import '../modules/sperm_test_package_nearby_clinics/views/sperm_test_package_nearby_clinics_view.dart';
import '../modules/sperm_test_package_nearby_clinics_detail/bindings/sperm_test_package_nearby_clinics_detail_binding.dart';
import '../modules/sperm_test_package_nearby_clinics_detail/views/sperm_test_package_nearby_clinics_detail_view.dart';
import '../modules/sperm_test_package_payment/bindings/sperm_test_package_payment_binding.dart';
import '../modules/sperm_test_package_payment/views/sperm_test_package_payment_view.dart';
import '../modules/sperm_test_package_your_appointments/bindings/sperm_test_package_your_appointments_binding.dart';
import '../modules/sperm_test_package_your_appointments/views/sperm_test_package_your_appointments_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/stress_management/bindings/stress_management_binding.dart';
import '../modules/stress_management/views/stress_management_view.dart';
import '../modules/supportive_community/bindings/supportive_community_binding.dart';
import '../modules/supportive_community/views/supportive_community_view.dart';
import '../modules/tel_doc_chat/bindings/tel_doc_chat_binding.dart';
import '../modules/tel_doc_chat/views/tel_doc_chat_view.dart';
import '../modules/tel_doc_client_detail/bindings/tel_doc_client_detail_binding.dart';
import '../modules/tel_doc_client_detail/views/tel_doc_client_detail_view.dart';
import '../modules/tel_doc_home/bindings/tel_doc_home_binding.dart';
import '../modules/tel_doc_home/views/tel_doc_home_view.dart';
import '../modules/tel_doc_profile/bindings/tel_doc_profile_binding.dart';
import '../modules/tel_doc_profile/views/tel_doc_profile_view.dart';
import '../modules/tel_doc_scedule_call/bindings/tel_doc_scedule_call_binding.dart';
import '../modules/tel_doc_scedule_call/views/tel_doc_scedule_call_view.dart';
import '../modules/tel_doc_set_availability/bindings/tel_doc_set_availability_binding.dart';
import '../modules/tel_doc_set_availability/views/tel_doc_set_availability_view.dart';
import '../modules/test_kit_result/bindings/test_kit_result_binding.dart';
import '../modules/test_kit_result/views/test_kit_result_view.dart';
import '../modules/test_kit_upload/bindings/test_kit_upload_binding.dart';
import '../modules/test_kit_upload/views/test_kit_upload_view.dart';
import '../modules/trainer_net_add_appointment/bindings/trainer_net_add_appointment_binding.dart';
import '../modules/trainer_net_add_appointment/views/trainer_net_add_appointment_view.dart';
import '../modules/trainer_net_appointments/bindings/trainer_net_appointments_binding.dart';
import '../modules/trainer_net_appointments/views/trainer_net_appointments_view.dart';
import '../modules/trainer_net_home/bindings/trainer_net_home_binding.dart';
import '../modules/trainer_net_home/views/trainer_net_home_view.dart';
import '../modules/trainer_net_manage_appointments/bindings/trainer_net_manage_appointments_binding.dart';
import '../modules/trainer_net_manage_appointments/views/trainer_net_manage_appointments_view.dart';
import '../modules/trainer_net_notification/bindings/trainer_net_notification_binding.dart';
import '../modules/trainer_net_notification/views/trainer_net_notification_view.dart';
import '../modules/trainer_net_wel_come/bindings/trainer_net_wel_come_binding.dart';
import '../modules/trainer_net_wel_come/views/trainer_net_wel_come_view.dart';
import '../modules/tvs_scan_package/bindings/tvs_scan_package_binding.dart';
import '../modules/tvs_scan_package/views/tvs_scan_package_view.dart';
import '../modules/tvs_scan_package_add_appointment/bindings/tvs_scan_package_add_appointment_binding.dart';
import '../modules/tvs_scan_package_add_appointment/views/tvs_scan_package_add_appointment_view.dart';
import '../modules/tvs_scan_package_dashbord/bindings/tvs_scan_package_dashbord_binding.dart';
import '../modules/tvs_scan_package_dashbord/views/tvs_scan_package_dashbord_view.dart';
import '../modules/tvs_scan_package_detail/bindings/tvs_scan_package_detail_binding.dart';
import '../modules/tvs_scan_package_detail/views/tvs_scan_package_detail_view.dart';
import '../modules/waiting_for_approval/bindings/waiting_for_approval_binding.dart';
import '../modules/waiting_for_approval/views/waiting_for_approval_view.dart';
import '../modules/web_view_for_payment/bindings/web_view_for_payment_binding.dart';
import '../modules/web_view_for_payment/views/web_view_for_payment_view.dart';
import '../modules/web_view_for_pdf/bindings/web_view_for_pdf_binding.dart';
import '../modules/web_view_for_pdf/views/web_view_for_pdf_view.dart';
import '../modules/workout_plan_list/bindings/workout_plan_list_binding.dart';
import '../modules/workout_plan_list/views/workout_plan_list_view.dart';
import '../modules/workout_plans/bindings/workout_plans_binding.dart';
import '../modules/workout_plans/views/workout_plans_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.GET_START,
      page: () => const GetStartView(),
      binding: GetStartBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.RESET_PASSWORD,
      page: () => const ResetPasswordView(),
      binding: ResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_YOUR_MAIL,
      page: () => const CheckYourMailView(),
      binding: CheckYourMailBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_NEW_PASSWORD,
      page: () => const CreateNewPasswordView(),
      binding: CreateNewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.RESULT,
      page: () => const ResultView(),
      binding: ResultBinding(),
    ),
    GetPage(
      name: _Paths.NAV_BAR,
      page: () => const NavBarView(),
      binding: NavBarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => const SearchView(),
      binding: SearchBinding(),
    ),
    GetPage(
      name: _Paths.HEALTH_ASSESSMENT,
      page: () => const HealthAssessmentView(),
      binding: HealthAssessmentBinding(),
    ),
    GetPage(
      name: _Paths.HEALTH_RECORDE,
      page: () => const HealthRecordeView(),
      binding: HealthRecordeBinding(),
    ),
    GetPage(
      name: _Paths.BLOOD_REPORT,
      page: () => const BloodReportView(),
      binding: BloodReportBinding(),
    ),
    GetPage(
      name: _Paths.MY_PROFILE,
      page: () => const MyProfileView(),
      binding: MyProfileBinding(),
    ),
    GetPage(
      name: _Paths.RATE_US,
      page: () => const RateUsView(),
      binding: RateUsBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE,
      page: () => const NutritionalGuidanceView(),
      binding: NutritionalGuidanceBinding(),
    ),
    GetPage(
      name: _Paths.PROGRESS_WORKOUT,
      page: () => const ProgressWorkoutView(),
      binding: ProgressWorkoutBinding(),
    ),
    GetPage(
      name: _Paths.PROGRESS_WORKOUT_DETAIL,
      page: () => const ProgressWorkoutDetailView(),
      binding: ProgressWorkoutDetailBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING,
      page: () => const CycleTrackingView(),
      binding: CycleTrackingBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_DASHBOARD,
      page: () => const CycleTrackingDashboardView(),
      binding: CycleTrackingDashboardBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_ULTRASOUNDIMAGE,
      page: () => const CycleTrackingUltrasoundImageView(),
      binding: CycleTrackingUltrasoundImageBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_ULTRASOUND_EDIT,
      page: () => const CycleTrackingUltraSoundEditView(),
      binding: CycleTrackingUltraSoundEditBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_HISTORY_ULTRASOUND_IMAGE,
      page: () => const CycleTrackingHistoryUltrasoundImageView(),
      binding: CycleTrackingHistoryUltraSoundBinding(),
    ),
    GetPage(
      name: _Paths.ECOMMERCE_CATEGORY,
      page: () => const EcommerceCategoryView(),
      binding: EcommerceCategoryBinding(),
    ),
    GetPage(
      name: _Paths.ECOMMERCE_PRODUCTS,
      page: () => const EcommerceProductsView(),
      binding: EcommerceProductsBinding(),
    ),
    GetPage(
      name: _Paths.ECOMMERCE_DETAIL,
      page: () => const EcommerceDetailView(),
      binding: EcommerceDetailBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ADDRESS,
      page: () => const AddAddressView(),
      binding: AddAddressBinding(),
    ),
    GetPage(
      name: _Paths.PAYMENT_SUCCESS,
      page: () => const PaymentSuccessView(),
      binding: PaymentSuccessBinding(),
    ),
    GetPage(
      name: _Paths.LIFESTYLE_OPTIMISATION,
      page: () => const LifestyleOptimisationView(),
      binding: LifestyleOptimisationBinding(),
    ),
    GetPage(
      name: _Paths.STRESS_MANAGEMENT,
      page: () => const StressManagementView(),
      binding: StressManagementBinding(),
    ),
    GetPage(
      name: _Paths.PLAY_AUDIO_STRESS_MANAGEMENT,
      page: () => const PlayAudioStressManagementView(),
      binding: PlayAudioStressManagementBinding(),
    ),
    GetPage(
      name: _Paths.SUPPORTIVE_COMMUNITY,
      page: () => const SupportiveCommunityView(),
      binding: SupportiveCommunityBinding(),
    ),
    GetPage(
      name: _Paths.ASK_QUESTIONS,
      page: () => const AskQuestionsView(),
      binding: AskQuestionsBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.GET_EXPERT,
      page: () => const GetExpertView(),
      binding: GetExpertBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_SPECIALIST,
      page: () => const FertilitySpecialistView(),
      binding: FertilitySpecialistBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_SPECIALIST_DETAILS,
      page: () => const FertilitySpecialistDetailsView(),
      binding: FertilitySpecialistDetailsBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_SPECIALIST_PAYMENT,
      page: () => const FertilitySpecialistPaymentView(),
      binding: FertilitySpecialistPaymentBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_SPECIALIST_CONFIRM_BOOKING,
      page: () => const FertilitySpecialistConfirmBookingView(),
      binding: FertilitySpecialistConfirmBookingBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_SPECIALIST_BOOKING_DATE,
      page: () => const FertilitySpecialistBookingDateView(),
      binding: FertilitySpecialistBookingDateBinding(),
    ),
    GetPage(
      name: _Paths.HEALTHCARE_PROVIDER,
      page: () => const HealthcareProviderView(),
      binding: HealthcareProviderBinding(),
    ),
    GetPage(
      name: _Paths.HEALTHCARE_PROVIDER_CHAT,
      page: () => const HealthcareProviderChatView(),
      binding: HealthcareProviderChatBinding(),
    ),
    GetPage(
      name: _Paths.HEALTHCARE_PROVIDER_CHAT_LIST,
      page: () => const HealthcareProviderChatListView(),
      binding: HealthcareProviderChatListBinding(),
    ),
    GetPage(
      name: _Paths.HEALTH_ASSESSMENT_SUB_CATEGORY,
      page: () => const HealthAssessmentSubCategoryView(),
      binding: HealthAssessmentSubCategoryBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_SECOND,
      page: () => const CycleTrackingSecondView(),
      binding: CycleTrackingSecondBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_THIRD,
      page: () => const CycleTrackingThirdView(),
      binding: CycleTrackingThirdBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_FORTH,
      page: () => const CycleTrackingForthView(),
      binding: CycleTrackingForthBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_FIFTH,
      page: () => const CycleTrackingFifthView(),
      binding: CycleTrackingFifthBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_SIXTH,
      page: () => const CycleTrackingSixthView(),
      binding: CycleTrackingSixthBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_SEVENTH,
      page: () => const CycleTrackingSeventhView(),
      binding: CycleTrackingSeventhBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_EIGHTH,
      page: () => const CycleTrackingEighthView(),
      binding: CycleTrackingEighthBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_NINTH,
      page: () => const CycleTrackingNinthView(),
      binding: CycleTrackingNinthBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_TENTH,
      page: () => const CycleTrackingTenthView(),
      binding: CycleTrackingTenthBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_HOME_TEST_KIT,
      page: () => const FertilityHomeTestKitView(),
      binding: FertilityHomeTestKitBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_ASSESSMENT,
      page: () => const FertilityAssessmentView(),
      binding: FertilityAssessmentBinding(),
    ),
    GetPage(
      name: _Paths.HORMONE_BLOOD_TEST,
      page: () => const HormoneBloodTestView(),
      binding: HormoneBloodTestBinding(),
    ),
    GetPage(
      name: _Paths.CLINICS,
      page: () => const ClinicsView(),
      binding: ClinicsBinding(),
    ),
    GetPage(
      name: _Paths.CLINIC_DETAIL,
      page: () => const ClinicDetailView(),
      binding: ClinicDetailBinding(),
    ),
    GetPage(
      name: _Paths.TEST_KIT_UPLOAD,
      page: () => const TestKitUploadView(),
      binding: TestKitUploadBinding(),
    ),
    GetPage(
      name: _Paths.TEST_KIT_RESULT,
      page: () => const TestKitResultView(),
      binding: TestKitResultBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ,
      page: () => const QuizView(),
      binding: QuizBinding(),
    ),
    GetPage(
      name: _Paths.WORKOUT_PLANS,
      page: () => const WorkoutPlansView(),
      binding: WorkoutPlansBinding(),
    ),
    GetPage(
      name: _Paths.WORKOUT_PLAN_LIST,
      page: () => const WorkoutPlanListView(),
      binding: WorkoutPlanListBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_SUB_CATEGORY,
      page: () => const NutritionalGuidanceSubCategoryView(),
      binding: NutritionalGuidanceSubCategoryBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_QUIZ,
      page: () => const NutritionalGuidanceQuizView(),
      binding: NutritionalGuidanceQuizBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL,
      page: () => const NutritionalGuidanceDetailView(),
      binding: NutritionalGuidanceDetailBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_DASHBOARD,
      page: () => const NutritionalGuidanceDetailDashboardView(),
      binding: NutritionalGuidanceDetailDashboardBinding(),
      children: [
        GetPage(
          name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_DASHBOARD,
          page: () => const NutritionalGuidanceDetailDashboardView(),
          binding: NutritionalGuidanceDetailDashboardBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_BLOG,
      page: () => const NutritionalGuidanceDetailBlogView(),
      binding: NutritionalGuidanceDetailBlogBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_TIME_FOR_MEAL,
      page: () => const NutritionalGuidanceDetailTimeForMealView(),
      binding: NutritionalGuidanceDetailTimeForMealBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_SUMMARY_YOUR_MEAL_TIME,
      page: () => const NutritionalGuidanceDetailSummaryYourMealTimeView(),
      binding: NutritionalGuidanceDetailSummaryYourMealTimeBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_SUPPLEMENT,
      page: () => const NutritionalGuidanceDetailSupplementView(),
      binding: NutritionalGuidanceDetailSupplementBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_MEAL_PLAN_WEEKS,
      page: () => const NutritionalGuidanceDetailMealPlanWeeksView(),
      binding: NutritionalGuidanceDetailMealPlanWeeksBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_MEAL_PLAN_WEEK_DAY_DETAIL,
      page: () => const NutritionalGuidanceDetailMealPlanWeekDayDetailView(),
      binding: NutritionalGuidanceDetailMealPlanWeekDayDetailBinding(),
    ),
    GetPage(
      name: _Paths.PLAY_VIDEO_STRESS_MANAGEMENT,
      page: () => const PlayVideoStressManagementView(),
      binding: PlayVideoStressManagementBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_MENU_UPLOAD,
      page: () => const NutritionalGuidanceDetailMenuUploadView(),
      binding: NutritionalGuidanceDetailMenuUploadBinding(),
    ),
    GetPage(
      name: _Paths.FORUM,
      page: () => const ForumView(),
      binding: ForumBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP_MANAGEMENT_SPLASH,
      page: () => const SleepManagementSplashView(),
      binding: SleepManagementSplashBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP_MANAGEMENT_FAVORITE_SLEEP_SOUND_TRACKS,
      page: () => const SleepManagementFavoriteSleepSoundTracksView(),
      binding: SleepManagementFavoriteSleepSoundTracksBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP_MANAGEMENT_DASHBOARD,
      page: () => const SleepManagementDashboardView(),
      binding: SleepManagementDashboardBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP_MANAGEMENT_DISCOVER,
      page: () => const SleepManagementDiscoverView(),
      binding: SleepManagementDiscoverBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP_MANAGEMENT_MEDIA_PLAYER,
      page: () => const SleepManagementMediaPlayerView(),
      binding: SleepManagementMediaPlayerBinding(),
    ),
    GetPage(
      name: _Paths.SLEEP_MANAGEMENT_NOTIFICATION,
      page: () => const SleepManagementNotificationView(),
      binding: SleepManagementNotificationBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT,
      page: () => const IntimacyManagementView(),
      binding: IntimacyManagementBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_INSIGHTS,
      page: () => const IntimacyManagementInsightsView(),
      binding: IntimacyManagementInsightsBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_COMMUNICATION_TIPS,
      page: () => const IntimacyManagementCommunicationTipsView(),
      binding: IntimacyManagementCommunicationTipsBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_CONVERSATION_STARTERS,
      page: () => const IntimacyManagementConversationStartersView(),
      binding: IntimacyManagementConversationStartersBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_LANGUAGE_OF_LOVE_QUOTES,
      page: () => const IntimacyManagementLanguageOfLoveQuotesView(),
      binding: IntimacyManagementLanguageOfLoveQuotesBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_CALENDAR,
      page: () => const IntimacyManagementCalendarView(),
      binding: IntimacyManagementCalendarBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_CONVERSATION_STARTERS_EXPLORE,
      page: () => const IntimacyManagementConversationStartersExploreView(),
      binding: IntimacyManagementConversationStartersExploreBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_ROMANTIC_SPOT,
      page: () => const IntimacyManagementRomanticSpotView(),
      binding: IntimacyManagementRomanticSpotBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_DASHBOARD,
      page: () => const BookDashboardView(),
      binding: BookDashboardBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_CART,
      page: () => const BookCartView(),
      binding: BookCartBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_ORDER,
      page: () => const BookOrderView(),
      binding: BookOrderBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_FAVORITES,
      page: () => const BookFavoritesView(),
      binding: BookFavoritesBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_YOUR_CLASS,
      page: () => const BookYourClassView(),
      binding: BookYourClassBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_LIST_OVERVIEW,
      page: () => const BookListOverviewView(),
      binding: BookListOverviewBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_WELL_COME,
      page: () => const BookWellComeView(),
      binding: BookWellComeBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION,
      page: () => const FertilityEducationView(),
      binding: FertilityEducationBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION_BLOG,
      page: () => const FertilityEducationBlogView(),
      binding: FertilityEducationBlogBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION_WEBINARS,
      page: () => const FertilityEducationWebinarsView(),
      binding: FertilityEducationWebinarsBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION_EBOOKS,
      page: () => const FertilityEducationEbooksView(),
      binding: FertilityEducationEbooksBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION_WELL_COME,
      page: () => const FertilityEducationWellComeView(),
      binding: FertilityEducationWellComeBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION_CATEGORY,
      page: () => const FertilityEducationCategoryView(),
      binding: FertilityEducationCategoryBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION_NOW_PLAYING,
      page: () => const FertilityEducationNowPlayingView(),
      binding: FertilityEducationNowPlayingBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION_EXPLORE_OUR_E_BOOK,
      page: () => const FertilityEducationExploreOurEBookView(),
      binding: FertilityEducationExploreOurEBookBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION_EXPLORE_OUR_E_BOOK_DETAIL,
      page: () => const FertilityEducationExploreOurEBookDetailView(),
      binding: FertilityEducationExploreOurEBookDetailBinding(),
    ),
    GetPage(
      name: _Paths.FERTILITY_EDUCATION_DISCOVER,
      page: () => const FertilityEducationDiscoverView(),
      binding: FertilityEducationDiscoverBinding(),
    ),
    GetPage(
      name: _Paths.BACK_TO_FORUM,
      page: () => const BackToForumView(),
      binding: BackToForumBinding(),
    ),
    GetPage(
      name: _Paths.ASK_QUESTION_FORUM,
      page: () => const AskQuestionForumView(),
      binding: AskQuestionForumBinding(),
    ),
    GetPage(
      name: _Paths.EXPERT_CONSULTATION_WELL_COME,
      page: () => const ExpertConsultationWellComeView(),
      binding: ExpertConsultationWellComeBinding(),
    ),
    GetPage(
      name: _Paths.EXPERT_CONSULTATION_GET_START,
      page: () => const ExpertConsultationGetStartView(),
      binding: ExpertConsultationGetStartBinding(),
    ),
    GetPage(
      name: _Paths.EXPERT_CONSULTATION_DASHBOARD,
      page: () => const ExpertConsultationDashboardView(),
      binding: ExpertConsultationDashboardBinding(),
    ),
    GetPage(
      name: _Paths.EXPERT_CONSULTATION_DISCOVER,
      page: () => const ExpertConsultationDiscoverView(),
      binding: ExpertConsultationDiscoverBinding(),
    ),
    GetPage(
      name: _Paths.EXPERT_CONSULTATION_BOOKING_DETAILS,
      page: () => const ExpertConsultationBookingDetailsView(),
      binding: ExpertConsultationBookingDetailsBinding(),
    ),
    GetPage(
      name: _Paths.EXPERT_CONSULTATION_COACH_PROFILE,
      page: () => const ExpertConsultationCoachProfileView(),
      binding: ExpertConsultationCoachProfileBinding(),
    ),
    GetPage(
      name: _Paths.EXPERT_CONSULTATION_PAYMENT,
      page: () => const ExpertConsultationPaymentView(),
      binding: ExpertConsultationPaymentBinding(),
    ),
    GetPage(
      name: _Paths.EXPERT_CONSULTATION_SUCCESS,
      page: () => const ExpertConsultationSuccessView(),
      binding: ExpertConsultationSuccessBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_TRAINER,
      page: () => const PersonalTrainerView(),
      binding: PersonalTrainerBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_TRAINER_FIND,
      page: () => const PersonalTrainerFindView(),
      binding: PersonalTrainerFindBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_TRAINER_BOOK,
      page: () => const PersonalTrainerBookView(),
      binding: PersonalTrainerBookBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_TRAINER_DASHBOARD,
      page: () => const PersonalTrainerDashboardView(),
      binding: PersonalTrainerDashboardBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_TRAINER_CHAT,
      page: () => const PersonalTrainerChatView(),
      binding: PersonalTrainerChatBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_TRAINER_FILL_OUT_YOUR_DETAILS,
      page: () => const PersonalTrainerFillOutYourDetailsView(),
      binding: PersonalTrainerFillOutYourDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_TRAINER_TRAINING_SESSION,
      page: () => const PersonalTrainerTrainingSessionView(),
      binding: PersonalTrainerTrainingSessionBinding(),
    ),
    GetPage(
      name: _Paths.EXPERT_CONSULTATION,
      page: () => const ExpertConsultationView(),
      binding: ExpertConsultationBinding(),
    ),
    GetPage(
      name: _Paths.SPERM_TEST_PACKAGE,
      page: () => const SpermTestPackageView(),
      binding: SpermTestPackageBinding(),
    ),
    GetPage(
      name: _Paths.SPERM_TEST_PACKAGE_NEARBY_CLINICS,
      page: () => const SpermTestPackageNearbyClinicsView(),
      binding: SpermTestPackageNearbyClinicsBinding(),
    ),
    GetPage(
      name: _Paths.SPERM_TEST_PACKAGE_HOSPITAL_SERDANG,
      page: () => const SpermTestPackageHospitalSerdangView(),
      binding: SpermTestPackageHospitalSerdangBinding(),
    ),
    GetPage(
      name: _Paths.SPERM_TEST_PACKAGE_YOUR_APPOINTMENTS,
      page: () => const SpermTestPackageYourAppointmentsView(),
      binding: SpermTestPackageYourAppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.SPERM_TEST_PACKAGE_PAYMENT,
      page: () => const SpermTestPackagePaymentView(),
      binding: SpermTestPackagePaymentBinding(),
    ),
    GetPage(
      name: _Paths.SPERM_TEST_PACKAGE_NEARBY_CLINICS_DETAIL,
      page: () => const SpermTestPackageNearbyClinicsDetailView(),
      binding: SpermTestPackageNearbyClinicsDetailBinding(),
    ),
    GetPage(
      name: _Paths.SPERM_TEST_PACKAGE_BOOKING_IS_CONFIRMED,
      page: () => const SpermTestPackageBookingIsConfirmedView(),
      binding: SpermTestPackageBookingIsConfirmedBinding(),
    ),
    GetPage(
      name: _Paths.LEARN_FROM,
      page: () => const LearnFromView(),
      binding: LearnFromBinding(),
    ),
    GetPage(
      name: _Paths.LEARN_FROM_DETAIL,
      page: () => const LearnFromDetailView(),
      binding: LearnFromDetailBinding(),
    ),
    GetPage(
      name: _Paths.FIND_PEACE,
      page: () => const FindPeaceView(),
      binding: FindPeaceBinding(),
    ),
    GetPage(
      name: _Paths.FIND_PEACE_DETAIL,
      page: () => const FindPeaceDetailView(),
      binding: FindPeaceDetailBinding(),
    ),
    GetPage(
      name: _Paths.TEL_DOC_HOME,
      page: () => const TelDocHomeView(),
      binding: TelDocHomeBinding(),
    ),
    GetPage(
      name: _Paths.TEL_DOC_CHAT,
      page: () => const TelDocChatView(),
      binding: TelDocChatBinding(),
    ),
    GetPage(
      name: _Paths.TEL_DOC_PROFILE,
      page: () => const TelDocProfileView(),
      binding: TelDocProfileBinding(),
    ),
    GetPage(
      name: _Paths.TEL_DOC_SCEDULE_CALL,
      page: () => const TelDocSceduleCallView(),
      binding: TelDocSceduleCallBinding(),
    ),
    GetPage(
      name: _Paths.TRAINER_NET_WEL_COME,
      page: () => const TrainerNetWelComeView(),
      binding: TrainerNetWelComeBinding(),
    ),
    GetPage(
      name: _Paths.TRAINER_NET_HOME,
      page: () => const TrainerNetHomeView(),
      binding: TrainerNetHomeBinding(),
    ),
    GetPage(
      name: _Paths.TRAINER_NET_APPOINTMENTS,
      page: () => const TrainerNetAppointmentsView(),
      binding: TrainerNetAppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.TRAINER_NET_MANAGE_APPOINTMENTS,
      page: () => const TrainerNetManageAppointmentsView(),
      binding: TrainerNetManageAppointmentsBinding(),
    ),
    GetPage(
      name: _Paths.TRAINER_NET_NOTIFICATION,
      page: () => const TrainerNetNotificationView(),
      binding: TrainerNetNotificationBinding(),
    ),
    GetPage(
      name: _Paths.LABORATORY_AND_CLINIC_HOME,
      page: () => const LaboratoryAndClinicHomeView(),
      binding: LaboratoryAndClinicHomeBinding(),
    ),
    GetPage(
      name: _Paths.LABORATORY_AND_CLINIC_MAP,
      page: () => const LaboratoryAndClinicMapView(),
      binding: LaboratoryAndClinicMapBinding(),
    ),
    GetPage(
      name: _Paths.LABORATORY_AND_CLINIC_SUCCESS,
      page: () => const LaboratoryAndClinicSuccessView(),
      binding: LaboratoryAndClinicSuccessBinding(),
    ),
    GetPage(
      name: _Paths.LABORATORY_AND_CLINIC_ORDER_STATUS,
      page: () => const LaboratoryAndClinicOrderStatusView(),
      binding: LaboratoryAndClinicOrderStatusBinding(),
    ),
    GetPage(
      name: _Paths.PRT_LOGIN,
      page: () => const PrtLoginView(),
      binding: PrtLoginBinding(),
    ),
    GetPage(
      name: _Paths.PRT_SIGN_UP,
      page: () => const PrtSignUpView(),
      binding: PrtSignUpBinding(),
    ),
    GetPage(
      name: _Paths.PRT_NAV_BAR,
      page: () => const PrtNavBarView(),
      binding: PrtNavBarBinding(),
    ),
    GetPage(
      name: _Paths.PRT_PROFILE,
      page: () => const PrtProfileView(),
      binding: PrtProfileBinding(),
    ),
    GetPage(
      name: _Paths.PRT_EDIT_PROFILE,
      page: () => const PrtEditProfileView(),
      binding: PrtEditProfileBinding(),
    ),
    GetPage(
      name: _Paths.PRT_RESET_PASSWORD,
      page: () => const PrtResetPasswordView(),
      binding: PrtResetPasswordBinding(),
    ),
    GetPage(
      name: _Paths.TRAINER_NET_ADD_APPOINTMENT,
      page: () => const TrainerNetAddAppointmentView(),
      binding: TrainerNetAddAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.TEL_DOC_CLIENT_DETAIL,
      page: () => const TelDocClientDetailView(),
      binding: TelDocClientDetailBinding(),
    ),
    GetPage(
      name: _Paths.TVS_SCAN_PACKAGE,
      page: () => const TvsScanPackageView(),
      binding: TvsScanPackageBinding(),
    ),
    GetPage(
      name: _Paths.TVS_SCAN_PACKAGE_DASHBORD,
      page: () => const TvsScanPackageDashbordView(),
      binding: TvsScanPackageDashbordBinding(),
    ),
    GetPage(
      name: _Paths.TVS_SCAN_PACKAGE_ADD_APPOINTMENT,
      page: () => const TvsScanPackageAddAppointmentView(),
      binding: TvsScanPackageAddAppointmentBinding(),
    ),
    GetPage(
      name: _Paths.TVS_SCAN_PACKAGE_DETAIL,
      page: () => const TvsScanPackageDetailView(),
      binding: TvsScanPackageDetailBinding(),
    ),
    GetPage(
      name: _Paths.BOOKING_BY_CALENDAR,
      page: () => const BookingByCalendarView(),
      binding: BookingByCalendarBinding(),
    ),
    GetPage(
      name: _Paths.WAITING_FOR_APPROVAL,
      page: () => const WaitingForApprovalView(),
      binding: WaitingForApprovalBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_LOVE_LANGUAGE_SUB_CATEGORY,
      page: () => const IntimacyManagementLoveLanguageSubCategoryView(),
      binding: IntimacyManagementLoveLanguageSubCategoryBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_GAMES,
      page: () => const IntimacyGamesView(),
      binding: IntimacyGamesBinding(),
    ),
    GetPage(
      name: _Paths.TEL_DOC_SET_AVAILABILITY,
      page: () => const TelDocSetAvailabilityView(),
      binding: TelDocSetAvailabilityBinding(),
    ),
    GetPage(
      name: _Paths.PRT_MY_PROFILE,
      page: () => const PrtMyProfileView(),
      binding: PrtMyProfileBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_CALENDAR_DETAIL,
      page: () => const CycleTrackingCalendarDetailView(),
      binding: CycleTrackingCalendarDetailBinding(),
    ),
    GetPage(
      name: _Paths.FORUM_TOPICS,
      page: () => const ForumTopicsView(),
      binding: ForumTopicsBinding(),
    ),
    GetPage(
      name: _Paths.FORUM_TOPICS_LIST,
      page: () => const ForumTopicsListView(),
      binding: ForumTopicsListBinding(),
    ),
    GetPage(
      name: _Paths.WEB_VIEW_FOR_PAYMENT,
      page: () => const WebViewForPaymentView(),
      binding: WebViewForPaymentBinding(),
    ),
    GetPage(
      name: _Paths.CONFIRM_BOOKING,
      page: () => const ConfirmBookingView(),
      binding: ConfirmBookingBinding(),
    ),
    GetPage(
      name: _Paths.CANCEL_BOOKING,
      page: () => const CancelBookingView(),
      binding: CancelBookingBinding(),
    ),
    GetPage(
      name: _Paths.FIND_PEACE_DETAIL_TWO,
      page: () => const FindPeaceDetailTwoView(),
      binding: FindPeaceDetailTwoBinding(),
    ),
    GetPage(
      name: _Paths.PDF_EBOOK,
      page: () => const PdfEbookView(),
      binding: PdfEbookBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_COMMUNICATION_TIPS_DETAIL,
      page: () => const IntimacyManagementCommunicationTipsDetailView(),
      binding: IntimacyManagementCommunicationTipsDetailBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_ADD_TEMPERATURE,
      page: () => const CycleTrackingAddTemperatureView(),
      binding: CycleTrackingAddTemperatureBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_CERVICAL_MUCUS_EGG,
      page: () => const CycleTrackingCervicalMucusEggView(),
      binding: CycleTrackingCervicalMucusEggBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_SYMTOPM_TRACKER_HISTORY,
      page: () => const CycleTrackingSymtopmTrackerHistoryView(),
      binding: CycleTrackingSymtopmTrackerHistoryBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_ADD_SYMTOPM_TRACKER,
      page: () => const CycleTrackingAddSymtopmTrackerView(),
      binding: CycleTrackingAddSymtopmTrackerBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_CONVERSATION_STARTERS_EXPLORE_DETAIL,
      page: () =>
          const IntimacyManagementConversationStartersExploreDetailView(),
      binding: IntimacyManagementConversationStartersExploreDetailBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_LOVE_LANGUAGE_SUB_CATEGORY_DETAIL,
      page: () => const IntimacyManagementLoveLanguageSubCategoryDetailView(),
      binding: IntimacyManagementLoveLanguageSubCategoryDetailBinding(),
    ),
    GetPage(
      name: _Paths.INTIMACY_MANAGEMENT_ROMANTIC_SPOT_DETAIL,
      page: () => const IntimacyManagementRomanticSpotDetailView(),
      binding: IntimacyManagementRomanticSpotDetailBinding(),
    ),
    GetPage(
      name: _Paths.CHAT_WITH_ADMIN,
      page: () => const ChatWithAdminView(),
      binding: ChatWithAdminBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_DASHBOARD_DETAIL,
      page: () => const NutritionalGuidanceDetailDashboardDetailView(),
      binding: NutritionalGuidanceDetailDashboardDetailBinding(),
    ),
    GetPage(
      name: _Paths.NUTRITIONAL_GUIDANCE_DETAIL_BLOG_DETAIL,
      page: () => const NutritionalGuidanceDetailBlogDetailView(),
      binding: NutritionalGuidanceDetailBlogDetailBinding(),
    ),
    GetPage(
      name: _Paths.CYCLE_TRACKING_ADD_CYCLE_DATA,
      page: () => const CycleTrackingAddCycleDataView(),
      binding: CycleTrackingAddCycleDataBinding(),
    ),
    GetPage(
      name: _Paths.WEB_VIEW_FOR_PDF,
      page: () => const WebViewForPdfView(),
      binding: WebViewForPdfBinding(),
    ),
    GetPage(
      name: _Paths.GENERAL_WELLNESS_BLOOD_TEST,
      page: () => const GeneralWellnessBloodTestView(),
      binding: GeneralWellnessBloodTestBinding(),
    ),
    GetPage(
      name: _Paths.QUIZ_ASSESMENT,
      page: () => const QuizAssesmentView(),
      binding: QuizAssesmentBinding(),
    ),
    GetPage(
      name: _Paths.MENOPAUSE_QUIZ_ASSESMENT,
      page: () => const MenopauseQuizAssesmentView(),
      binding: MenopauseQuizAssesmentBinding(),
    ),
    GetPage(
      name: _Paths.PCOS_QUIZ_ASSESSMENT,
      page: () => const PcosQuizAssessmentView(),
      binding: PcosQuizAssessmentBinding(),
    ),
    GetPage(
      name: _Paths.PREDIABETES_QUIZ_ASSESMENT,
      page: () => const PrediabetesQuizAssesmentView(),
      binding: PrediabetesQuizAssesmentBinding(),
    ),
    GetPage(
      name: _Paths.PRIVACY_POLICY,
      page: () => const PrivacyPolicyView(),
      binding: PrivacyPolicyBinding(),
    ),
    GetPage(
      name: _Paths.SOCIAL_SIGNUP,
      page: () => const SocialSignUpView(),
      binding: SocialSignUpBinding(),
    ),
  ];
}
