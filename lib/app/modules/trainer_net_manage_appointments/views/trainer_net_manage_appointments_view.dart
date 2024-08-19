import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../data/constants/image_constants.dart';
import '../controllers/trainer_net_manage_appointments_controller.dart';

class TrainerNetManageAppointmentsView
    extends GetView<TrainerNetManageAppointmentsController> {
  const TrainerNetManageAppointmentsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CommonWidgets.appBarView(
          title: StringConstants.appointmentsConfirmation,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 50.px,
              ),
              for (int i = 0; i < 7; i++)
                Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .colorScheme
                          .onSecondary
                          .withOpacity(0.2.px),
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      controller.ClickOnCard();
                    },
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(ImageConstants.imageGirl),
                      ),
                      title: Text(
                        "Jaxson Geidt",
                        style: TextStyle(
                            color: Color(0xff115571),
                            fontSize: 17,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ));
  }
}
