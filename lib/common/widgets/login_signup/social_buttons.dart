import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RSocialButtons extends StatelessWidget {
  const RSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: RColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: RSizes.iconMd,
              height: RSizes.iconMd,
              image: AssetImage(
                RImages.google,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: RSizes.spaceBtnItems,
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: RColors.grey,
            ),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: RSizes.iconMd,
              height: RSizes.iconMd,
              image: AssetImage(
                RImages.fb,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
