import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/p_attributes.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/p_details_img_slider.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/p_metadata.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/rating_share_widget.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                children: [
                  // - rating & share button

                  const CProductRatingWidget(),

                  // - price, title, stock, and brand
                  const CProductMetaData(),

                  // - product attributes
                  const CProductAttributes(),
                  const SizedBox(
                    height: CSizes.spaceBtnSections,
                  ),

                  // - checkout button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'checkout',
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
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtnSections,
                  ),

                  // - reviews
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
