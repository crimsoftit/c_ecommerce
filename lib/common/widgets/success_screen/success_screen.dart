import 'package:duara_ecommerce/common/styles/spacing_styles.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: RSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              // -- header image --
              Lottie.asset(
                image,
                width: MediaQuery.of(context).size.width * 0.8,
              ),

              const SizedBox(
                height: CSizes.spaceBtnSections,
              ),

              // -- title & subtitle --
              Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),
              Text(
                'crimsoftit@gmail.com',
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: CColors.darkerGrey,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),
              Text(
                subTitle,
                style: Theme.of(context).textTheme.labelMedium!.apply(
                      color: CColors.darkGrey,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: CSizes.spaceBtnSections,
              ),

              // -- buttons --
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(
                    'CONTINUE',
                    style: Theme.of(context).textTheme.labelMedium?.apply(
                          color: CColors.white,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
