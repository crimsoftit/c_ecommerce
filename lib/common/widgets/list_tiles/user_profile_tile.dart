import 'package:duara_ecommerce/common/widgets/img_widgets/c_circular_img.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/image_strings.dart';
import 'package:duara_ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CUserProfileTile extends StatelessWidget {
  const CUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CCircularImg(
        img: CImages.user,
        width: 50.0,
        height: 50.0,
        padding: 10.0,
      ),
      title: Text(
        'Retail Intelligence',
        style: Theme.of(context).textTheme.labelMedium!.apply(
              color: CColors.grey,
            ),
      ),
      subtitle: Text(
        RTexts.homeAppbarSubTitle,
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: CColors.white,
              fontSizeFactor: 0.8,
            ),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: CColors.white,
        ),
      ),
    );
  }
}
