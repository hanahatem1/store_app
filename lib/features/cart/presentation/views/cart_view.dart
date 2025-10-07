import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/widgets/cart_bottom_bar.dart';
import 'package:shopping_app/features/cart/presentation/widgets/custom_listview_cart.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().loadCart();
  }

  @override
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
