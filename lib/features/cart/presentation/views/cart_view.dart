import 'package:flutter/material.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:shopping_app/features/cart/presentation/widgets/custom_listview_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          'Shopping Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: CustomListviewCart(),
      ),
      bottomNavigationBar:const CartBottomBar()
    );
  }
}
