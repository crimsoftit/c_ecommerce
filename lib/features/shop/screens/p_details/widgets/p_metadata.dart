import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:duara_ecommerce/common/widgets/img_widgets/c_circular_img.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/c_brand_title_with_verified_icon.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/p_price_txt.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/product_title_texts.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/enums.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CProductMetaData extends StatelessWidget {
  const CProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // -- price & sale tag
        Row(
          children: [
            // sale tag
            CRoundedContainer(
              radius: CSizes.sm,
              bgColor: CColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                horizontal: CSizes.sm,
                vertical: CSizes.xs,
              ),
              child: Text(
                '25%',
                style: Theme.of(context).textTheme.labelSmall!.apply(
                      color: CColors.rBrown,
                      //fontSizeFactor: 0.7,
                    ),
              ),
            ),

            const SizedBox(
              width: CSizes.spaceBtnItems / 1.5,
            ),

            // price
            Text(
              'ksh.2500',
              style: Theme.of(context).textTheme.labelSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
            const SizedBox(
              width: CSizes.spaceBtnItems,
            ),
            const CProductPriceText(
              price: '2000',
              isLarge: true,
            ),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBtnItems / 1.5,
        ),

        // -- title
        const CProductTitleText(
          title: 'Acer laptop gen 10 with backlit keyboard',
        ),

        const SizedBox(
          height: CSizes.spaceBtnItems / 1.5,
        ),

        // -- stock status
        Row(
          children: [
            const CProductTitleText(
              title: 'status',
            ),
            const SizedBox(
              width: CSizes.spaceBtnItems,
            ),
            Text(
              'in stock (20 available)',
              style: Theme.of(context).textTheme.titleMedium!.apply(
                    fontSizeFactor: 0.7,
                  ),
            ),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBtnItems / 1.5,
        ),

        // -- brand
        Row(
          children: [
            CCircularImg(
              img: CImages.cosmeticsIcon,
              width: 32.0,
              height: 32.0,
              overlayColor: isDarkTheme ? CColors.white : CColors.rBrown,
            ),
            const SizedBox(
              width: CSizes.spaceBtnItems / 4,
            ),
            const CBrandTitleWithVerifiedIcon(
              title: 'Acer',
              brandTxtSize: CTextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
