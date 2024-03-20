import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class CHomeAppBarWidget extends StatelessWidget {
  const CHomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            RTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: RColors.grey,
                ),
          ),
          Text(
            RTexts.homeAppbarSubTitle,
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: RColors.white,
                ),
          ),
        ],
      ),
      actions: [
        // -- cart counter icon --
        CCartCounterIcon(
          onPressed: () {},
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
