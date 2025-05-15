import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/cart/widgets/custom_container_count.dart';

class CustomCardCartItem extends StatelessWidget {
  const CustomCardCartItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      elevation: 2,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Image.asset(
              'assets/images/b.jpg',
              height: 120,
              width: 120,
            ),
          ),
          const SizedBox(
            width: 14,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bijama set',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '\$49',
                style: TextStyle(color: AppColors.secondryColor),
              )
            ],
          ),
          const SizedBox(
            width: 50,
          ),
          const CustomContainerCount()
        ],
      ),
    );
  }
}
