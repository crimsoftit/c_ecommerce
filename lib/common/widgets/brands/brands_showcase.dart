import 'package:duara_ecommerce/common/widgets/brands/c_brand_cards.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:duara_ecommerce/features/shop/models/brands_model.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CBrandedShowcase extends StatelessWidget {
  const CBrandedShowcase({
    super.key,
    required this.productImages,
  });

  final List<String> productImages;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      showBorder: true,
      borderColor: CColors.rBrown,
      bgColor: Colors.transparent,
      padding: const EdgeInsets.all(
        CSizes.md,
      ),
      margin: const EdgeInsets.only(
        bottom: CSizes.spaceBtnItems,
      ),
      child: Column(
        children: [
          // brand with products count
          CBrandCard(
            showBorder: false,
            brand: CBrandModel.empty(),
          ),
          const SizedBox(
            height: CSizes.spaceBtnItems,
          ),

          // brand top 3 product images
          Row(
            children: productImages
                .map((pImg) => brandTopProductsImgWidget(pImg, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductsImgWidget(String img, context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return Expanded(
      child: CRoundedContainer(
        height: 100.0,
        bgColor: isDarkTheme ? CColors.darkerGrey : CColors.light,
        margin: const EdgeInsets.only(
          right: CSizes.sm,
        ),
        padding: const EdgeInsets.all(
          CSizes.md,
        ),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(
            img,
          ),
        ),
      ),
    );
  }
}
