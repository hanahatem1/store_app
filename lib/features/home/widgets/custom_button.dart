import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.primaryColor),
      ),
      child: const Center(
        child: Text(
          '+ Add to cart',
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
