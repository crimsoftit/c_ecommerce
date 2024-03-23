import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150.0,
          //image: AssetImage( isDark ? RImages.darkAppLogo_1 : RImages.lightAppLogo_1),
          image:
              AssetImage(isDark ? CImages.darkAppLogo : CImages.lightAppLogo),
        ),
        Text(
          RTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(
          height: CSizes.sm,
        ),
        Text(
          RTexts.loginSubTitle,
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ],
    );
  }
}
