import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/home/widgets/minmize_tab.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return StyleProvider(
      style: MinimizedTabStyle(),
      child: ConvexAppBar(
        style: TabStyle.textIn,
        backgroundColor:AppColors.primaryColor,
        items: [
      TabItem(icon: Image.asset('assets/images/home.png'), title: 'Home'),
      TabItem(icon: Image.asset('assets/images/fav.png'), title: 'favourites'),
      TabItem(icon: Image.asset('assets/images/cartt.png'), title: 'cart'),
      TabItem(icon: Image.asset('assets/images/profile.png'), title: 'profile'),
        ],
        initialActiveIndex: currentIndex,
        onTap: onTap,
      ),
    );
  }
}
