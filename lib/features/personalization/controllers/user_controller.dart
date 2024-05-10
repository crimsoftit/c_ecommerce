import 'package:duara_ecommerce/data/repositories/auth/user/user_repo.dart';
import 'package:duara_ecommerce/features/personalization/models/user_model.dart';
import 'package:duara_ecommerce/utils/popups/snackbars.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class CUserController extends GetxController {
  static CUserController get instance => Get.find();

  final userRepo = Get.put(CUserRepo());

  /// save user details from any reg/authentication provide
  Future<void> saveUserDetails(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        // -- map user data
        final user = CUserModel(
          id: userCredentials.user!.uid,
          fullName: userCredentials.user!.displayName ?? '',
          email: userCredentials.user!.email ?? '',
          phoneNo: userCredentials.user!.phoneNumber ?? '',
          profPic: userCredentials.user!.photoURL ?? '',
        );
        // -- save user data
        await userRepo.saveUserDetails(user);
      } else {
        CPopupSnackBar.warningSnackBar(
          title: 'userCredentials NULL',
          message: 'userCredentials NULL',
        );
      }
    } catch (e) {
      CPopupSnackBar.warningSnackBar(
        title: 'login details not saved!',
        message:
            'something went wrong while saving your login info! you can re-save your info in your profile.',
      );
    }
  }
}
