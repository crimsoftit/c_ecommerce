import 'package:duara_ecommerce/common/widgets/appbar/appbar.dart';
import 'package:duara_ecommerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CHomeAppBarWidget extends StatelessWidget {
  const CHomeAppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return CAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            CTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelMedium!.apply(
                  color: CColors.grey,
                ),
          ),
          Text(
            currentUser!.email ?? '',
            style: Theme.of(context).textTheme.headlineSmall!.apply(
                  color: CColors.white,
                  fontSizeFactor: 0.7,
                ),
          ),
        ],
      ),
      actions: const [
        // -- cart counter icon --
        CCartCounterIcon(
          iconColor: Colors.white,
        ),
      ],
    );
  }
}
