import 'package:duara_ecommerce/common/widgets/success_screen/success_screen.dart';
import 'package:duara_ecommerce/features/authentication/screens/login/login.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.offAll(() => const LoginScreen());
            },
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            RSizes.defaultSpace,
          ),
          child: Column(
            children: [
              // -- header image --
              Image(
                image: const AssetImage(RImages.deliveredEmailIllustration),
                width: RHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: RSizes.spaceBtnSections,
              ),

              // -- title & subtitle --
              Text(
                RTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: RSizes.spaceBtnItems,
              ),
              Text(
                'crimsoftit@gmail.com',
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: RColors.darkerGrey,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: RSizes.spaceBtnItems,
              ),
              Text(
                RTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: RColors.darkGrey,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: RSizes.spaceBtnSections,
              ),

              // -- buttons --
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => SuccessScreen(
                          image: RImages.staticSuccessIllustration,
                          title: RTexts.accountCreatedTitle,
                          subTitle: RTexts.accountCreatedSubTitle,
                          onPressed: () {
                            Get.to(() => const LoginScreen());
                          },
                        ));
                  },
                  child: Text(
                    'CONTINUE',
                    style: Theme.of(context).textTheme.labelMedium?.apply(
                          color: RColors.white,
                        ),
                  ),
                ),
              ),
              const SizedBox(
                height: RSizes.spaceBtnItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    RTexts.resendEmail,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
