import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class RChipTheme {
  RChipTheme._();

  static ChipThemeData lightChipTheme = const ChipThemeData(
    disabledColor: CColors.lightGrey,
    //disabledColor: rGrey.withOpacity(0.4),
    labelStyle: TextStyle(
      color: CColors.rBrown,
    ),
    selectedColor: rBlue,
    padding: EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12.0,
    ),
    checkmarkColor: CColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: CColors.lightGrey,
    labelStyle: TextStyle(
      color: CColors.white,
    ),
    selectedColor: rBlue,
    padding: EdgeInsets.symmetric(
      horizontal: 12.0,
      vertical: 12.0,
    ),
    checkmarkColor: CColors.white,
  );
}
