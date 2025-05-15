import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class CustomContainerCount extends StatelessWidget {
  const CustomContainerCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(24)),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.remove,
              size: 17,
            ),
            Text('1'),
            Icon(
              Icons.add,
              size: 17,
            )
          ],
        ),
      ),
    );
  }
}
