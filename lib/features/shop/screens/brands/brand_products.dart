import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/brands/c_brand_cards.dart';
import 'package:duara_ecommerce/common/widgets/products/sortable_items/c_sortable_items.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CBrandProducts extends StatelessWidget {
  const CBrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      // -- appBar --
      appBar: CAppBar(
        showBackArrow: true,
        backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
        title: Text(
          'iPhone 14',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // -- body --
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // -- brand details
              CBrandCard(
                showBorder: true,
              ),
              SizedBox(
                height: CSizes.spaceBtnSections,
              ),

              CSortableItems(),
            ],
          ),
        ),
      ),
    );
  }
}
