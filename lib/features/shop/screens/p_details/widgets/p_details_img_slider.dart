import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:duara_ecommerce/common/widgets/icons/circular_icon.dart';
import 'package:duara_ecommerce/common/widgets/img_widgets/c_rounded_img.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CProductImgSlider extends StatelessWidget {
  const CProductImgSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);
    return CCurvedEdgeWidget(
      child: Container(
        color: isDarkTheme ? CColors.rBrown : CColors.light,
        child: Stack(
          children: [
            // main large image
            const SizedBox(
              height: 400.0,
              child: Padding(
                padding: EdgeInsets.all(CSizes.pImgRadius * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(CImages.pImg5),
                  ),
                ),
              ),
            ),

            // image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: CSizes.defaultSpace,
              child: SizedBox(
                height: 100.0,
                child: ListView.separated(
                  itemCount: 8,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (_, __) {
                    return const SizedBox(
                      width: CSizes.spaceBtnItems,
                    );
                  },
                  itemBuilder: (_, index) {
                    return CRoundedImages(
                      width: 100.0,
                      //height: 80.0,
                      bgColor: isDarkTheme ? CColors.dark : CColors.white,
                      border: Border.all(
                        color: CColors.rBrown.withOpacity(0.1),
                      ),
                      borderRadius: 100,
                      padding: const EdgeInsets.all(CSizes.sm),
                      imgUrl: CImages.pImg2,
                    );
                  },
                ),
              ),
            ),

            // -- appBar icons --
            CAppBar(
              showBackArrow: true,
              backIconColor: isDarkTheme ? CColors.white : CColors.rBrown,
              actions: const [
                CCircularIcon(
                  icon: Iconsax.heart5,
                  color: Colors.red,
                  bgColor: CColors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
