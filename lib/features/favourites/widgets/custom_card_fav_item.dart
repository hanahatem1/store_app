import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_button.dart';

class CustomCardFavItem extends StatelessWidget {
  const CustomCardFavItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Row(
          children: [
            Image.asset(
              'assets/images/b.jpg',
              height: 120,
              width: 120,
            ),
            const SizedBox(
              width: 14,
            ),
            Column(
              children: [
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bijama set',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
                      width: 90,
                    ),
                    Image.asset(
                      'assets/images/heart.png',
                      height: 30,
                      width: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
                const CustomButton()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
