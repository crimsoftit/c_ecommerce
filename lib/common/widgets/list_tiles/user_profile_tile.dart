import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
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
      leading: CRoundedContainer(
        showBorder: true,
        radius: 120,
        borderColor: CColors.rBrown.withOpacity(0.3),
        child: const CCircularImg(
          img: CImages.user,
          width: 47.0,
          height: 47.0,
          //padding: 10.0,
        ),
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
              fontSizeFactor: 0.6,
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
