import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/home/widgets/custom_circle_container.dart';

class DetailsBottomBar extends StatelessWidget {
  const DetailsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10,vertical: 24 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.secondryColor),
            child: const Text(
              '+ Add to cart',
              style: TextStyle(fontSize: 18, color: AppColors.cardColor),
            ),
          ),
          const CustomCircleContainer(
              color: AppColors.pinkColor,
              child: Icon(
                Icons.favorite_outline,
                color: Colors.red,
              ))
        ],
      ),
    );
  }
}
