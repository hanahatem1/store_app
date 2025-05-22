import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/widgets/custom_button_cart.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    final total= context.watch<CartCubit>().totalPrice;
    return Container(
        width: double.infinity,
        decoration:const BoxDecoration(
          color: AppColors.cardColor
        ),
        child:Padding(
          padding:const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('subtotal',style: TextStyle(fontSize: 16),),
                  Text('\$${total.toStringAsFixed(2)}',style:const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('(Total doesn\'t included shipping)',style: TextStyle(color: AppColors.primaryColor,fontSize: 12),),
                  ],
                ),
                 const SizedBox(height: 25,),
                 const CustomButtonCart(text: 'Checkout',color1: AppColors.greyColor,color2: AppColors.primaryColor,colorText: AppColors.cardColor,),
                 const SizedBox(height: 10,),
                 const CustomButtonCart(text: 'Checkout with InstaPay',color1: AppColors.textColor,color2: AppColors.cardColor,colorText: AppColors.textColor,),
                 const SizedBox(height: 10,),
                 const CustomButtonCart(text: 'Continue shopping',color1: AppColors.cardColor,color2: AppColors.cardColor,colorText: AppColors.textColor,),
                const SizedBox(height: 10,)
            ],
          ),
        ),
      );
  }
}