import 'package:flutter/material.dart';

class CRoundedImages extends StatelessWidget {
  const CRoundedImages({
    super.key,
    this.width,
    this.height,
    required this.imgUrl,
    required this.applyImgRadius,
    this.border,
    required this.bgColor,
    this.fit,
    this.padding,
    required this.isNetworkImg,
    this.onPressed,
    required this.borderRadius,
  });

  final double? width, height;
  final String imgUrl;
  final bool applyImgRadius;
  final BoxBorder? border;
  final Color bgColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImg;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
          border: border,
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImgRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImg
                ? NetworkImage(imgUrl)
                : AssetImage(imgUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
