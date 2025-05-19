import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/profile/widgets/custom_card_profile.dart';
import 'package:shopping_app/features/profile/widgets/line_container.dart';

class ContainerProfileInfo extends StatelessWidget {
  const ContainerProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration:const BoxDecoration(
          color: AppColors.cardColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 30),
        child: Column(
          children: [
           CustomCardProfile(title: 'Edit Profile',child: Image.asset('assets/images/editprofile.png'),),
            const SizedBox(height: 15,),
           CustomCardProfile(title: 'My status',child: Image.asset('assets/images/status.png'),),
            const SizedBox(height: 15,),
           CustomCardProfile(title: 'Settings',child: Image.asset('assets/images/settings.png'),),
           const SizedBox(height: 15,),
           CustomCardProfile(title: 'Languages',child: Image.asset('assets/images/language.png'),),
           const SizedBox(height: 25,),
           const LineContainer(),
          const SizedBox(height: 15,),
           CustomCardProfile(title: 'Invite a friend',child: Image.asset('assets/images/invinte friend.png'),),
           const SizedBox(height: 15,),
           CustomCardProfile(title: 'Help',child: Image.asset('assets/images/help.png'),),   
           const SizedBox(height: 40,),
          ],
        ),
      ),
    );
  }
}
