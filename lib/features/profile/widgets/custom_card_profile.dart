import 'package:flutter/material.dart';

class CustomCardProfile extends StatelessWidget {
  const CustomCardProfile({super.key, required this.title, required this.child});

final String title;
final Widget child;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            child,
            const SizedBox(
              width: 15,
            ),
             Text(
              title,
              style:const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Icon(
          Icons.arrow_forward_ios,
          size: 16,
        )
      ],
    );
  }
}
