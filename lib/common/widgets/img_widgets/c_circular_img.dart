import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CCircularImg extends StatelessWidget {
  const CCircularImg({
    super.key,
    this.fit = BoxFit.cover,
    required this.img,
    this.isNetworkImg = false,
    this.overlayColor,
    this.bgColor,
    this.width = 56.0,
    this.height = 56.0,
    this.padding = CSizes.sm,
  });

  final BoxFit? fit;
  final String img;
  final bool isNetworkImg;
  final Color? overlayColor, bgColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: isDarkTheme ? CColors.rBrown : CColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImg
              ? NetworkImage(img)
              : AssetImage(img) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
