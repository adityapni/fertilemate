import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/laboratory_and_clinic_map_controller.dart';

class LaboratoryAndClinicMapView
    extends GetView<LaboratoryAndClinicMapController> {
  const LaboratoryAndClinicMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CommonWidgets.appBarView(title: "")
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              markers: {
                Marker(
                  markerId: const MarkerId('ll'),
                  position: LatLng(controller.lat, controller.long),
                  infoWindow: InfoWindow(title:"address"),
                )
              },
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              tiltGesturesEnabled: false,
              onCameraMove:(CameraPosition cameraPosition){
                print(cameraPosition.zoom);
              },
            minMaxZoomPreference: MinMaxZoomPreference(13,17),
            initialCameraPosition: CameraPosition(
                target: LatLng(controller.lat, controller.long),
                zoom: 14.4746,
              ),
              onMapCreated: (GoogleMapController googlecontroller) {
                controller.mapController.complete(googlecontroller);
              },
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.only(top: 50.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => controller.clickOnBack(),
                      child: Image.asset(IconConstants.icBack,
                          width: 34.px, height: 34.px),
                    ),
                    const Text(StringConstants.appointments),
                    const SizedBox(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
