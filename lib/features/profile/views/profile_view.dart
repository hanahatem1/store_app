import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/features/profile/widgets/container_profile_info.dart';
import 'package:shopping_app/features/profile/widgets/profile_photo.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
     User? user = FirebaseAuth.instance.currentUser;
    return  Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              const SizedBox(height: 50,),
              const ProfilePhoto(),
              const SizedBox(height: 10,),
              Text( user?.displayName ?? 'No name',style:const TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color: AppColors.cardColor),),
              Text(user?.email ?? 'No email',style:const TextStyle(fontSize: 12,color: AppColors.greyColor),),
              const SizedBox(height: 40,),
              const ContainerProfileInfo()
            ],
          ),
        ),
      ),
    );
  }
}