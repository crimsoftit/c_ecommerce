import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:duara_ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:duara_ecommerce/common/widgets/img_widgets/c_rounded_img.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/c_brand_title_with_verified_icon.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/p_price_txt.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/product_title_texts.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CProductCardHorizontal extends StatelessWidget {
  const CProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        //boxShadow: [CShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(CSizes.pImgRadius),
        color: isDark ? CColors.darkGrey : CColors.rBrown.withOpacity(0.1),
      ),
      child: Row(
        children: [
          // -- thumbnail --
          CRoundedContainer(
            height: 120.0,
            padding: const EdgeInsets.all(CSizes.sm),
            bgColor: isDark ? CColors.dark : CColors.rBrown.withOpacity(0.1),
            child: Stack(
              children: [
                // -- thumbnail image
                const SizedBox(
                  width: 120,
                  height: 120.0,
                  child: CRoundedImages(
                    imgUrl: CImages.pImg27,
                    applyImgRadius: true,
                  ),
                ),

                // sale tag
                Positioned(
                  top: 12.0,
                  child: CRoundedContainer(
                    radius: CSizes.sm,
                    bgColor: CColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                      horizontal: CSizes.sm,
                      vertical: CSizes.xs,
                    ),
                    child: Text(
                      '25%',
                      style: Theme.of(context).textTheme.labelSmall!.apply(
                            color: CColors.black,
                            //fontSizeFactor: 0.7,
                          ),
                    ),
                  ),
                ),

                // favorite icon button
                const Positioned(
                  top: 0,
                  right: 0,
                  child: CCircularIcon(
                    icon: Iconsax.heart5,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),

          // -- product details --
          SizedBox(
            width: 172.0,
            child: Padding(
              padding: const EdgeInsets.only(
                top: CSizes.sm,
                left: CSizes.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CProductTitleText(
                        title: 'iPhone 8 plus; black in color',
                        smallSize: false,
                      ),
                      SizedBox(
                        height: CSizes.spaceBtnItems / 2,
                      ),
                      CBrandTitleWithVerifiedIcon(
                        title: 'iPhone',
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: CSizes.spaceBtnSections,
                  // ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // -- pricing
                      const Flexible(
                        child: CProductPriceText(
                          price: '26,000.00 - 30,000.00',
                        ),
                      ),

                      // -- add item to cart button
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: const BoxDecoration(
                          color: CColors.rBrown,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(CSizes.cardRadiusMd),
                            bottomRight: Radius.circular(CSizes.pImgRadius),
                          ),
                        ),
                        child: const SizedBox(
                          width: CSizes.iconLg * 1.2,
                          height: CSizes.iconLg * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: CColors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
