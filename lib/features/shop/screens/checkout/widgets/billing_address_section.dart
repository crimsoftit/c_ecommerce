import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CBillingAddressSection extends StatelessWidget {
  const CBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CSectionHeading(
          showActionBtn: true,
          title: 'shipping address',
          btnTitle: 'change',
          editFontSize: true,
          //fSize: 13.0,
          onPressed: () {},
        ),
        Row(
          children: [
            Icon(
              Icons.verified_user,
              color:
                  isDarkTheme ? CColors.white : CColors.rBrown.withOpacity(0.5),
              size: 16.0,
            ),
            const SizedBox(
              width: CSizes.spaceBtnItems,
            ),
            Text(
              'Crimsoft Inc.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBtnItems / 2,
        ),
        Row(
          children: [
            Icon(
              Icons.phone,
              color:
                  isDarkTheme ? CColors.white : CColors.rBrown.withOpacity(0.5),
              size: 16.0,
            ),
            const SizedBox(
              width: CSizes.spaceBtnItems,
            ),
            Text(
              '(+254) 746 683 785',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: CSizes.spaceBtnItems / 2,
        ),
        Row(
          children: [
            Icon(
              Icons.location_history,
              color:
                  isDarkTheme ? CColors.white : CColors.rBrown.withOpacity(0.5),
              size: 16.0,
            ),
            const SizedBox(
              width: CSizes.spaceBtnItems,
            ),
            Expanded(
              child: Text(
                'Lakerz Estate, Kisumu 40100, Kenya',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
