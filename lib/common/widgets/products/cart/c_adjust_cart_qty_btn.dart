import 'package:duara_ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CAdjustPQtyBtnWidget extends StatelessWidget {
  const CAdjustPQtyBtnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // -- buttons to add & remove items from cart
        CCircularIcon(
          icon: Iconsax.minus,
          width: 32.0,
          height: 32.0,
          size: CSizes.md,
          color: isDarkTheme ? CColors.white : CColors.rBrown,
          bgColor: isDarkTheme
              ? CColors.darkerGrey
              : CColors.rBrown.withOpacity(0.5),
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
          width: 32.0,
          height: 32.0,
          size: CSizes.md,
          color: CColors.white,
          bgColor: CColors.rBrown,
        ),
      ],
    );
  }
}
