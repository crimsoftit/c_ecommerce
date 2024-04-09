import 'package:duara_ecommerce/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:duara_ecommerce/utils/constants/colors.dart';
import 'package:duara_ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CChoiceChip extends StatelessWidget {
  const CChoiceChip({
    super.key,
    required this.txt,
    required this.selected,
    this.onSelected,
    this.selectedColor,
    this.disabledColor,
  });

  final String txt;
  final bool selected;
  final Color? selectedColor, disabledColor;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColored = CHelperFunctions.getColor(txt) != null;
    return ChoiceChip(
      label: isColored ? const SizedBox() : Text(txt),
      selected: selected,

      labelStyle: TextStyle(
        color: selected ? CColors.white : null,
      ),

      // disabledColor: disabledColor,
      avatar: isColored
          ? CCircularContainer(
              width: 50.0,
              height: 50.0,
              bgColor: CHelperFunctions.getColor(txt)!,
            )
          : null,
      labelPadding: isColored ? const EdgeInsets.all(0) : null,
      padding: isColored ? const EdgeInsets.all(0) : null,
      shape: isColored ? const CircleBorder() : null,
      backgroundColor:
          isColored ? CHelperFunctions.getColor(txt) : Colors.transparent,
      //selectedColor: selectedColor,
      onSelected: onSelected,
    );
  }
}
