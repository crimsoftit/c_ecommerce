import 'package:duara_ecommerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:duara_ecommerce/features/authentication/screens/signup/widgets/t_and_c_checkbox.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:duara_ecommerce/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class RSignupForm extends StatelessWidget {
  const RSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    FocusNode focusNode = FocusNode();
    return Form(
      key: signupController.signupFormKey,
      child: Column(
        children: [
          // -- full name field --
          TextFormField(
            controller: signupController.fullName,
            expands: false,
            style: const TextStyle(
              height: 0.7,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: 'full name',
            ),
            validator: (value) =>
                CValidator.validateFullName('full name', value),
          ),

          const SizedBox(
            height: CSizes.spaceBtnInputFields,
          ),

          // -- email field --
          TextFormField(
            controller: signupController.email,
            style: const TextStyle(
              height: 0.7,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: RTexts.email,
            ),
            validator: (value) => CValidator.validateEmail(value),
          ),

          const SizedBox(
            height: CSizes.spaceBtnInputFields,
          ),

          // -- phone number field --
          IntlPhoneField(
            controller: signupController.phoneNumber,
            initialCountryCode: 'KE',
            focusNode: focusNode,
            dropdownTextStyle: const TextStyle(
              fontSize: 10,
              fontFamily: 'Poppins',
              height: 0.8,
            ),
            decoration: const InputDecoration(
              counterText: '',
              label: Text('Phone number'),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2.0,
                  color: CColors.rBrown,
                ),
              ),
            ),
            style: const TextStyle(
              fontSize: 10,
              fontFamily: 'Poppins',
              height: 0.8,
            ),
            keyboardType: TextInputType.phone,
            languageCode: "en",
            onChanged: (phone) {
              //print(controller.cell_no.value);
            },
            onCountryChanged: (country) {
              print('country changed to: ${country.dialCode}');
            },
            validator: (phone) =>
                CValidator.validatePhoneNumber(phone.toString()),
          ),

          const SizedBox(
            height: CSizes.spaceBtnInputFields,
          ),

          // -- password field --
          Obx(
            () => TextFormField(
              controller: signupController.password,
              obscureText: signupController.hidePswdTxt.value,
              style: const TextStyle(
                height: 0.7,
              ),
              decoration: InputDecoration(
                labelText: RTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () {
                    signupController.hidePswdTxt.value =
                        !signupController.hidePswdTxt.value;
                  },
                  icon: Icon(
                    signupController.hidePswdTxt.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                    color: signupController.hidePswdTxt.value
                        ? CColors.grey
                        : CColors.rBrown,
                  ),
                ),
              ),
              validator: (value) => CValidator.validatePassword(value),
            ),
          ),

          const SizedBox(
            height: CSizes.spaceBtnInputFields,
          ),

          // -- confirm password field --
          Obx(
            () => TextFormField(
              controller: signupController.confirmPasswordd,
              obscureText: signupController.hideConfirmPswdTxt.value,
              style: const TextStyle(
                height: 0.7,
              ),
              decoration: InputDecoration(
                labelText: 're-type password',
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () {
                    signupController.hideConfirmPswdTxt.value =
                        !signupController.hideConfirmPswdTxt.value;
                  },
                  icon: Icon(
                    signupController.hideConfirmPswdTxt.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                    color: signupController.hideConfirmPswdTxt.value
                        ? CColors.grey
                        : CColors.rBrown,
                  ),
                ),
              ),
              validator: (value) => CValidator.validateConfirmPassword(
                  signupController.password.text, value),
            ),
          ),

          const SizedBox(
            height: CSizes.spaceBtnSections,
          ),

          // -- terms & conditions checkbox --
          const TandCCheckbox(),

          const SizedBox(
            height: CSizes.spaceBtnSections,
          ),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                //Get.to(() => const VerifyEmailScreen());
                signupController.signup();
              },
              child: Text(
                RTexts.createAccount.toUpperCase(),
                style: Theme.of(context).textTheme.labelMedium?.apply(
                      color: CColors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
