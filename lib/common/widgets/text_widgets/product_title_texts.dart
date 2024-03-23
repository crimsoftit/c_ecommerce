import 'package:flutter/material.dart';

class CProductTitleText extends StatelessWidget {
  const CProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.txtAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign? txtAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelSmall
          : Theme.of(context).textTheme.labelMedium,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: txtAlign,
    );
  }
}
