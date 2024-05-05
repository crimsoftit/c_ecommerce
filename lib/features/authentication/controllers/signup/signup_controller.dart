import 'package:duara_ecommerce/data/repositories/auth/auth_repo.dart';
import 'package:duara_ecommerce/data/repositories/auth/user/user_repo.dart';
import 'package:duara_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:duara_ecommerce/features/personalization/models/user_model.dart';
import 'package:duara_ecommerce/utils/helpers/network_manager.dart';
import 'package:duara_ecommerce/utils/popups/snackbars.dart';
import 'package:duara_ecommerce/common/widgets/loaders/loading_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // -- variables --
  final hidePswdTxt = true.obs;
  final checkPrivacyPolicy = false.obs;

  final hideConfirmPswdTxt = true.obs;
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmPasswordd = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // -- firebase signup function --
  void signup() async {
    try {
      // -- start loader
      CLoadingDialog.showLoader("we're processing your info...");

      // CFullScreenLoader.openLoadingDialog(
      //   "we're processing your info...",
      //   CImages.aLoader_3,
      // );

      // -- check internet connectivity
      final isConnected = await CNetworkManager.instance.isConnected();
      if (!isConnected) {
        // -- remove loader
        CLoadingDialog.hideLoader();
        return;
      }

      // -- form validation
      if (!signupFormKey.currentState!.validate()) {
        // -- remove loader
        CLoadingDialog.hideLoader();
      }

      // -- privacy policy check
      if (!checkPrivacyPolicy.value) {
        CLoadingDialog.hideLoader();
        CPopupSnackBar.warningSnackBar(
            title: 'accept privacy policy',
            message:
                'to create an account, you must read and accept the privacy policy & terms of use!');
        return;
      }

      // -- register user implementing Firebase Authentication & save user data in the Firebase database
      final userCredentials =
          await AuthRepo.instance.signupWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // -- save user data in the Firestore database
      final newUser = CUserModel(
        id: userCredentials.user!.uid,
        fullName: fullName.text.trim(),
        email: email.text.trim(),
        phoneNo: phoneNumber.text.trim(),
        password: password.text.trim(),
        profPic: '',
      );

      final userRepo = Get.put(CUserRepo());
      await userRepo.saveUserDetails(newUser);

      // -- remove loader
      CLoadingDialog.hideLoader();

      // -- show signup success message
      CPopupSnackBar.successSnackBar(
          title: 'ngrats!',
          message:
              'your account has been created! verify your e-mail address to proceed!');

      // -- move to verify email screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // -- remove loader --
      CLoadingDialog.hideLoader();
      // -- show some generic error msg to the user
      CPopupSnackBar.errorSnackBar(
        title: 'Oh Snap!',
        message: e.toString(),
      );
      // -- remove loader --
      CLoadingDialog.hideLoader();
      return;
    }
  }
}
