import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/features/auth/sign_in/presentation/views/login_page.dart';

Future<void> showLogoutDialog(BuildContext context) async {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.cardColor,
        title: const Text('Are you sure you want to log out?',style: TextStyle(fontSize: 22),),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); 
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: AppColors.textColor),
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); 

              await FirebaseAuth.instance.signOut(); 

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginPage()),
                (route) => false,
              );
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: AppColors.redColor),
            ),
          ),
        ],
      );
    },
  );
}
