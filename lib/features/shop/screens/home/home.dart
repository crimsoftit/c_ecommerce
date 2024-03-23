import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:duara_ecommerce/common/widgets/products/product_cards/p_card_vert.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:duara_ecommerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:duara_ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CPrimaryHeaderContainer(
              child: Column(
                children: [
                  // -- ## HOME PAGE APP BAR ## --
                  const CHomeAppBarWidget(),

                  const SizedBox(
                    height: CSizes.spaceBtnSections,
                  ),

                  // -- ## SEARCH BAR ## --
                  CSearchContainer(
                    text: 'search in store ...',
                    icon: Iconsax.search_favorite,
                    onTap: () {},
                  ),

                  const SizedBox(
                    height: CSizes.spaceBtnSections,
                  ),

                  // -- ## ALL ABOUT CATEGORIES ## --
                  const Padding(
                    padding: EdgeInsets.only(
                      left: CSizes.defaultSpace,
                    ),
                    child: Column(
                      children: [
                        // -- category heading --
                        CSectionHeading(
                          showActionBtn: false,
                          title: 'popular categories',
                          txtColor: CColors.white,
                          btnTitle: 'view all',
                          btnTxtColor: CColors.grey,
                        ),
                        SizedBox(
                          height: CSizes.spaceBtnItems,
                        ),

                        // -- categories (ListView.builder) --
                        CHomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // -- ## BODY ## --
            const Padding(
              padding: EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                children: [
                  // -- promo slider --
                  CPromoSlider(
                    banners: [
                      CImages.promoBanner1,
                      CImages.promoBanner2,
                      CImages.promoBanner3,
                    ],
                  ),

                  SizedBox(
                    height: CSizes.spaceBtnSections,
                  ),
                  // -- popular products --
                  CProductCardVertical(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
