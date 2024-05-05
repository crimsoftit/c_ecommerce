import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:duara_ecommerce/features/personalization/models/user_model.dart';
import 'package:duara_ecommerce/utils/popups/snackbars.dart';
import 'package:get/get.dart';

class CUserRepo extends GetxController {
  static CUserRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /* ===== save user data to firestore ===== */
  Future<void> saveUserDetails(CUserModel users) async {
    try {
      await _db.collection("users").doc(users.id).set(users.toJson());
    } on FirebaseException catch (e) {
      throw CPopupSnackBar.errorSnackBar(
        title: "firebase exception error",
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
    } catch (e) {
      CPopupSnackBar.errorSnackBar(
        title: "An error occurred",
        message: e.toString(),
      );
      throw 'something went wrong! please try again!';
    }
  }
}
