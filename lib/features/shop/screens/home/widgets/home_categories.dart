import 'package:duara_ecommerce/common/widgets/img_txt_widgets/vertical_img_txt.dart';
import 'package:duara_ecommerce/features/shop/screens/subcategories/subcategories.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CHomeCategories extends StatelessWidget {
  const CHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return CVerticalImgTxt(
            img: CImages.electronicsIcon,
            title: 'Electronics',
            txtColor: CColors.txtWhite,
            bgColor: CColors.white,
            onTap: () {
              Get.to(() => const CSubCategoriesScreen());
            },
          );
        },
      ),
    );
  }
}
