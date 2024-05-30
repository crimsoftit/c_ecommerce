import 'package:duara_ecommerce/common/widgets/brands/brands_showcase.dart';
import 'package:duara_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:duara_ecommerce/common/widgets/products/product_cards/p_card_vert.dart';
import 'package:duara_ecommerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/features/personalization/screens/no_data/no_data.dart';
import 'package:duara_ecommerce/features/shop/controllers/product/products_controller.dart';
import 'package:duara_ecommerce/features/shop/models/categories_model.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CCategoriesTab extends StatelessWidget {
  const CCategoriesTab({
    super.key,
    required this.category,
  });

  final CCategoriesModel category;

  @override
  Widget build(BuildContext context) {
    final productsController = Get.put(CProductsController());

    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // -- brands --
              const CBrandedShowcase(
                productImages: [
                  CImages.pImg26,
                  CImages.pImg27,
                  CImages.pImg28,
                ],
              ),

              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),

              // -- products --
              CSectionHeading(
                showActionBtn: true,
                title: 'you might also like ...',
                btnTitle: 'view all',
                editFontSize: false,
                onPressed: () {},
              ),
              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: // -- popular products grid display --
                    Obx(
                  () {
                    if (productsController.isLoading.value) {
                      return const CVerticalProductShimmer(itemCount: 4);
                    } else {
                      if (productsController.featuredProducts.isEmpty) {
                        return const Center(
                          child: NoDataScreen(
                            image: CImages.noData,
                            txt: 'No data found!',
                          ),
                        );
                      } else {
                        return CGridLayout(
                          itemCount: productsController.featuredProducts.length,
                          itemBuilder: (_, index) {
                            return CProductCardVertical(
                              product:
                                  productsController.featuredProducts[index],
                            );
                          },
                        );
                      }
                    }
                  },
                ),
              ),
              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
