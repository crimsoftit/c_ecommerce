import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/features/shop/screens/cart/widgets/all_cart_items.dart';
import 'package:duara_ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: const Padding(
        padding: EdgeInsets.all(
          CSizes.defaultSpace,
        ),

        // -- list cart items
        child: CCartItemsList(),
      ),

      // -- checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(() => const CCheckoutScreen());
          },
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
