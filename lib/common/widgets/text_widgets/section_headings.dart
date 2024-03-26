import 'package:flutter/material.dart';

class CSectionHeading extends StatelessWidget {
  const CSectionHeading({
    super.key,
    this.txtColor,
    required this.showActionBtn,
    required this.title,
    required this.btnTitle,
    this.onPressed,
    this.btnTxtColor,
  });

  final Color? txtColor, btnTxtColor;
  final bool showActionBtn;
  final String title, btnTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: txtColor,
                fontSizeFactor: 0.75,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionBtn)
          TextButton(
            onPressed: onPressed,
            child: Text(
              btnTitle,
              style: TextStyle(
                color: btnTxtColor,
                fontFamily: 'Poppins',
              ),
            ),
          ),
      ],
    );
  }
}
