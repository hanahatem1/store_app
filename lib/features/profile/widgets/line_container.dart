import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 2,
      color: AppColors.greyColor,
    );
  }
}
