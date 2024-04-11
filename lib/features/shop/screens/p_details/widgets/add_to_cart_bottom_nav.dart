import 'package:duara_ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CAddToCartBottomNavBar extends StatelessWidget {
  const CAddToCartBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: CSizes.defaultSpace,
        vertical: CSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: isDarkTheme ? CColors.rBrown.withOpacity(0.4) : CColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CSizes.cardRadiusLg),
          topRight: Radius.circular(CSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CCircularIcon(
                icon: Iconsax.minus,
                color: CColors.white,
                bgColor: CColors.rBrown.withOpacity(0.5),
                width: 40.0,
                height: 40.0,
              ),
              const SizedBox(
                width: CSizes.spaceBtnItems,
              ),
              Text(
                '3',
                style: Theme.of(context).textTheme.titleSmall!.apply(
                      fontSizeFactor: 0.85,
                    ),
              ),
              const SizedBox(
                width: CSizes.spaceBtnItems,
              ),
              const CCircularIcon(
                icon: Iconsax.add,
                color: CColors.white,
                bgColor: CColors.rBrown,
                width: 40.0,
                height: 40.0,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(
                CSizes.md,
              ),
              backgroundColor: CColors.rBrown,
              side: const BorderSide(
                color: CColors.rBrown,
              ),
            ),
            child: Text(
              'add to cart'.toUpperCase(),
              style: Theme.of(context).textTheme.labelMedium?.apply(
                    color: CColors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
