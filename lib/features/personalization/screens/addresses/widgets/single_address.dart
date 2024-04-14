import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CSingleAddress extends StatelessWidget {
  const CSingleAddress({
    super.key,
    required this.selectedAddress,
  });

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return CRoundedContainer(
      width: double.infinity,
      showBorder: true,
      padding: const EdgeInsets.all(CSizes.md),
      bgColor: selectedAddress
          ? CColors.rBrown.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDarkTheme
              ? CColors.darkerGrey
              : CColors.grey,
      margin: const EdgeInsets.only(
        bottom: CSizes.spaceBtnItems,
      ),
      child: Stack(
        children: [
          Positioned(
            right: 5.0,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress
                  ? isDarkTheme
                      ? CColors.light
                      : CColors.rBrown
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jack Bauer',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: selectedAddress
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.titleSmall!.apply(
                          color: CColors.darkGrey,
                        ),
              ),
              const SizedBox(
                height: CSizes.sm / 2,
              ),
              Text(
                '(+254) 746 683 785',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: selectedAddress
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.titleSmall!.apply(
                          color: CColors.darkGrey,
                        ),
              ),
              const SizedBox(
                height: CSizes.sm / 2,
              ),
              Text(
                '357 Lakerz Estate, Kisumu East, Kisumu, 40100, Kenya',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: selectedAddress
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.titleSmall!.apply(
                          color: CColors.darkGrey,
                        ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
