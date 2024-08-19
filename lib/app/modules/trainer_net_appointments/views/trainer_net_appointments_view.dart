import 'package:fertility_boost/app/data/constants/icons_constant.dart';
import 'package:fertility_boost/app/data/constants/image_constants.dart';
import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../controllers/trainer_net_appointments_controller.dart';

class TrainerNetAppointmentsView
    extends GetView<TrainerNetAppointmentsController> {
  const TrainerNetAppointmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonWidgets.appBarView(title: StringConstants.appointments),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.px),
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            SizedBox(height: 20.px),
            Text(
              "Recently saved",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 16.px),
            ),
            SizedBox(height: 20.px),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    tileColor: Theme.of(context)
                        .colorScheme
                        .onSecondary
                        .withOpacity(0.2.px),
                    visualDensity: VisualDensity(vertical: 4.px),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.px),
                    ),
                    leading: CommonWidgets.imageView(
                      image: ImageConstants.defaultNetworkImage,
                      radius: 25.px,
                      width: 50.px,
                      height: 50.px,
                    ),
                    title: Text(
                      "Runner Yoga",
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                              fontSize: 16.px,
                              color: Theme.of(context).primaryColor),
                    ),
                    trailing: Image.asset(IconConstants.icRightArrow,
                        width: 34.px, height: 34.px),
                  ),
                  SizedBox(height: 8.px)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
