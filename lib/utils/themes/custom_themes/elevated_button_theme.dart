import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RElevatedButtonTheme {
  RElevatedButtonTheme._(); // to avoid creating instances

  /* -- light mode(theme) -- */
  static final elevatedBtnLightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: RColors.white,
      backgroundColor: RColors.rBrown,
      disabledForegroundColor: RColors.grey,
      disabledBackgroundColor: RColors.grey,
      side: const BorderSide(
        color: RColors.rBrown,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      textStyle: const TextStyle(
        fontSize: 11.0,
        color: RColors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );

  /* -- dark mode(theme) -- */
  static final elevatedBtnDarkTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: RColors.white,
      backgroundColor: RColors.rBrown,
      disabledForegroundColor: RColors.grey,
      disabledBackgroundColor: RColors.grey,
      side: const BorderSide(
        color: RColors.rBrown,
      ),
      textStyle: const TextStyle(
        fontSize: 11.0,
        color: RColors.white,
        fontWeight: FontWeight.w600,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}
