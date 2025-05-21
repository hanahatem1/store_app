import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_state.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

class ButtonDetails extends StatelessWidget {
  const ButtonDetails({super.key, required this.product});
  
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartUpdated && state.items.contains(product)) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
              behavior: SnackBarBehavior.floating,
              margin:const EdgeInsets.only(bottom: 250.0, left: 100, right: 100),
               dismissDirection: DismissDirection.none,
                shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
              content:const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(child: Text('product added to cart')),
                ],
              )),
          );
        }
      },
      child: GestureDetector(
        onTap: () {
          context.read<CartCubit>().addToCart(product);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.secondryColor,
          ),
          child: const Text(
            '+ Add to cart',
            style: TextStyle(fontSize: 18, color: AppColors.cardColor),
          ),
        ),
      ),
    );
  }
}
