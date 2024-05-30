import 'package:duara_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:duara_ecommerce/common/widgets/products/product_cards/p_card_vert.dart';
import 'package:duara_ecommerce/common/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:duara_ecommerce/features/shop/controllers/product/products_controller.dart';
import 'package:duara_ecommerce/features/shop/models/product_model.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/personalization/screens/no_data/no_data.dart';

class CSortableItems extends StatelessWidget {
  const CSortableItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productsController = Get.put(CProductsController());

    return Column(
      children: [
        // -- dropdown box --
        DropdownButtonFormField(
          hint: const Text(
            'sort by:',
          ),
          decoration: const InputDecoration(
            prefixIcon: Icon(
              Iconsax.sort,
            ),
          ),
          items: [
            'name',
            'higher price',
            'lower price',
            'sale',
            'newest',
            'popularity'
          ]
              .map(
                (option) => DropdownMenuItem(
                  value: option,
                  enabled: true,
                  child: Text(
                    option,
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {},
        ),

        const SizedBox(
          height: CSizes.spaceBtnSections,
        ),

        // -- products --
        Obx(() {
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
                itemCount: 10,
                itemBuilder: (_, index) {
                  return CProductCardVertical(
                    product: CProductModel.empty(),
                  );
                },
              );
            }
          }
        }),
      ],
    );
  }
}
