import 'dart:convert';

import 'package:fertility_boost/app/data/apis/api_models/products_by_id_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/common_widgets.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/address_by_user_id_model.dart';
import '../../../data/apis/api_models/booking_data_model.dart';
import '../../../data/apis/api_models/get_payment_token_model.dart';
import '../../../data/apis/api_models/payex_payment_model.dart';
import '../../../routes/app_pages.dart';

class EcommerceDetailController extends GetxController {
  final count = 0.obs;
  final inAsyncCall = false.obs;

  ProductsByIdModel? productsByIdModel;
  Product? product;
  Map<String, String?> parameters = Get.parameters;
  Map<String, dynamic> bodyParams = {};
  String productId = '';
  String userId = '';

  final quantity = 1.obs;
  final isLike = false.obs;

  AddressByUserIdModel? addressByUserIdModel;
  List<Address> address = [];
  final selectedAddressId = ''.obs;
  final selectedAddress = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    productId = parameters[ApiKeyConstants.productId].toString();
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

  clickOnFavoriteIcon() {
    isLike.value = !isLike.value;
  }

  clickOnBuyNowButton() async {
    inAsyncCall.value = true;
    if (selectedAddress.value.isNotEmpty) {
      Map<String, dynamic> data = {
        ApiKeyConstants.userId: userId,
        ApiKeyConstants.clinicId: '',
        ApiKeyConstants.testId: '',
        ApiKeyConstants.date: '',
        ApiKeyConstants.time: DateTime.now().toString(),
        ApiKeyConstants.doctorId: '',
        ApiKeyConstants.bookingType: 'product_booking',
        ApiKeyConstants.consultantfee: '',
        ApiKeyConstants.specialInstruction: '',
        ApiKeyConstants.trainerId: '',
        ApiKeyConstants.productData: jsonEncode({
          'product_id': product?.productId ?? '',
          'product_name': product?.productName ?? '',
          'product_price': product?.productPrice ?? '',
        }),
        ApiKeyConstants.testDataFromClinicId: '',
        ApiKeyConstants.address: selectedAddress.value,
      };
      BookingDataModel? bookingDataModel =
          await ApiMethods.booking(bodyParams: data);
      if (bookingDataModel != null &&
          bookingDataModel.data != null &&
          bookingDataModel.data!.id != null &&
          bookingDataModel.data!.id!.isNotEmpty) {
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
            ApiKeyConstants.amount: product?.productPrice,
            ApiKeyConstants.description: product?.productName,
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
      }
    } else {
      CommonWidgets.snackBarView(
          title: 'Please Select Address And Add Address');
    }
    inAsyncCall.value = false;
  }

  Future<void> onInitWork() async {
    await categoriesByMainCategoryIdApi();
    await addressByUserIdApi();
    increment();
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

  Future<void> categoriesByMainCategoryIdApi() async {
    bodyParams = {ApiKeyConstants.productId: productId.toString()};
    productsByIdModel = await ApiMethods.productsById(bodyParams: bodyParams);
    if (productsByIdModel != null && productsByIdModel!.product != null) {
      product = productsByIdModel!.product!;
    }
  }

  clickOnRemoveButton() {
    if (quantity > 1) {
      quantity.value--;
    }
  }

  clickOnAddButton() {
    quantity.value++;
  }

  clickOnAddAddress() async {
    await Get.toNamed(Routes.ADD_ADDRESS);
    await onInit();
  }
}
