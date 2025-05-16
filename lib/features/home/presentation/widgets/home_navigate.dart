import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/cart/views/cart_view.dart';
import 'package:shopping_app/features/favourites/views/favourites_view.dart';
import 'package:shopping_app/features/home/presentation/views/home_page.dart';
import 'package:shopping_app/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:shopping_app/features/profile/views/profile_view.dart';

class HomeNavigate extends StatefulWidget {
  const HomeNavigate({super.key});

  @override
  State<HomeNavigate> createState() => _HomeNavigateState();
}

class _HomeNavigateState extends State<HomeNavigate> {
   int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),   
    const FavouritesView(),
    const CartView(),
    const ProfileView(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}