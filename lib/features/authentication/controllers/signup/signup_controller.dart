import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/helpers/network_manager.dart';
import 'package:duara_ecommerce/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // -- variables --
  final fullName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final confirmPasswordd = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // -- firebase signup function --
  Future<void> signup() async {
    try {
      // -- start loader
      CFullScreenLoader.openLoadingDialog(
        "we're processing your info...",
        CImages.aLoader_1,
      );

      // -- check internet connectivity
      final isConnected = await CNetworkManager.instance.isConnected();

      // -- form validation

      // -- privacy polcy check

      // -- register user implementing Firebase Authentication & save user data in the Firebase database

      // -- save user data in the Firestore database

      // -- show signup success message

      // -- move to verify email screen
    } catch (e) {
      // -- show some generic error msg to the user
    } finally {
      // -- remove loader
    }
  }
}
