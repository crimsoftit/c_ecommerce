import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:duara_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
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
                    CRoundedContainer(
                      padding: const EdgeInsets.all(CSizes.sm),
                      showBorder: true,
                      bgColor: Colors.transparent,
                      child: Row(
                        children: [
                          // icon
                          CCircularImg(
                            isNetworkImg: false,
                            img: CImages.clothIcon,
                            bgColor: Colors.transparent,
                            overlayColor:
                                isDarkTheme ? CColors.white : CColors.rBrown,
                          ),
                        ],
                      ),
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

class CCircularImg extends StatelessWidget {
  const CCircularImg({
    super.key,
    this.fit = BoxFit.cover,
    required this.img,
    this.isNetworkImg = false,
    this.overlayColor,
    this.bgColor,
    this.width = 56.0,
    this.height = 56.0,
    this.padding = CSizes.sm,
  });

  final BoxFit? fit;
  final String img;
  final bool isNetworkImg;
  final Color? overlayColor, bgColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: isDarkTheme ? CColors.rBrown : CColors.white,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImg
              ? NetworkImage(img)
              : AssetImage(img) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
