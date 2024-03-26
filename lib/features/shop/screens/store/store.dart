import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:duara_ecommerce/common/widgets/img_widgets/c_circular_img.dart';
import 'package:duara_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:duara_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/c_brand_title_with_verified_icon.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/enums.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';

class CStoreScreen extends StatelessWidget {
  const CStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CAppBar(
        showBackArrow: true,
        backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
        title: const Text('store'),
        actions: [
          CCartCounterIcon(
            onPressed: () {},
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrollable) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              backgroundColor: isDarkTheme ? CColors.rBrown : CColors.white,
              expandedHeight: 440,
              flexibleSpace: Padding(
                padding: const EdgeInsets.all(CSizes.defaultSpace),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    // -- search bar --
                    const SizedBox(
                      height: CSizes.spaceBtnItems,
                    ),
                    CSearchContainer(
                      text: 'search store',
                      icon: Iconsax.search_favorite,
                      showBg: false,
                      padding: EdgeInsets.zero,
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtnSections,
                    ),

                    // -- featured brands --
                    CSectionHeading(
                      showActionBtn: true,
                      title: 'featured brands',
                      btnTitle: 'view all',
                      btnTxtColor: CColors.darkGrey,
                      onPressed: () {},
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtnItems / 1.5,
                    ),

                    CGridLayout(
                      itemCount: 4,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: CRoundedContainer(
                            padding: const EdgeInsets.all(CSizes.sm),
                            showBorder: true,
                            bgColor: Colors.transparent,
                            child: Row(
                              children: [
                                // icon
                                Flexible(
                                  child: CCircularImg(
                                    isNetworkImg: false,
                                    img: CImages.clothIcon,
                                    bgColor: Colors.transparent,
                                    overlayColor: isDarkTheme
                                        ? CColors.white
                                        : CColors.rBrown,
                                  ),
                                ),

                                const SizedBox(
                                  width: CSizes.spaceBtnItems / 2,
                                ),

                                // text for popular brands
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const CBrandTitleWithVerifiedIcon(
                                        title: 'iPhone 14',
                                        brandTxtSize: CTextSizes.large,
                                      ),
                                      Text(
                                        '200 products',
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(),
      ),
    );
  }
}
