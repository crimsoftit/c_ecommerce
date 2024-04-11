import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/add_to_cart_bottom_nav.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/p_attributes.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/p_details_img_slider.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/p_metadata.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/rating_share_widget.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: const CAddToCartBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- product image slider --
            const CProductImgSlider(),

            // -- product details display --
            Padding(
              padding: const EdgeInsets.only(
                right: CSizes.defaultSpace,
                left: CSizes.defaultSpace,
                bottom: CSizes.defaultSpace,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // - rating & share button

                  const CProductRatingWidget(),

                  // - price, title, stock, and brand
                  const CProductMetaData(),

                  // - product attributes
                  const CProductAttributes(),
                  const SizedBox(
                    height: CSizes.spaceBtnSections / 3,
                  ),

                  // - checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'checkout'.toUpperCase(),
                        style: Theme.of(context).textTheme.labelMedium?.apply(
                              color: CColors.white,
                            ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtnSections,
                  ),

                  // - product description
                  const CSectionHeading(
                    showActionBtn: false,
                    title: 'description',
                    btnTitle: '',
                    editFontSize: false,
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtnItems,
                  ),

                  const ReadMoreText(
                    'this is a product description for acer generation 10 laptop with backlit keyboard',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' show more',
                    trimExpandedText: 'less',
                    moreStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const Divider(),
                  const SizedBox(
                    height: CSizes.spaceBtnItems,
                  ),

                  // - reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 10,
                        child: CSectionHeading(
                          showActionBtn: false,
                          title: 'reviews (1999)',
                          btnTitle: 'view all',
                          editFontSize: true,
                          onPressed: () {},
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Iconsax.arrow_right_34,
                            size: 18.0,
                            color: isDarkTheme ? CColors.white : CColors.rBrown,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtnSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
