import 'dart:convert';

import 'package:fertility_boost/app/data/apis/api_models/address_by_user_id_model.dart';
import 'package:fertility_boost/app/data/apis/api_models/carts_model.dart';
import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/booking_data_model.dart';
import '../../../data/apis/api_models/get_payment_token_model.dart';
import '../../../data/apis/api_models/payex_payment_model.dart';

class CartController extends GetxController {
  final count = 0.obs;
  TextEditingController searchController = TextEditingController();
  final hideCvv = false.obs;
  final inAsyncCall = false.obs;
  Map<String, dynamic> bodyParams = {};
  Map<String, dynamic> bodyParamsForCarts = {};
  Map<String, dynamic> bodyParamsForDeleteCarts = {};
  Map<String, dynamic> bodyParamsForAddCarts = {};
  List<Map<String, dynamic>> productData = [];
  String userId = '';
  String totalAmount = '';

  AddressByUserIdModel? addressByUserIdModel;
  List<Address> address = [];
  final selectedAddress = ''.obs;
  final selectedAddressId = ''.obs;

  CartsModel? cartsModel;
  List<Cart> cart = [];

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
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

  clickOnListTile({required int index}) {}

  clickOnEyeButton() {}

  clickOnCheckOutButton() async {
    if (cartsModel!.total != null &&
        cartsModel!.total != 0 &&
        selectedAddress.value.isNotEmpty) {
      inAsyncCall.value = true;
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
        ApiKeyConstants.productData: jsonEncode(productData),
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
            ApiKeyConstants.amount: cartsModel!.totalAmount.toString(),
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
      }
      inAsyncCall.value = false;
    } else {
      CommonWidgets.snackBarView(
          title: 'Please Select Address And Add Address');
    }
  }

  clickOnAddAddress() async {
    await Get.toNamed(Routes.ADD_ADDRESS);
    await onInit();
  }

  Future<void> onInitWork() async {
    inAsyncCall.value = true;
    await addressByUserIdApi();
    await cartsApi();
    inAsyncCall.value = false;
  }

  Future<void> addressByUserIdApi() async {
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
  }

  Future<void> cartsApi() async {
    bodyParamsForCarts = {ApiKeyConstants.userId: userId.toString()};
    cartsModel = await ApiMethods.carts(bodyParams: bodyParamsForCarts);
    if (cartsModel != null && cartsModel!.cart!.isNotEmpty) {
      cart = cartsModel!.cart!;
      increment();
      for (var element in cart) {
        productData.add({
          'product_id': element.productData?.productId,
          'product_name': element.productData?.productName,
          'product_quantity': element.cartQuantity,
          'product_price':
              (double.parse(element.productData?.productPriceFinal ?? '0') *
                      double.parse(element.cartQuantity ?? '0'))
                  .toString(),
        });
        cartsModel!.totalAmount =
            ((double.parse(element.productData?.productPriceFinal ?? '0') *
                        double.parse(element.cartQuantity ?? '0')) +
                    double.parse(cartsModel?.totalAmount ?? '0'))
                .toString();
      }
    }
  }

  clickOnDeleteIcon({required int index}) async {
    inAsyncCall.value = true;
    bodyParamsForDeleteCarts = {
      ApiKeyConstants.cartId: cart[index].cartId.toString()
    };
    http.Response? response =
        await ApiMethods.deleteCarts(bodyParams: bodyParamsForDeleteCarts);
    if (response != null && response.statusCode == 200) {
      await onInitWork();
    }
    inAsyncCall.value = false;
  }

  clickOnRemoveIcon({required int index}) async {
    if (int.parse(cart[index].cartQuantity.toString()) > 1) {
      inAsyncCall.value = true;
      bodyParamsForAddCarts = {
        ApiKeyConstants.productId:
            cart[index].productData?.productId.toString(),
        ApiKeyConstants.userId: userId.toString(),
        ApiKeyConstants.cartId: cart[index].cartId.toString(),
        ApiKeyConstants.cartQuantity:
            "${int.parse(cart[index].cartQuantity.toString()) - 1}",
      };
      http.Response? response =
          await ApiMethods.updateCartById(bodyParams: bodyParamsForAddCarts);
      if (response != null && response.statusCode == 200) {
        await onInitWork();
      }
      inAsyncCall.value = false;
    }
  }

  clickOnAddIcon({required int index}) async {
    inAsyncCall.value = true;
    bodyParamsForAddCarts = {
      ApiKeyConstants.productId: cart[index].productData?.productId.toString(),
      ApiKeyConstants.userId: userId.toString(),
      ApiKeyConstants.cartId: cart[index].cartId.toString(),
      ApiKeyConstants.cartQuantity:
          "${int.parse(cart[index].cartQuantity.toString()) + 1}",
    };
    http.Response? response =
        await ApiMethods.updateCartById(bodyParams: bodyParamsForAddCarts);
    if (response != null && response.statusCode == 200) {
      await onInitWork();
    }
    inAsyncCall.value = false;
  }
}
