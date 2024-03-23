import 'package:duara_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:duara_ecommerce/features/authentication/screens/signup/widgets/t_and_c_checkbox.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
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
    FocusNode focusNode = FocusNode();
    return Form(
      child: Column(
        children: [
          // -- full name field --
          TextFormField(
            expands: false,
            style: const TextStyle(
              height: 0.7,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: 'full name',
            ),
          ),

          const SizedBox(
            height: CSizes.spaceBtnInputFields,
          ),

          // -- username field --
          TextFormField(
            expands: false,
            style: const TextStyle(
              height: 0.7,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user_edit),
              labelText: RTexts.username,
            ),
          ),

          const SizedBox(
            height: CSizes.spaceBtnInputFields,
          ),

          // -- email field --
          TextFormField(
            style: const TextStyle(
              height: 0.7,
            ),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: RTexts.email,
            ),
          ),

          const SizedBox(
            height: CSizes.spaceBtnInputFields,
          ),

          // -- phone number field --
          IntlPhoneField(
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
              //print('country changed to: ${country.code}');
            },
          ),

          const SizedBox(
            height: CSizes.spaceBtnInputFields,
          ),

          // -- password field --
          TextFormField(
            obscureText: true,
            style: const TextStyle(
              height: 0.7,
            ),
            decoration: const InputDecoration(
              labelText: RTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
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
                Get.to(() => const VerifyEmailScreen());
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
