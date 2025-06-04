import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/features/profile/widgets/container_profile_info.dart';
import 'package:shopping_app/features/profile/widgets/profile_photo.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              SizedBox(height: 50,),
              ProfilePhoto(),
              SizedBox(height: 10,),
              Text('Hana Hatem',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: AppColors.cardColor),),
              Text('hanahatem@gmail.com',style: TextStyle(fontSize: 12,color: AppColors.greyColor),),
              SizedBox(height: 40,),
              ContainerProfileInfo()
            ],
          ),
        ),
      ),
    );
  }
}