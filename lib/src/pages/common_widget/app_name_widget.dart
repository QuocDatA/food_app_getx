import 'package:flutter/material.dart';

import '../../config/custom_colors.dart';

class AppNameWidget extends StatelessWidget {

  final Color? greenTitleColor;
  final double textSize;

  const AppNameWidget({
    super.key,
    this.greenTitleColor,
    this.textSize = 30
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: const TextStyle(
          fontSize: 25,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(
              color: greenTitleColor ?? CustomColor.customSwatchColor,
              fontWeight: FontWeight.bold
            )
          ),
          TextSpan(
            text: 'grocer',
            style: TextStyle(
              color: CustomColor.customContrasColor,
              fontWeight: FontWeight.bold
            )
          ),
        ]
      )
    );
  }
}