import 'package:duara_ecommerce/common/widgets/chips/c_choice_chip.dart';
import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/p_price_txt.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/product_title_texts.dart';
import 'package:duara_ecommerce/common/widgets/text_widgets/section_headings.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/constants/sizes.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CProductAttributes extends StatelessWidget {
  const CProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = CHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        // -- selected pricing & description attributes --
        CRoundedContainer(
          padding: const EdgeInsets.all(CSizes.md),
          bgColor: isDarkTheme ? CColors.darkGrey : CColors.grey,
          child: Column(
            children: [
              // -- title, price, and stock status
              Row(
                children: [
                  const CSectionHeading(
                    showActionBtn: false,
                    title: 'variation',
                    btnTitle: '',
                    editFontSize: true,
                    fSize: 10.0,
                  ),
                  const SizedBox(
                    width: CSizes.spaceBtnItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const CProductTitleText(
                            title: 'price  :',
                            //smallSize: true,
                          ),
                          const SizedBox(
                            width: CSizes.spaceBtnItems,
                          ),
                          Text(
                            'ksh.2500',
                            style:
                                Theme.of(context).textTheme.labelSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.redAccent,
                                      fontStyle: FontStyle.italic,
                                    ),
                          ),
                          const SizedBox(
                            width: CSizes.spaceBtnItems / 4,
                          ),

                          // sale price
                          const CProductPriceText(
                            price: '2000',
                            isLarge: true,
                          ),
                        ],
                      ),

                      // stock status
                      Row(
                        children: [
                          const CProductTitleText(
                            title: 'status:',
                          ),
                          const SizedBox(
                            width: CSizes.spaceBtnItems,
                          ),
                          Text(
                            'in stock',
                            style:
                                Theme.of(context).textTheme.titleMedium!.apply(
                                      fontSizeFactor: 0.7,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              // -- product variation description
              const SizedBox(
                height: CSizes.spaceBtnItems,
              ),
              const CProductTitleText(
                title:
                    'this is the description of the product and it can cover up to a maximum of 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),

        const SizedBox(
          height: CSizes.spaceBtnItems,
        ),

        // -- product attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CSectionHeading(
              showActionBtn: false,
              title: 'Colors',
              btnTitle: '',
              editFontSize: false,
            ),
            const SizedBox(
              height: CSizes.spaceBtnItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                CChoiceChip(
                  txt: 'green',
                  selected: false,
                  onSelected: (value) {},
                ),
                CChoiceChip(
                  txt: 'blue',
                  selected: true,
                  onSelected: (value) {},
                ),
                CChoiceChip(
                  txt: 'brown',
                  selected: false,
                  onSelected: (value) {},
                ),
                CChoiceChip(
                  txt: 'orange',
                  selected: false,
                  onSelected: (value) {},
                ),
                CChoiceChip(
                  txt: 'pink',
                  selected: false,
                  onSelected: (value) {},
                ),
                CChoiceChip(
                  txt: 'purple',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),

        const SizedBox(
          height: CSizes.spaceBtnSections / 2,
        ),

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CSectionHeading(
              showActionBtn: false,
              title: 'Sizes',
              btnTitle: '',
              editFontSize: false,
            ),
            const SizedBox(
              height: CSizes.spaceBtnItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                CChoiceChip(
                  txt: 'eu 34',
                  selected: false,
                  onSelected: (value) {},
                ),
                CChoiceChip(
                  txt: 'eu 37',
                  selected: false,
                  onSelected: (value) {},
                ),
                CChoiceChip(
                  txt: 'eu 41',
                  selected: true,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
