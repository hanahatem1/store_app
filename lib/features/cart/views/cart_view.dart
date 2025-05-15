import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/cart/widgets/custom_card_cart_item.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        title: const Text(
          'Shoppin Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body:const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Column(
          children: [
          CustomCardCartItem()
          ],
        ),
      ),
    );
  }
}
