import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class DetailsBottomBar extends StatelessWidget {
  const DetailsBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:15,vertical: 24 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.secondryColor),
            child: const Text(
              '+ Add to cart',
              style: TextStyle(fontSize: 18, color: AppColors.cardColor),
            ),
          ),
         Image.asset('assets/images/unheart.png',height: 42,width: 42,)
        ],
      ),
    );
  }
}
