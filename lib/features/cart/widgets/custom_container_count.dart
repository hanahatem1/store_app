import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class CustomContainerCount extends StatelessWidget {
  final int count;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const CustomContainerCount({
    super.key,
    required this.count,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.backGroundColor,
          borderRadius: BorderRadius.circular(24)),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
        child: Row(
          children: [
            GestureDetector(
              onTap: count > 1 ? onDecrement :null,
              child: const Icon(
                Icons.remove,
                size: 17,
              ),
            ),
            const SizedBox(width: 3,),
            Text(count.toString()),
            const SizedBox(width: 3,),
            GestureDetector(
              onTap: onIncrement,
              child: const Icon(
                Icons.add,
                size: 17,
              ),
            )
          ],
        ),
      ),
    );
  }
}
