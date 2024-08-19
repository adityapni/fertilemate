import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../controllers/intimacy_management_romantic_spot_detail_controller.dart';

class IntimacyManagementRomanticSpotDetailView
    extends GetView<IntimacyManagementRomanticSpotDetailController> {
  const IntimacyManagementRomanticSpotDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        appBar: CommonWidgets.appBarView(),
        body: controller.result != null
            ? Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.px),
                child: ListView(
                  children: [
                    CommonWidgets.imageView(
                      image: controller.result!.image.toString(),
                      height: 300.px,
                      width: double.infinity,
                      radius: 10.px,
                      fit: BoxFit.cover,
                    ),
                    if (controller.result!.name != null &&
                        controller.result!.name!.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.result!.name != null &&
                        controller.result!.name!.isNotEmpty)
                      Text(
                        controller.result!.name.toString(),
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    if (controller.result!.description != null &&
                        controller.result!.description!.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.result!.description != null &&
                        controller.result!.description!.isNotEmpty)
                      Html(
                        data: controller.result!.description.toString(),
                      ),
                    if (controller.result!.addreess != null &&
                        controller.result!.addreess!.isNotEmpty)
                      SizedBox(height: 10.px),
                    if (controller.result!.addreess != null &&
                        controller.result!.addreess!.isNotEmpty)
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              Clipboard.setData(ClipboardData(
                                      text: controller.result!.addreess
                                          .toString()))
                                  .then((_) {
                                CommonWidgets.snackBarView(
                                    title: 'Copied to your clipboard !');
                              });
                            },
                            borderRadius: BorderRadius.circular(8.px),
                            child: Padding(
                              padding: EdgeInsets.all(4.px),
                              child: Icon(
                                Icons.copy,
                                size: 24.px,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.px),
                          Flexible(
                            child: InkWell(
                              onLongPress: () async {
                                Clipboard.setData(ClipboardData(
                                  text: controller.result!.addreess.toString(),
                                )).then((_) async {
                                  /*final query =
                                      "1600 Amphiteatre Parkway, Mountain View";
                                  var addresses = await Geocoder.local
                                      .findAddressesFromQuery(query);
                                  var first = addresses.first;
                                  print(
                                      "${first.featureName} : ${first.coordinates}");*/

                                  CommonWidgets.snackBarView(
                                      title: 'Copied to your clipboard !');
                                });
                              },
                              borderRadius: BorderRadius.circular(4.px),
                              child: Padding(
                                padding: EdgeInsets.all(4.px),
                                child: Text(
                                  controller.result!.addreess.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(fontSize: 12.px),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              )
            : Center(child: CommonWidgets.dataNotFound()),
      );
    });
  }
}
