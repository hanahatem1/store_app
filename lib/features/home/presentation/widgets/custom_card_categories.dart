import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';

class CustomCardCategories extends StatelessWidget {
  const CustomCardCategories({super.key, required this.title});

final String title;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: AppColors.cardColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side:const BorderSide(color: AppColors.primaryColor)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: Text(title),
      ),
    );
  }
}
