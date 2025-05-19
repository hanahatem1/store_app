import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/cart/widgets/custom_container_count.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

class CustomCardCartItem extends StatelessWidget {
  const CustomCardCartItem({super.key, required this.product});
final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Card(
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
                  '\$${product.price}',
                  style:const TextStyle(color: AppColors.secondryColor),
                )
              ],
                       ),
           ),
          const SizedBox(
            width: 30,
          ),
          const CustomContainerCount()
        ],
      ),
    );
  }
}
