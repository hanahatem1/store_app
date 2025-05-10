import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 320,
      child: TextField(
        cursorColor: AppColors.greyColor,
        decoration: InputDecoration(
            hintText: 'Search product',
            hintStyle:const TextStyle(color: AppColors.greyColor),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(9),
              child: Image.asset(
                'assets/images/search.png',
              ),
            ),
            fillColor: AppColors.cardColor,
            contentPadding:const EdgeInsets.symmetric(vertical: 9),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide:const BorderSide(color: AppColors.greyColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide:const BorderSide(color: AppColors.greyColor),
            )),
      ),
    );
  }
}
