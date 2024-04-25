import 'package:duara_ecommerce/common/widgets/loaders/animation_loader.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/* === a utility class to handle a full-screen loading dialog === */
class CFullScreenLoader {
  static void openLoadingDialog(String txt, String animator) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: CHelperFunctions.isDarkMode(Get.context!)
              ? CColors.dark
              : CColors.rBrown.withOpacity(0.1),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250.0,
              ),
              CAnimationLoaderWidget(
                text: txt,
                animation: animator,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // -- stop the currently open loading dialog --
  // this method doesn't return anything
  static stopLoader() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
