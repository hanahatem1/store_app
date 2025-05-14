import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/home/widgets/custom_circle_container.dart';

class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          'assets/images/b.jpg',
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
      const Positioned(
          top: 9,
          left: 6,
          child: CustomCircleContainer(
              color: AppColors.cardColor,
              child: Padding(
                padding: EdgeInsets.only(left: 4),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                ),
              )))
    ]);
  }
}
