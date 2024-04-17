import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/products/cart/c_adjust_cart_qty_btn.dart';
import 'package:duara_ecommerce/common/widgets/products/cart/cart_items.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/p_price_txt.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CCartScreen extends StatelessWidget {
  const CCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
        title: Text(
          'me cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // -- body --
      body: Padding(
        padding: const EdgeInsets.all(
          CSizes.defaultSpace,
        ),
        child: ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) => const SizedBox(
            height: CSizes.spaceBtnSections,
          ),
          itemCount: 4,
          itemBuilder: (_, index) => const Column(
            children: [
              CCartItems(),
              SizedBox(
                height: CSizes.spaceBtnItems,
              ),
              Row(
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
            'checkout Ksh. 25,600'.toUpperCase(),
            style: Theme.of(context).textTheme.labelMedium?.apply(
                  color: CColors.white,
                ),
          ),
        ),
      ),
    );
  }
}
