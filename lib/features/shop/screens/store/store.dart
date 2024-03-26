import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/appbar/c_tabbar.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:duara_ecommerce/common/widgets/img_widgets/c_circular_img.dart';
import 'package:duara_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:duara_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/c_brand_title_with_verified_icon.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/c_tabbar_headings.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/enums.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CStoreScreen extends StatelessWidget {
  const CStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: isDarkTheme ? CColors.dark : CColors.white,
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrollable) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: isDarkTheme ? CColors.dark : CColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(CSizes.defaultSpace / 2),
                    //padding: const EdgeInsets.all(4.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        // -- search bar --
                        const SizedBox(
                          height: CSizes.spaceBtnItems / 4,
                        ),
                        CSearchContainer(
                          text: 'search store',
                          icon: Iconsax.search_favorite,
                          showBg: false,
                          padding: EdgeInsets.zero,
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: CSizes.spaceBtnSections / 4,
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
                          height: CSizes.spaceBtnItems / 4,
                        ),

                        // -- brands grid layout display --
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
                                      width: CSizes.spaceBtnItems / 8,
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
                                            brandTxtSize: CTextSizes.small,
                                          ),
                                          Text(
                                            '200 products',
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
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

                  // tabbed menu
                  bottom: const CTabBar(
                    tabs: [
                      Tab(
                        child: CTabMenuHeadings(
                          title: 'furniture',
                        ),
                      ),
                      Tab(
                        child: CTabMenuHeadings(
                          title: 'sports',
                        ),
                      ),
                      Tab(
                        child: CTabMenuHeadings(
                          title: 'clothes',
                        ),
                      ),
                      Tab(
                        child: CTabMenuHeadings(
                          title: 'electronics',
                        ),
                      ),
                      Tab(
                        child: CTabMenuHeadings(
                          title: 'cosmetics',
                        ),
                      ),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(CSizes.defaultSpace),
                  child: Column(
                    children: [
                      // -- brands --
                      CRoundedContainer(
                        showBorder: true,
                        borderColor: CColors.rBrown,
                        bgColor: Colors.transparent,
                        margin: const EdgeInsets.only(
                          bottom: CSizes.spaceBtnItems,
                        ),
                        child: Column(
                          children: [

                            // brand with products count
                            const CBrandCard

                            // brand top 3 product images
                          ],
                        ),
                      ),

                      // -- products --
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
