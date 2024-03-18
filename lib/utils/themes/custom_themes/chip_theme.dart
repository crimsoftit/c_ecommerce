import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RChipTheme {
  RChipTheme._();

  static ChipThemeData lightChipTheme = const ChipThemeData(
    disabledColor: RColors.lightGrey,
    //disabledColor: rGrey.withOpacity(0.4),
    labelStyle: TextStyle(
      color: RColors.rBrown,
    ),
    selectedColor: rBlue,
    padding: EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12.0,
    ),
    checkmarkColor: RColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: RColors.lightGrey,
    labelStyle: TextStyle(
      color: RColors.white,
    ),
    selectedColor: rBlue,
    padding: EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12.0,
    ),
    checkmarkColor: RColors.white,
  );
}
