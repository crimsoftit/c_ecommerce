import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/img_widgets/c_rounded_img.dart';
import 'package:duara_ecommerce/common/widgets/products/product_cards/p_card_horizontal.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CSubCategoriesScreen extends StatelessWidget {
  const CSubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Scaffold(
      // -- appBar --
      appBar: CAppBar(
        showBackArrow: true,
        backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
        title: Text(
          'Electronics',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),

      // -- body --
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // banner
              const CRoundedImages(
                width: double.infinity,
                imgUrl: CImages.promoBanner5,
                applyImgRadius: true,
              ),
              const SizedBox(
                height: CSizes.spaceBtnSections,
              ),

              // sub-categories
              Column(
                children: [
                  // heading
                  const CSectionHeading(
                    showActionBtn: true,
                    title: 'Electronics',
                    btnTitle: 'view all',
                    editFontSize: false,
                  ),
                  const SizedBox(
                    height: CSizes.spaceBtnItems / 2,
                  ),

                  SizedBox(
                    height: 120.0,
                    child: ListView.separated(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          width: CSizes.spaceBtnItems,
                        );
                      },
                      itemBuilder: (context, index) {
                        return const CProductCardHorizontal();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
