import 'package:duara_ecommerce/features/authentication/screens/login/login.dart';
import 'package:duara_ecommerce/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:duara_ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:duara_ecommerce/nav_menu.dart';
import 'package:duara_ecommerce/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:duara_ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:duara_ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:duara_ecommerce/utils/exceptions/platform_exceptions.dart';
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
    // remove the native splash screen
    FlutterNativeSplash.remove();

    // redirect to the relevant screen
    screenRedirect();
  }

  // -- function to load the relevant screen
  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
      // local storage
      deviceStorage.writeIfNull('IsFirstTime', true);

      // check if it's the first time launching the app
      deviceStorage.read('IsFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnboardingScreen());
    }
  }

  /* ==== email & password sign-in, registration ===== */

  // -- [EmailAuthentication] - signIn --
  Future<UserCredential> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebaseAuth exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebase exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FormatException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.message,
      );
      throw CFormatExceptions(e.message);
    } on PlatformException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.code.toString(),
      );
      throw CPlatformExceptions(e.code).message;
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "An error occurred",
        message: e.toString(),
      );
      throw 'something went wrong! please try again later.';
    }
  }

  // -- [EmailAuthentication] - register --
  Future<UserCredential> signupWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebaseAuth exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebase exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FormatException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.message,
      );
      throw CFormatExceptions(e.message);
    } on PlatformException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.code.toString(),
      );
      throw CPlatformExceptions(e.code).message;
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "An error occurred",
        message: e.toString(),
      );
      throw 'something went wrong! please try again!';
    }
  }

  // -- [EmailAuthentication] -- MAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebaseAuth exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "firebase exception error",
        message: e.code.toString(),
      );
      throw CFirebaseAuthExceptions(e.code).message;
    } on FormatException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.message,
      );
      throw CFormatExceptions(e.message);
    } on PlatformException catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "platform exception error",
        message: e.code.toString(),
      );
      throw CPlatformExceptions(e.code).message;
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "An error occurred",
        message: e.toString(),
      );
      throw 'something went wrong! please try again!';
    }
  }

  /// -- [ReAuthenticate] - re-authenticate user --

  /// -- [EmailVerification] - forgot password --

  /* ===== federated identity & social media sign-in ===== */

  /// -- [GoogleAuthentication] - GOOGLE --
  /// -- [FacebookAuthentication] - FACEBOOK --

  /* ===== ./end federated identity & social media sign-in ===== */
  /// -- [LogoutUser] - valid for any authentication --
  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw CFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw CFirebaseExceptions(e.code).message;
    } on FormatException catch (e) {
      throw CFormatExceptions(e.message);
    } on PlatformException catch (e) {
      throw CPlatformExceptions(e.code).message;
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: 'unknown error!',
        message: e.toString(),
      );
      throw 'something went wrong! please try again later';
    }
  }

  /// -- [DeleteUser] - remove user Auth & Firestore account --
}
