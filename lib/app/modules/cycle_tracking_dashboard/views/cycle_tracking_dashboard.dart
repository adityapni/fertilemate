import 'package:fertility_boost/app/modules/cycle_tracking_dashboard/controllers/cycle_tracking_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../common/common_widgets.dart';
import '../../../../common/progress_bar.dart';
import '../../../data/constants/icons_constant.dart';

class CycleTrackingDashboardView
    extends GetView<CycleTrackingDashboardController> {
  const CycleTrackingDashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return ProgressBar(
        inAsyncCall: controller.inAsyncCall.value,
        child: Scaffold(
          appBar: CommonWidgets.appBarView(
            title: 'Welcome to MyCycle!',
          ),
          body: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*SizedBox(height: 20.px),
                    ListTile(
                      leading: SizedBox(
                        height: 60.px,
                        width: 60.px,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.px),
                          child: Image.asset(
                            ImageConstants.imageGirl,
                            height: 60.px,
                            width: 60.px,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(
                        'Welcome to MyCycle!',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 16.px,
                                color: Theme.of(context).primaryColor),
                      ),
                      subtitle: Text(
                        'Hey There',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 12.px, color: Color(0xff9E9FA5)),
                      ),
                    ),*/
                    SizedBox(height: 20.px),
                    Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child: InkWell(
                                  onTap: () => controller.clickOnCalendar(),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      height: 60.px,
                                      width: 60.px,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.px),
                                        child: Image.asset(
                                          IconConstants.icCalender,
                                          height: 60.px,
                                          width: 60.px,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Track your syre',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            fontSize: 12.px,
                                            color: Colors.grey),
                                  ),
                                  SizedBox(height: 10.px),
                                  Text(
                                    'Cycle statistics',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                          fontSize: 16.px,
                                        ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 10.px),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                title: Text(
                                  'Cycle Length',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 10.px, color: Colors.grey),
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                                subtitle: Text(
                                  '28 Days',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                title: Text(
                                  'Period Duration',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 10.px, color: Colors.grey),
                                ),
                                titleAlignment: ListTileTitleAlignment.center,
                                subtitle: Text(
                                  '5 Days',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: ListTile(
                                title: Text(
                                  'Average Cycle',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                          fontSize: 10.px, color: Colors.grey),
                                ),
                                subtitle: Text(
                                  '31 Days',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium
                                      ?.copyWith(
                                        fontSize: 14.px,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.px),
                    Text(
                      'Your current cycle',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(fontSize: 18.px),
                    ),
                    SizedBox(height: 20.px),
                    ListTile(
                      onTap: () {
                        controller.clickOnListTile(id: '1');
                      },
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.px, horizontal: 10.px),
                      // leading: SizedBox(
                      //   height: 40.px,width: 40.px,
                      // ),
                      title: Text(
                        'Basal body temperature ',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18.px,
                        color: Theme.of(Get.context!).colorScheme.primary,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        controller.clickOnListTile(id: '2');
                      },
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.px, horizontal: 10.px),
                      // leading: SizedBox(
                      //   height: 40.px,width: 40.px,
                      // ),
                      title: Text(
                        'Cervical mucus condition Egg white consistency',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18.px,
                        color: Theme.of(Get.context!).colorScheme.primary,
                      ),
                    ),
                    /*  ListTile(
                      onTap: () {
                        controller.clickOnListTile(id: '3');
                      },
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.px, horizontal: 10.px),
                      // leading: SizedBox(
                      //   height: 40.px,width: 40.px,
                      // ),
                      title: Text(
                        'Predicted ovulation day Day 14',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18.px,
                        color: Theme.of(Get.context!).colorScheme.primary,
                      ),
                    ),*/
                    ListTile(
                      onTap: () {
                        controller.clickOnListTile(id: '4');
                      },
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.px, horizontal: 10.px),
                      // leading: SizedBox(
                      //   height: 40.px,width: 40.px,
                      // ),
                      title: Text(
                        'Ultrasound Image',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18.px,
                        color: Theme.of(Get.context!).colorScheme.primary,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        controller.clickOnListTile(id: '5');
                      },
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.px, horizontal: 10.px),
                      // leading: SizedBox(
                      //   height: 40.px,width: 40.px,
                      // ),
                      title: Text(
                        'Symtopm Tracker',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18.px,
                        color: Theme.of(Get.context!).colorScheme.primary,
                      ),
                    ),
                    /*   ListTile(
                      onTap: () {
                        controller.clickOnListTile(id: '6');
                      },
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.px, horizontal: 10.px),
                      // leading: SizedBox(
                      //   height: 40.px,width: 40.px,
                      // ),
                      title: Text(
                        'Contraception Tracking',
                        style:
                            Theme.of(context).textTheme.displayMedium?.copyWith(
                                  fontSize: 14.px,
                                ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios_outlined,
                        size: 18.px,
                        color: Theme.of(Get.context!).colorScheme.primary,
                      ),
                    ),*/
                    SizedBox(height: 20.px),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
