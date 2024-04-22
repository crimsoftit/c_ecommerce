import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/brands/c_brand_cards.dart';
import 'package:duara_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/features/shop/screens/brands/brand_products.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CAllBrandsScreen extends StatelessWidget {
  const CAllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      // -- appBar --
      appBar: CAppBar(
        showBackArrow: true,
        backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
        title: Text(
          'Brands',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // -- body --
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // -- heading --
              const CSectionHeading(
                showActionBtn: false,
                title: 'popular brands',
                btnTitle: '',
                editFontSize: false,
              ),

              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),

              // -- brands grid layout display --
              CGridLayout(
                itemCount: 10,
                mainAxisExtent: 70,
                itemBuilder: (context, index) {
                  return CBrandCard(
                    showBorder: true,
                    onTap: () {
                      Get.to(() => const CBrandProducts());
                    },
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
