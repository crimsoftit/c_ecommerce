import 'package:duara_ecommerce/features/authentication/screens/login/login.dart';
import 'package:duara_ecommerce/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();

  // -- variables --
  final deviceStorage = GetStorage();

  // -- called from main.dart on app launch --
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // -- function to load the relevant screen
  screenRedirect() async {
    // local storage
    if (kDebugMode) {
      print('========== GET STORAGE (initially) ==========');
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
    if (kDebugMode) {
      print('========== GET STORAGE (after) ==========');
      print(deviceStorage.read('IsFirstTime'));
    }
  }

  /* ---------- email & password sign-in ---------- */

  // -- [EmailAuthentication] - signIn --

  // -- [EmailAuthentication] - register --

  // -- [ReAuthenticate] - re-authenticate user --

  // -- [EmailVerification] - mail verification --
}
