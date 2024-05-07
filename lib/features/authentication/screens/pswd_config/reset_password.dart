import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // -- header image --
              Image(
                image: const AssetImage(
                  CImages.deliveredEmailIllustration,
                ),
                width: CHelperFunctions.screenWidth() * 0.6,
              ),
              const SizedBox(
                height: CSizes.spaceBtnSections,
              ),

              // -- title & subtitle --
              Text(
                CTexts.resetPswdTitle,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),
              Text(
                'crimsoftit@gmail.com',
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: CColors.darkerGrey,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),
              Text(
                CTexts.resetPswdSubTitle,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: CColors.darkGrey,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtnSections,
              ),

              // -- buttons --
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    'Done',
                    style: Theme.of(context).textTheme.labelMedium?.apply(
                          color: CColors.white,
                        ),
                  ),
                ),
              ),

              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    CTexts.resendEmail,
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
