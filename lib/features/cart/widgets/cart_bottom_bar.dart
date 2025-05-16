import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/cart/widgets/custom_button_cart.dart';

class CartBottomBar extends StatelessWidget {
  const CartBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        width: double.infinity,
        decoration:const BoxDecoration(
          color: AppColors.cardColor
        ),
        child:const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('subtotal',style: TextStyle(fontSize: 16),),
                  Text('\$361',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('(Total doesn\'t included shipping)',style: TextStyle(color: AppColors.primaryColor,fontSize: 12),),
                  ],
                ),
                 SizedBox(height: 25,),
                 CustomButtonCart(text: 'Checkout',color1: AppColors.greyColor,color2: AppColors.primaryColor,colorText: AppColors.cardColor,),
                 SizedBox(height: 10,),
                 CustomButtonCart(text: 'Checkout with InstaPay',color1: AppColors.textColor,color2: AppColors.cardColor,colorText: AppColors.textColor,),
                 SizedBox(height: 10,),
                 CustomButtonCart(text: 'Continue shopping',color1: AppColors.cardColor,color2: AppColors.cardColor,colorText: AppColors.textColor,),
                SizedBox(height: 10,)
            ],
          ),
        ),
      );
  }
}