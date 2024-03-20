import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/device/device_utility.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CSearchContainer extends StatelessWidget {
  const CSearchContainer({
    super.key,
    required this.text,
    this.icon,
    this.showBg = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBg, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: RSizes.defaultSpace,
        ),
        child: Container(
          width: RDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(RSizes.md),
          decoration: BoxDecoration(
            color: showBg
                ? isDark
                    ? RColors.dark
                    : RColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(RSizes.cardRadiusLg),
            border: showBorder
                ? Border.all(
                    color: RColors.grey,
                  )
                : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: RColors.darkGrey,
              ),
              const SizedBox(
                width: RSizes.spaceBtnItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall!.apply(
                      color: RColors.darkGrey,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
