import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/constant/app_colors.dart';
import 'package:shopping_app/features/cart/data/cart_cubit/cart_cubit.dart';
import 'package:shopping_app/features/cart/presentation/widgets/custom_container_count.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

class CustomCardCartItem extends StatelessWidget {
   CustomCardCartItem({
    super.key,
    required this.product,
    required this.onDismissed,
    required this.quantity
    });
  
final ProductModel product;
void Function(DismissDirection)? onDismissed;
final int quantity;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(product.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: AppColors.backGroundColor,
        alignment: Alignment.centerRight,
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete,color: AppColors.primaryColor,),
      ),
      onDismissed: onDismissed,
      child: Card(
        color: AppColors.cardColor,
        elevation: 2,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Image.network(
                product.image,
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(
              width: 14,
            ),
             Expanded(
               child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                  product.title,
                    style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${(product.price*quantity).toStringAsFixed(2)}',
                    style:const TextStyle(color: AppColors.secondryColor),
                  )
                ],
                         ),
             ),
            const SizedBox(
              width: 30,
            ),
             CustomContainerCount(
              count: quantity,
               onIncrement:(){
                context.read<CartCubit>().updateQuantity(product, quantity+1);
               },
               onDecrement: (){
                context.read<CartCubit>().updateQuantity(product, quantity-1);
               },
               )
          ],
        ),
      ),
    );
  }
}
