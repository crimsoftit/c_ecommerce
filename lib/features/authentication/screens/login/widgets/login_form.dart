import 'package:duara_ecommerce/features/authentication/screens/pswd_config/forgot_password.dart';
import 'package:duara_ecommerce/features/authentication/screens/signup/signup.dart';
import 'package:duara_ecommerce/nav_menu.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtnSections),
        child: Column(
          children: [
            // -- email field --
            TextFormField(
              style: const TextStyle(
                height: 0.7,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: CTexts.email,
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtnInputFields,
            ),

            // -- password field --
            TextFormField(
              style: const TextStyle(
                height: 0.7,
              ),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: CTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBtnInputFields / 2,
            ),

            // -- remember me & forgot password checkbox and textbutton --
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // -- remember me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    Text(
                      CTexts.rememberMe,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                  ],
                ),

                // -- forgot password
                TextButton(
                  onPressed: () {
                    Get.to(() => const ForgotPasswordScreen());
                  },
                  child: Text(
                    CTexts.forgotPassword,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: CSizes.spaceBtnInputFields / 2,
            ),

            // -- sign in button --
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => const NavMenu());
                },
                child: Text(
                  CTexts.signIn.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium?.apply(
                        color: CColors.white,
                      ),
                ),
              ),
            ),

            const SizedBox(
              height: CSizes.spaceBtnItems / 2,
            ),

            // -- create account button --
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Get.to(() => const SignupScreen());
                },
                child: Text(
                  CTexts.createAccount.toUpperCase(),
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
