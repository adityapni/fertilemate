import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:scrollable_clean_calendar/controllers/clean_calendar_controller.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/categories_by_main_category_id_model.dart';

class CycleTrackingController extends GetxController {
  final count = 0.obs;
  final calendarController = CleanCalendarController(
    minDate: DateTime.now(),
    maxDate: DateTime.now().add(const Duration(days: 365)),
    onRangeSelected: (firstDate, secondDate) {},
    onDayTapped: (date) {},
    // readOnly: true,
    onPreviousMinDateTapped: (date) {},
    onAfterMaxDateTapped: (date) {},
    weekdayStart: DateTime.monday,
    // initialFocusDate: DateTime(2023, 5),
    // initialDateSelected: DateTime(2022, 3, 15),
    // endDateSelected: DateTime(2022, 3, 20),
  );

  final selectedCard = 0.obs;
  final inAsyncCall = false.obs;
  CategoriesByMainCategoryIdModel? categoriesByMainCategoryIdModel;
  List<Data> data = [];
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String mainCategoryId = '';

  @override
  Future<void> onInit() async {
    mainCategoryId = parameters[ApiKeyConstants.mainCategoryId].toString();
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

  clickOnListTile({required int index}) {
    selectedCard.value = index;
  }

  clickOnContinueButton() {
    Map<String, String> parameter = {
      ApiKeyConstants.categoryId:
          data[selectedCard.value].categoryId.toString()
    };
    Get.toNamed(Routes.CYCLE_TRACKING_SECOND, parameters: parameter);
  }

  Future<void> onInitWork() async {
    await categoriesByMainCategoryIdApi();
  }

  Future<void> categoriesByMainCategoryIdApi() async {
    bodyParams = {ApiKeyConstants.mainCategoryId: mainCategoryId.toString()};
    categoriesByMainCategoryIdModel =
        await ApiMethods.categoriesByMainCategoryId(bodyParams: bodyParams);
    if (categoriesByMainCategoryIdModel != null &&
        categoriesByMainCategoryIdModel!.data!.isNotEmpty) {
      data = categoriesByMainCategoryIdModel!.data!;
    }
  }
}
