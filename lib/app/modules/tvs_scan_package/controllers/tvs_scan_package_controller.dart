import 'package:fertility_boost/app/data/apis/api_constants/api_key_constants.dart';
import 'package:fertility_boost/app/data/apis/api_methods/api_methods.dart';
import 'package:get/get.dart';

import '../../../data/apis/api_models/TvsAppointmentModel.dart';

class TvsScanPackageController extends GetxController {
  //TODO: Implement TvsScanPackageController

  final count = 0.obs;
  final inAsyncCall = false.obs;
  String bookingType="tvs_scan";
  List<AppointmentList> appointmentList=[];
  getBooking()async{
    AppointmentModel? Data;
    Data =await ApiMethods.getTVSBookingAppointment
      (bodyParams:{ApiKeyConstants.bookingType:bookingType} );
    print("data from getTVSBookingAppointment----------${Data!.result} ") ;
    appointmentList=Data.result!;
  }
  @override
  Future<void> onInit() async {
    super.onInit();
    bookingType = Get.parameters[ApiKeyConstants.bookingType]??"tvs_scan";
    inAsyncCall.value=true;
    await getBooking();

    inAsyncCall.value=false;
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
}
