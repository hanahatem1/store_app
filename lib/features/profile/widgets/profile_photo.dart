import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        const SizedBox(
          height: 110,
          width: 110,
          child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/picture.jpg')),
        ),
        Positioned(
            bottom: 10,
            right: 3,
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.backGroundColor,
              ),
              child:const Padding(
                padding: EdgeInsets.all(4),
                child: Icon(Icons.add_a_photo_outlined, size: 15),
              ),
            ))
      ]),
    );
  }
}
