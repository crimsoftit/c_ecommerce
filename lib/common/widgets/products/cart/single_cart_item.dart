import 'package:duara_ecommerce/common/widgets/img_widgets/c_rounded_img.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/c_brand_title_with_verified_icon.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/product_title_texts.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CSingleCartItem extends StatelessWidget {
  const CSingleCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // -- product image
        CRoundedImages(
          imgUrl: CImages.pImg1,
          width: 60.0,
          height: 60.0,
          padding: const EdgeInsets.all(CSizes.sm),
          bgColor:
              isDarkTheme ? CColors.rBrown.withOpacity(0.3) : CColors.light,
        ),
        const SizedBox(
          width: CSizes.spaceBtnItems,
        ),

        // -- product name/title, price, and size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CBrandTitleWithVerifiedIcon(
                title: 'Acer',
              ),
              const Flexible(
                child: CProductTitleText(
                  title: 'black acer gen 10 with backlit keyboard',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // product attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'color: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'green ',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontSizeFactor: 0.8,
                            //fontStyle: FontStyle.italic,
                          ),
                    ),
                    TextSpan(
                      text: ' size: ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'uk 08 ',
                      style: Theme.of(context).textTheme.bodyLarge!.apply(
                            fontSizeFactor: 0.8,
                            //fontStyle: FontStyle.italic,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
