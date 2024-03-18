import 'package:duara_ecommerce/common/widgets/login_signup/form_divider.dart';
import 'package:duara_ecommerce/common/widgets/login_signup/social_buttons.dart';
import 'package:duara_ecommerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // -- title --
              Text(
                RTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: RSizes.spaceBtnSections,
              ),

              // -- signup form --
              const RSignupForm(),

              // -- divider --
              RFormDivider(
                dividerText: RTexts.orSignInWith.capitalize!,
              ),

              const SizedBox(
                height: RSizes.spaceBtnSections,
              ),

              // -- footer --
              const RSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
