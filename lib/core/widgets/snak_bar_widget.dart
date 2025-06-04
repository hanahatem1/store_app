import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';

class SnakBarWidget {
  static void show(
    BuildContext context, {
    required String title,
  }) {
    Flushbar(
      backgroundColor: AppColors.greyColor,
      messageText: Center(
        child: Text(
          title,
          style: const TextStyle(color: AppColors.primaryColor),
        ),
      ),
      duration: const Duration(seconds: 1),
      borderRadius: BorderRadius.circular(8),
      margin: const EdgeInsets.all(16),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context); 
  }
}
