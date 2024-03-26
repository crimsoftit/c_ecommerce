// ignore_for_file: unrelated_type_equality_checks

import 'package:carousel_slider/carousel_slider.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:duara_ecommerce/common/widgets/img_widgets/c_rounded_img.dart';
import 'package:duara_ecommerce/features/shop/controllers/home_controller.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CPromoSlider extends StatelessWidget {
  const CPromoSlider({
    super.key,
    required this.banners,
  });

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            onPageChanged: (index, _) {
              homeController.updatePageIndicator(index);
            },
          ),
          items: banners
              .map((iUrl) => CRoundedImages(
                    imgUrl: iUrl,
                  ))
              .toList(),
        ),
        const SizedBox(
          height: CSizes.spaceBtnItems,
        ),
        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  CCircularContainer(
                    width: 20.0,
                    height: 4.0,
                    margin: const EdgeInsets.only(
                      right: 10.0,
                    ),
                    bgColor: homeController.carouselCurrentIndex == i
                        ? CColors.rBrown
                        : CColors.grey,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
