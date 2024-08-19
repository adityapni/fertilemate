import 'package:fertility_boost/app/routes/app_pages.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../common/time_picker_view.dart';
import '../../../data/apis/api_constants/api_key_constants.dart';
import '../../../data/apis/api_methods/api_methods.dart';
import '../../../data/apis/api_models/address_by_user_id_model.dart';
import '../../../data/apis/api_models/booking_data_model.dart';
import '../../../data/apis/api_models/get_payment_token_model.dart';
import '../../../data/apis/api_models/payex_payment_model.dart';

class BookingByCalendarController extends GetxController {
  final inAsyncCall = false.obs;
  final count = 0.obs;
  TextEditingController timeController = TextEditingController();
  List listOfListTile = [
    {'title': 'Doctor And Mental Doctor'},
    {'title': 'Trainer And Nutrition'},
    {'title': 'Laboratories'},
  ];
  String testDataFromClinicId = '';
  String bookingType = '';
  String consultantFee = '';
  String trainerId = '';
  String productData = '';
  String doctorId = '';
  String title = '';
  String subTitle = '';
  String description = '';
  DateTime date = DateTime.now();
  String time = '';
  String clinicId = '';
  String testId = '';
  String userId = '';

  TextEditingController specialInstructionController = TextEditingController();

  var selectedRadioTrainersCategory;

  final selectedIndexValue = 0.obs;

  AddressByUserIdModel? addressByUserIdModel;
  List<Address> address = [];
  final selectedAddress = ''.obs;
  final selectedAddressId = ''.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    userId = sharedPreferences.getString(ApiKeyConstants.userId) ?? '';
    super.onInit();
    bookingType = Get.parameters[ApiKeyConstants.bookingType] ?? "";
    testDataFromClinicId =
        Get.parameters[ApiKeyConstants.testDataFromClinicId] ?? "";
    doctorId = Get.parameters[ApiKeyConstants.doctorId] ?? "";
    title = Get.parameters[ApiKeyConstants.title] ?? '';
    subTitle = Get.parameters[ApiKeyConstants.subTitle] ?? '';
    description = Get.parameters[ApiKeyConstants.description] ?? '';
    clinicId = Get.parameters[ApiKeyConstants.clinicId] ?? '';
    testId = Get.parameters[ApiKeyConstants.testId] ?? '';
    consultantFee = Get.parameters[ApiKeyConstants.consultantfee] ?? '';
    specialInstructionController.text =
        Get.parameters[ApiKeyConstants.specialInstruction] ?? '';
    trainerId = Get.parameters[ApiKeyConstants.trainerId] ?? '';
    productData = Get.parameters[ApiKeyConstants.productData] ?? '';
    // await addressByUserIdApi();
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  clickOnTime() async {
    TimeOfDay? picked = await TimePickerView()
        .timePickerView(color: Theme.of(Get.context!).primaryColor);
    if (picked != null) {
      timeController.text = picked.format(Get.context!);
      increment();
    }
  }

