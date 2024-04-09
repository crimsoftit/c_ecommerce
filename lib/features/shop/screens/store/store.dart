import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/appbar/c_tabbar.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:duara_ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:duara_ecommerce/common/widgets/brands/c_brand_cards.dart';
import 'package:duara_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/c_tabbar_headings.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/features/shop/screens/store/widgets/categories_tab.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
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
          title: Text(
            'store',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
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
                          editFontSize: false,
                        ),
                        const SizedBox(
                          height: CSizes.spaceBtnItems / 4,
                        ),

                        // -- brands grid layout display --
                        CGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const CBrandCard(
                              showBorder: true,
                            );
                          },
                        ),

                        const SizedBox(
                          height: CSizes.spaceBtnItems / 4,
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
            body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                CCategoriesTab(),
                CCategoriesTab(),
                CCategoriesTab(),
                CCategoriesTab(),
                CCategoriesTab(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
