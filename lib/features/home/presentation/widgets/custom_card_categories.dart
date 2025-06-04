import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';

class CustomCardCategories extends StatelessWidget {
  const CustomCardCategories({super.key, required this.title, required this.isSelected,required this.onTap});

final String title;
final bool isSelected;
final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Card(
        elevation: 1,
        color: isSelected ? AppColors.primaryColor : AppColors.cardColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side:const BorderSide(color: AppColors.primaryColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
          child: Text(
            title,
            style: TextStyle(
              color: isSelected ? AppColors.cardColor : AppColors.primaryColor
            ),
            ),
        ),
      ),
    );
  }
}
