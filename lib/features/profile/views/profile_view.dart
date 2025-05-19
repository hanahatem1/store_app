import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/profile/widgets/container_profile_info.dart';
import 'package:shopping_app/features/profile/widgets/profile_photo.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.secondbackGroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              SizedBox(height: 70,),
              ProfilePhoto(),
              SizedBox(height: 10,),
              Text('Hana Hatem',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
              Text('hanahatem@gmail.com',style: TextStyle(fontSize: 12,color: AppColors.primaryColor),),
              SizedBox(height: 60,),
              ContainerProfileInfo()
            ],
          ),
        ),
      ),
    );
  }
}