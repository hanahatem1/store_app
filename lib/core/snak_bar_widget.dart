import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class SnakBarWidget  {
  static void show(
    BuildContext context,{
    required String title
    })
    {
     ScaffoldMessenger.of(context).showSnackBar(    
     SnackBar(
      backgroundColor: AppColors.greyColor,
      content: Center(
          child: Text(
        title,
        style:const TextStyle(color: AppColors.primaryColor),
      )),
      duration:const Duration(seconds: 1),
    )
    );
  }
}