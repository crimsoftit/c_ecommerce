import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({
    super.key,
    required this.image,
    required this.txt,
  });

  final String image, txt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // -- image --
            Lottie.asset(
              CImages.noDataLottie,
              width: 130,
              height: 130,
            ),

            const SizedBox(
              height: CSizes.spaceBtnSections / 8,
            ),

            // -- text --
            Text(
              txt,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: CSizes.spaceBtnSections / 8,
            ),
          ],
        ),
      ),
    );
  }
}
