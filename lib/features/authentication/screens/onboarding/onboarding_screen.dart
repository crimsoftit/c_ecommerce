import 'package:duara_ecommerce/features/authentication/controllers/onboarding/ob_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/features/authentication/screens/onboarding/widgets/ob_dot_nav_widget.dart';
import 'package:duara_ecommerce/features/authentication/screens/onboarding/widgets/ob_next_btn_widget.dart';
import 'package:duara_ecommerce/features/authentication/screens/onboarding/widgets/ob_screen_widget.dart';
import 'package:duara_ecommerce/features/authentication/screens/onboarding/widgets/ob_skip_btn_widget.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obController = Get.put(OnboardingController());

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          // -- horizontal scrollable pages
          PageView(
            controller: obController.pageController,
            onPageChanged: obController.updatePageIndicator,
            children: const [
              OnboardingScreenWidget(
                img: RImages.rOnboardingImg1,
                title: RTexts.rOnbaordingTitle1,
                subTitle: RTexts.rOnbaordingSubTitle1,
              ),
              OnboardingScreenWidget(
                img: RImages.rOnboardingImg2,
                title: RTexts.rOnbaordingTitle2,
                subTitle: RTexts.rOnbaordingSubTitle2,
              ),
              OnboardingScreenWidget(
                img: RImages.rOnboardingImg3,
                title: RTexts.rOnbaordingTitle3,
                subTitle: RTexts.rOnbaordingSubTitle3,
              ),
            ],
          ),

          // -- skip button
          const OnboardingSkipBtnWidget(),

          // -- dot navigation SmoothPageIndicator
          const OnboardingDotNavWidget(),

          // -- circular button
          const OnboardingNextBtnWidget(),
        ],
      ),
    );
  }
}
