import 'package:duara_ecommerce/features/authentication/screens/pswd_config/reset_password.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- headings --
            Text(
              RTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),

            const SizedBox(
              height: CSizes.spaceBtnItems,
            ),
            Text(
              RTexts.forgotPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium!.apply(
                    color: CColors.darkGrey,
                  ),
            ),
            const SizedBox(
              height: CSizes.spaceBtnSections * 2,
            ),

            // -- email textfield --
            TextFormField(
              style: const TextStyle(
                height: 0.7,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: RTexts.email,
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtnInputFields,
            ),

            // -- submit button --
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => const ResetPasswordScreen());
                },
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.labelMedium?.apply(
                        color: CColors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
