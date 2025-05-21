import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/core/snak_bar_widget.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_state.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return  BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartUpdated && state.items.contains(product)) {
          SnakBarWidget.show(context,title: 'Product added to cart');
        }
      },
    child:GestureDetector(
      onTap: (){
         context.read<CartCubit>().addToCart(product);
    
      },
      child: Container(
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: const Center(
          child: Text(
            '+ Add to cart',
            style: TextStyle(
              color: AppColors.primaryColor,
              fontSize: 12,
            ),
          ),
        ),
      ),
    )
    );
  }
}
