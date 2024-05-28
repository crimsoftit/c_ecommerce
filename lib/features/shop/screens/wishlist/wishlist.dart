import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:duara_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:duara_ecommerce/common/widgets/products/product_cards/p_card_vert.dart';
import 'package:duara_ecommerce/features/shop/controllers/products_controller.dart';
import 'package:duara_ecommerce/features/shop/models/product_model.dart';
import 'package:duara_ecommerce/features/shop/screens/home/home.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    final productsController = Get.put(CProductsController());

    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
        title: Text(
          'wishlist',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          CCircularIcon(
            icon: Iconsax.add,
            color: isDarkTheme ? CColors.white : CColors.rBrown,
            onPressed: () {
              Get.to(const HomeScreen());
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              CGridLayout(
                itemCount: 4,
                itemBuilder: (_, index) {
                  return CProductCardVertical(
                    product: CProductModel.empty(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
