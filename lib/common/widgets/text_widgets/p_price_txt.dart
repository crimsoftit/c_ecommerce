import 'package:flutter/material.dart';

class CProductPriceText extends StatelessWidget {
  const CProductPriceText({
    super.key,
    this.currencySymbol = 'ksh. ',
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.lineThrough = false,
  });

  final String currencySymbol, price;
  final int maxLines;
  final bool isLarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySymbol + price,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
                fontSizeFactor: 0.6,
              )
          : Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null,
                fontSizeFactor: 0.9,
              ),
    );
  }
}
