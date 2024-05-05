import 'package:duara_ecommerce/features/authentication/screens/login/login.dart';
import 'package:duara_ecommerce/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:duara_ecommerce/utils/popups/snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();

  // -- variables --
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // -- called from main.dart on app launch --
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // -- function to load the relevant screen
  screenRedirect() async {
    // local storage
    // if (kDebugMode) {
    //   print('========== GET STORAGE (initially) ==========');
    //   print(deviceStorage.read('IsFirstTime'));
    // }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnboardingScreen());
    // if (kDebugMode) {
    //   print('========== GET STORAGE (after) ==========');
    //   print(deviceStorage.read('IsFirstTime'));
    // }
  }

  /* ========== email & password sign-in, registration ========== */

  // -- [EmailAuthentication] - register --
  Future<UserCredential> signupWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw CPopupSnackBar.errorSnackBar(
        title: "firbaseAuth exception error",
        message: e.code.toString(),
      );
    } on FirebaseException catch (e) {
      throw CPopupSnackBar.errorSnackBar(
        title: "firbase exception error",
        message: e.code.toString(),
      );
    } on FormatException catch (e) {
      // CPopupLoader.errorSnackBar(
      //   title: "format exception error",
      //   message: e.message,
      // );
      throw CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.message,
      );
    } on PlatformException catch (e) {
      // CPopupLoader.errorSnackBar(
      //   title: "platform exception error",
      //   message: e.code.toString(),
      // );
      throw CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.code.toString(),
      );
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "An error occurred",
        message: e.toString(),
      );
      throw 'something went wrong! please try again!';
    }
  }

  // -- [EmailAuthentication] - signIn --

  // -- [ReAuthenticate] - re-authenticate user --

  // -- [EmailVerification] - mail verification --
}
