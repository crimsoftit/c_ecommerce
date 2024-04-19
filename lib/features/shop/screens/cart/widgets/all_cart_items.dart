import 'package:duara_ecommerce/common/widgets/products/cart/c_adjust_cart_qty_btn.dart';
import 'package:duara_ecommerce/common/widgets/products/cart/single_cart_item.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/p_price_txt.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CCartItemsList extends StatelessWidget {
  const CCartItemsList({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(
        height: CSizes.spaceBtnSections,
      ),
      itemCount: 4,
      itemBuilder: (_, index) => Column(
        children: [
          // single cart item widget
          const CSingleCartItem(),

          if (showAddRemoveButtons)
            const SizedBox(
              height: CSizes.spaceBtnItems,
            ),
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // some extra space
                    SizedBox(
                      width: 75.0,
                    ),

                    // add & remove items from cart button
                    CAdjustPQtyBtnWidget(),
                  ],
                ),
                CProductPriceText(
                  price: '25600',
                ),
              ],
            ),
        ],
      ),
    );
  }
}
