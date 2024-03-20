import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CVerticalImgTxt extends StatelessWidget {
  const CVerticalImgTxt({
    super.key,
    required this.img,
    required this.title,
    required this.txtColor,
    this.bgColor,
    this.onTap,
  });

  final String img, title;
  final Color txtColor;
  final Color? bgColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(
          right: RSizes.spaceBtnItems,
        ),
        child: Column(
          children: [
            // -- circular icon --
            Container(
              width: 56.0,
              height: 56.0,
              padding: const EdgeInsets.all(RSizes.sm),
              decoration: BoxDecoration(
                color: bgColor ?? (isDark ? RColors.darkerGrey : RColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                  color: isDark ? RColors.light : RColors.dark,
                ),
              ),
            ),

            const SizedBox(
              height: RSizes.spaceBtnItems / 2,
            ),

            // -- categories texts --
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: txtColor,
                    ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
