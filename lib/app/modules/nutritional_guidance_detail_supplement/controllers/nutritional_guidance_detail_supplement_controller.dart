import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/address_by_user_id_model.dart';
import '../../../data/apis/api_models/get_payment_token_model.dart';
import '../../../data/apis/api_models/get_suppliment_plan_model.dart';
import '../../../data/apis/api_models/payex_payment_model.dart';
import '../../../routes/app_pages.dart';

class NutritionalGuidanceDetailSupplementController extends GetxController {
  final count = 0.obs;

  final inAsyncCall = false.obs;

  GetSupplementPlanModel? getSupplementPlanModel;
  List<GetSupplementPlanResult> getSupplementPlanResult = [];
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};

  String subCategoryId = '';
  String userId = '';

  final quantity = 1.obs;
  final selectedAddress = ''.obs;
  final selectedAddressId = ''.obs;
  final amount = 0.obs;

  AddressByUserIdModel? addressByUserIdModel;
  List<Address> address = [];

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    subCategoryId = parameters[ApiKeyConstants.subCategoryId].toString();
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

  clickOnCheckOutButton() async {
    if (/*cartsModel!.total != null &&
        cartsModel!.total != 0 &&*/
        selectedAddress.isNotEmpty) {
      inAsyncCall.value = true;
      GetPaymentTokenModel? getPaymentTokenModel =
          await ApiMethods.getPaymentToken();
      if (getPaymentTokenModel != null &&
          getPaymentTokenModel.result != null &&
          getPaymentTokenModel.result!.token != null &&
          getPaymentTokenModel.result!.token!.isNotEmpty &&
          getPaymentTokenModel.result!.expiration != null &&
          getPaymentTokenModel.result!.expiration!.isNotEmpty) {
        Map<String, dynamic> bodyParams = {
          ApiKeyConstants.userId: userId,
          ApiKeyConstants.date: "",
          ApiKeyConstants.amount: amount.value.toString(),
          ApiKeyConstants.description: 'Booking By Cart',
          ApiKeyConstants.token: getPaymentTokenModel.result!.token,
          ApiKeyConstants.currency: CommonWidgets.cur,
          ApiKeyConstants.expiryDate: getPaymentTokenModel.result!.expiration
        };
        PayexPaymentModel? payexPaymentModel =
            await ApiMethods.payexPayment(bodyParams: bodyParams);
        if (payexPaymentModel != null &&
            payexPaymentModel.result != null &&
            payexPaymentModel.result!.resultList != null &&
            payexPaymentModel.result!.resultList!.isNotEmpty &&
            payexPaymentModel.result!.resultList!.first.url != null &&
            payexPaymentModel.result!.resultList!.first.url!.isNotEmpty) {
          if (!await launchUrl(
            Uri.parse(
              payexPaymentModel.result!.resultList!.first.url!.toString(),
            ),
          )) {
            throw Exception(
                'Could not launch ${Uri.parse(payexPaymentModel.result!.resultList!.first.url!.toString())}');
          }
        }
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(
          title: 'Please Select Address And Add Address');
    }
  }

  clickOnDeleteIcon({required int index}) {}

  clickOnRemoveIcon({required int index}) {
    if (index == 0) if (quantity.value > 1) {
      quantity.value--;
    }
    increment();
  }

  clickOnAddIcon({required int index}) {
    if (index == 0) quantity.value++;
    increment();
  }

  Future<void> onInitWork() async {
    await addressByUserIdApi();
    await getSupplementPlanApi();
  }

  Future<void> addressByUserIdApi() async {
    inAsyncCall.value = true;
    Map<String, String> bodyParams = {
      ApiKeyConstants.userId: userId.toString()
    };
    addressByUserIdModel =
        await ApiMethods.addressByUserId(bodyParams: bodyParams);
    if (addressByUserIdModel != null &&
        addressByUserIdModel!.address!.isNotEmpty) {
      address = addressByUserIdModel!.address!;
      if (address.isNotEmpty) {
        selectedAddressId.value = address.first.addressId ?? '';
        selectedAddress.value =
            '${address.first.addressName} ${address.first.addressStreetAddress} ${address.first.addressCity} ${address.first.addressState} ${address.first.addressPostalCode}';
      }
    }
    inAsyncCall.value = false;
  }

  Future<void> getSupplementPlanApi() async {
    bodyParams = {ApiKeyConstants.subCategoryId: subCategoryId.toString()};
    getSupplementPlanModel =
        await ApiMethods.getSupplementPlan(bodyParams: bodyParams);
    if (getSupplementPlanModel != null &&
        getSupplementPlanModel!.result!.isNotEmpty) {
      getSupplementPlanResult = getSupplementPlanModel!.result!;
      if (getSupplementPlanResult.isNotEmpty) {
        getSupplementPlanResult.forEach((element) {
          amount.value = amount.value + int.parse(element.amount ?? '');
          increment();
        });
      }
    }
  }

  clickOnAddAddress() async {
    await Get.toNamed(Routes.ADD_ADDRESS);
    await onInit();
  }
}
