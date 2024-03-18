import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RBottomSheetTheme {
  RBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: RColors.white,
    modalBackgroundColor: RColors.white,
    constraints: const BoxConstraints(
      minWidth: double.infinity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: RColors.rBrown,
    modalBackgroundColor: RColors.rBrown,
    constraints: const BoxConstraints(
      minWidth: double.infinity,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
    ),
  );
}
