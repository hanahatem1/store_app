import 'package:flutter/material.dart';
import 'package:shopping_app/constant/app_colors.dart';
import 'package:shopping_app/features/cart/widgets/custom_container_count.dart';
import 'package:shopping_app/features/home/data/models/product_model.dart';

class CustomCardCartItem extends StatefulWidget {
   CustomCardCartItem({super.key, required this.product,required this.onDismissed});
final ProductModel product;

void Function(DismissDirection)? onDismissed;

  @override
  State<CustomCardCartItem> createState() => _CustomCardCartItemState();
}

class _CustomCardCartItemState extends State<CustomCardCartItem> {
 int count=1;
 void onIncrement(){
   setState(() {
      count++;
    });
 }

 void onDecrement(){
   setState(() {
      if (count > 1) count--;
    });
 }
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.product.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: AppColors.backGroundColor,
        alignment: Alignment.centerRight,
        padding:const EdgeInsets.symmetric(horizontal: 16),
        child: const Icon(Icons.delete,color: AppColors.primaryColor,),
      ),
      onDismissed: widget.onDismissed,
      child: Card(
        color: AppColors.cardColor,
        elevation: 2,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Image.network(
                widget.product.image,
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
                  widget.product.title,
                    style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '\$${(widget.product.price*count).toStringAsFixed(2)}',
                    style:const TextStyle(color: AppColors.secondryColor),
                  )
                ],
                         ),
             ),
            const SizedBox(
              width: 30,
            ),
             CustomContainerCount(count: count, onIncrement:onIncrement,onDecrement: onDecrement,)
          ],
        ),
      ),
    );
  }
}
