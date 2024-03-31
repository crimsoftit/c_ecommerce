import 'package:duara_ecommerce/common/styles/shadows.dart';
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

class CProductCardVertical extends StatelessWidget {
  const CProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = CHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [CShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(CSizes.pImgRadius),
          color: isDark ? CColors.darkGrey : CColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // -- thumbnail, wishlist button, and discount tag --
            CRoundedContainer(
              height: 130,
              padding: const EdgeInsets.all(CSizes.sm),
              //bgColor: isDark ? CColors.dark : CColors.light,
              child: Stack(
                children: [
                  // thumbnail image
                  const CRoundedImages(
                    imgUrl: CImages.pImg1,
                    applyImgRadius: true,
                    width: 180,
                    padding: EdgeInsets.all(2.0),
                    //height: 120,
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

                  // product details
                ],
              ),
            ),
            const SizedBox(
              height: CSizes.spaceBtnItems / 4,
            ),

            // -- product details --
            const Padding(
              padding: EdgeInsets.only(
                left: CSizes.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CProductTitleText(
                    title: 'Acer laptop gen 10 with backlit keyboard',
                    smallSize: false,
                    txtAlign: TextAlign.left,
                  ),
                  CBrandTitleWithVerifiedIcon(
                    title: 'acer',
                  ),
                ],
              ),
            ),

            const Spacer(),

            // -- product price and add item to cart button --
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    left: CSizes.sm,
                  ),
                  child: CProductPriceText(
                    price: '30000',
                  ),
                ),

                // add item to cart button
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
    );
  }
}
