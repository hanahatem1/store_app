import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_circle_container.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Find Your',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Favourites product',
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        CustomCircleContainer(
          color: AppColors.cardColor,
          child: Image.asset('assets/images/proicons_bell.png'),
        )
      ],
    );
  }
}
