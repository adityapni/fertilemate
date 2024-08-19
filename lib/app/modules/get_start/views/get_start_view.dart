import 'package:fertility_boost/app/data/constants/string_constants.dart';
import 'package:fertility_boost/common/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../data/constants/image_constants.dart';
import '../controllers/get_start_controller.dart';

class GetStartView extends GetView<GetStartController> {
  const GetStartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageConstants.imageBgGetStart),
          fit: BoxFit.cover
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(),
              Image.asset(
                ImageConstants.imageLogo,
                height: 140.px,
                width: 140.px,
              ),
              Column(
                children: [
                  Text(
                    StringConstants.fertileMate,
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  SizedBox(height: 20.px),
                  Text(
                    StringConstants
                        .boostYourFertilityJourneyWithPersonalizedInsights,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontSize: 16.px,
                        ),
                  ),
                  SizedBox(height: 40.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnUserButton(),
                    child: Text(
                      StringConstants.user,
                      style:
                          Theme.of(context).textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                  SizedBox(height: 14.px),
                  CommonWidgets.commonElevatedButton(
                    onPressed: () => controller.clickOnPartnerButton(),
                    child: Text(
                      StringConstants.partner,
                      style:
                      Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () => controller.clickOnPartnerButton(),
                  //   child: Text(
                  //     StringConstants.partner,
                  //     style:
                  //         Theme.of(context).textTheme.headlineSmall?.copyWith(
                  //               fontWeight: FontWeight.w700,
                  //               color: Theme.of(context).primaryColor,
                  //             ),
                  //   ),
                  // )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
