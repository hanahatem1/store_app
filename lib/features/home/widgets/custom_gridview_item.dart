import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class CustomGridviewItem extends StatelessWidget {
  const CustomGridviewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/b.jpg',
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'Bijama',
              style: TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: AppColors.primaryColor)),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Text(
                      '+ Add to cart ',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  '\$49',
                  style: TextStyle(
                      color: AppColors.secondryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