  clickOnBookNow() async {
    inAsyncCall.value = true;
    if (date == '') {
      CommonWidgets.snackBarView(title: "please select date");
    } else if (timeController.text == '') {
      CommonWidgets.snackBarView(title: "please select time");
    } else {
      try {
        Map<String, dynamic> data = {
          ApiKeyConstants.userId: userId,
          ApiKeyConstants.clinicId: clinicId,
          ApiKeyConstants.testId: testId,
          ApiKeyConstants.date: date.toString(),
          ApiKeyConstants.time: timeController.text.toString(),
          ApiKeyConstants.doctorId: doctorId,
          ApiKeyConstants.bookingType: bookingType,
          ApiKeyConstants.consultantfee: consultantFee,
          ApiKeyConstants.specialInstruction: specialInstructionController.text,
          ApiKeyConstants.trainerId: trainerId,
          ApiKeyConstants.productData: productData,
          ApiKeyConstants.testDataFromClinicId: testDataFromClinicId,
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
              ApiKeyConstants.userId: userId.toString(),
              ApiKeyConstants.date: date.toString(),
              ApiKeyConstants.amount: consultantFee.toString(),
              ApiKeyConstants.description:
                  specialInstructionController.text.toString(),
              ApiKeyConstants.token:
                  getPaymentTokenModel.result!.token.toString(),
              ApiKeyConstants.currency: CommonWidgets.cur.toString(),
              ApiKeyConstants.expiryDate:
                  getPaymentTokenModel.result!.expiration.toString(),
              ApiKeyConstants.bookingId: bookingDataModel.data!.id.toString(),
              ApiKeyConstants.testDataFromClinicId:
                  testDataFromClinicId.toString(),
              // ApiKeyConstants.clinicId: clinicId,
              // ApiKeyConstants.testId: testId,
              // ApiKeyConstants.bookingType: bookingType,
              // ApiKeyConstants.specialInstruction: specialInstruction,
              // ApiKeyConstants.trainerId: trainerId,
              // ApiKeyConstants.time: timeController.text.toString(),
              // ApiKeyConstants.doctorId: doctorId,
            };
            PayexPaymentModel? payexPaymentModel =
                await ApiMethods.payexPayment(bodyParams: bodyParams);
            if (payexPaymentModel != null &&
                payexPaymentModel.result != null &&
                payexPaymentModel.result!.resultList != null &&
                payexPaymentModel.result!.resultList!.isNotEmpty &&
                payexPaymentModel.result!.resultList!.first.url != null &&
                payexPaymentModel.result!.resultList!.first.url!.isNotEmpty) {
              Map<String, String> parameters = {
                ApiKeyConstants.paymentUrl:
                    payexPaymentModel.result!.resultList!.first.url!.toString()
              };
              Get.toNamed(Routes.WEB_VIEW_FOR_PAYMENT, parameters: parameters);
              /* if (!await launchUrl(
                Uri.parse(
                  payexPaymentModel.result!.resultList!.first.url!.toString(),
                ),
              )) {
                throw Exception('Could not launch ${Uri.parse(payexPaymentModel.result!.resultList!.first.url!.toString())}');
              } */
            }
          }
        }
      } catch (err) {
        print('err::::::$err');
      }
    }
    /*else if (selectedAddress.value.isNotEmpty) {
      try {
        Map<String, dynamic> data = {
          ApiKeyConstants.userId: userId,
          ApiKeyConstants.clinicId: clinicId,
          ApiKeyConstants.testId: testId,
          ApiKeyConstants.date: date.toString(),
          ApiKeyConstants.time: timeController.text.toString(),
          ApiKeyConstants.doctorId: doctorId,
          ApiKeyConstants.bookingType: bookingType,
          ApiKeyConstants.consultantfee: consultantFee,
          ApiKeyConstants.specialInstruction: specialInstructionController.text,
          ApiKeyConstants.trainerId: trainerId,
          ApiKeyConstants.productData: productData,
          ApiKeyConstants.testDataFromClinicId: testDataFromClinicId,
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
              ApiKeyConstants.userId: userId.toString(),
              ApiKeyConstants.date: date.toString(),
              ApiKeyConstants.amount: consultantFee.toString(),
              ApiKeyConstants.description:
                  specialInstructionController.text.toString(),
              ApiKeyConstants.token:
                  getPaymentTokenModel.result!.token.toString(),
              ApiKeyConstants.currency: CommonWidgets.cur.toString(),
              ApiKeyConstants.expiryDate:
                  getPaymentTokenModel.result!.expiration.toString(),
              ApiKeyConstants.bookingId: bookingDataModel.data!.id.toString(),
              ApiKeyConstants.testDataFromClinicId:
                  testDataFromClinicId.toString(),
              // ApiKeyConstants.clinicId: clinicId,
              // ApiKeyConstants.testId: testId,
              // ApiKeyConstants.bookingType: bookingType,
              // ApiKeyConstants.specialInstruction: specialInstruction,
              // ApiKeyConstants.trainerId: trainerId,
              // ApiKeyConstants.time: timeController.text.toString(),
              // ApiKeyConstants.doctorId: doctorId,
            };
            PayexPaymentModel? payexPaymentModel =
                await ApiMethods.payexPayment(bodyParams: bodyParams);
            if (payexPaymentModel != null &&
                payexPaymentModel.result != null &&
                payexPaymentModel.result!.resultList != null &&
                payexPaymentModel.result!.resultList!.isNotEmpty &&
                payexPaymentModel.result!.resultList!.first.url != null &&
                payexPaymentModel.result!.resultList!.first.url!.isNotEmpty) {
              Map<String, String> parameters = {
                ApiKeyConstants.paymentUrl:
                    payexPaymentModel.result!.resultList!.first.url!.toString()
              };
              Get.toNamed(Routes.WEB_VIEW_FOR_PAYMENT, parameters: parameters);
              */
    /* if (!await launchUrl(
                Uri.parse(
                  payexPaymentModel.result!.resultList!.first.url!.toString(),
                ),
              )) {
                throw Exception('Could not launch ${Uri.parse(payexPaymentModel.result!.resultList!.first.url!.toString())}');
              } */
    /*
            }
          }
        }
      } catch (err) {
        print('err::::::$err');
      }
    } else {
      CommonWidgets.snackBarView(
          title: 'Please Select Address And Add Address');
    }*/
    inAsyncCall.value = false;
  }

  clickOnAddAddress() async {
    await Get.toNamed(Routes.ADD_ADDRESS);
    await onInit();
  }
}
