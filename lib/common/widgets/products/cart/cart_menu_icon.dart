import 'package:duara_ecommerce/features/shop/screens/cart/cart.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CCartCounterIcon extends StatelessWidget {
  const CCartCounterIcon({
    super.key,
    this.iconColor,
  });

  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CCartScreen()),
          icon: Icon(
            Iconsax.shopping_bag,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: CColors.darkerGrey,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Text(
                '2',
                style: Theme.of(context).textTheme.labelSmall!.apply(
                      color: Colors.white,
                      fontSizeFactor: 1.0,
                    ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
