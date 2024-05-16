import 'package:cached_network_image/cached_network_image.dart';
import 'package:duara_ecommerce/common/widgets/shimmers/shimmer_effect.dart';
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
    this.width,
    this.height,
    this.padding = CSizes.sm,
  });

  final BoxFit? fit;
  final String img;
  final bool isNetworkImg;
  final Color? overlayColor, bgColor;
  final double? width, height;
  final double padding;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color:
            isDarkTheme ? CColors.rBrown.withOpacity(0.3) : Colors.transparent,
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100.0),
        child: Center(
          child: isNetworkImg
              ? CachedNetworkImage(
                  fit: fit,
                  color: overlayColor,
                  imageUrl: img,
                  progressIndicatorBuilder: (context, url, progress) {
                    return const CShimmerEffect(
                      width: 55.0,
                      height: 55.0,
                      radius: 55.0,
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                )
              : Image(
                  fit: fit,
                  image: AssetImage(img),
                  color: overlayColor,
                ),
        ),
      ),
    );
  }
}
