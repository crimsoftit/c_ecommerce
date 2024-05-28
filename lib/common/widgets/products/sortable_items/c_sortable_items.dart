import 'package:duara_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:duara_ecommerce/common/widgets/products/product_cards/p_card_vert.dart';
import 'package:duara_ecommerce/features/shop/models/product_model.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CSortableItems extends StatelessWidget {
  const CSortableItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        CGridLayout(
          itemCount: 10,
          itemBuilder: (_, index) {
            return CProductCardVertical(
              product: CProductModel.empty(),
            );
          },
        ),
      ],
    );
  }
}
