import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/p_details_img_slider.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/p_metadata.dart';
import 'package:duara_ecommerce/features/shop/screens/p_details/widgets/rating_share_widget.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // -- product image slider --
            CProductImgSlider(),

            // -- product details display --
            Padding(
              padding: EdgeInsets.only(
                right: CSizes.defaultSpace,
                left: CSizes.defaultSpace,
                bottom: CSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  // - rating & share button

                  CProductRatingWidget(),

                  // - price, title, stock, and brand
                  CProductMetaData(),

                  // - product attributes

                  // - checkout button

                  // - product description

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
