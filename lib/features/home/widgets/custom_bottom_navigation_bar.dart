import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar(
      style: TabStyle.textIn,
      backgroundColor:AppColors.primaryColor,
      items:const [
    TabItem(icon: Icons.home, title: 'Home'),
    TabItem(icon: Icons.favorite, title: 'favourites'),
    TabItem(icon: Icons.shopping_bag, title: 'cart'),
    TabItem(icon: Icons.person, title: 'profile'),
      ],
      initialActiveIndex: currentIndex,
      onTap: onTap,
    );
  }
}