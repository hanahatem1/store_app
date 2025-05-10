import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class CustomCircleContainer extends StatelessWidget {
  const CustomCircleContainer({super.key, required this.color, required this.child});

final Color color;
final Widget child; 
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          boxShadow: [
            BoxShadow(
                color: AppColors.textColor.withOpacity(.1),
                spreadRadius: 2,
                blurRadius: 6,
                offset:const Offset(0, 3))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: child
      ),
    );
  }
}
